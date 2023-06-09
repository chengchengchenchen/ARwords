//
//  ViewController.swift
//  ARwords
//
//  Created by qjc on 2023/6/9.
//

import ARKit
import RealityKit
import SceneKit
import Combine
import SwiftUI
class ViewController: UIViewController, ARSessionDelegate {
    @Binding var modelCount: Int // 声明一个@Binding变量来接收modelCount变量
    @Binding var type: Int
    @Binding var wordBook: WordBookP
    var models:[Entity]=[]
    //模型向单词ID的映射
    var dict = [ModelEntity: Int]()
    
    
    var arView:ARView{
        return self.view as! ARView
    }
//     Load audio files
    let audioPick = try! AudioFileResource.load(named: "pick.wav", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
    let audioPlace = try! AudioFileResource.load(named: "place.wav", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
    
    init(modelCount: Binding<Int>, type: Binding<Int>, wordBook: Binding<WordBookP>) { // 初始化时接收modelCount变量
        self._modelCount = modelCount
        self._type = type
        self._wordBook = wordBook
        super.init(nibName: nil, bundle: nil)
    }
       
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        self.view = ARView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.session.delegate = self
        arView.environment.sceneUnderstanding.options = []
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        arView.environment.sceneUnderstanding.options.insert(.physics)
        //arView.debugOptions.insert(.showSceneUnderstanding)
        arView.renderOptions = [.disablePersonOcclusion, .disableDepthOfField, .disableMotionBlur]
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .mesh
        configuration.environmentTexturing = .automatic
        configuration.isLightEstimationEnabled=true
        configuration.planeDetection=[.horizontal,.vertical]
        arView.session.run(configuration)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        arView.addGestureRecognizer(tapRecognizer)
        
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: arView)
        if let result = arView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal).first {
            let resultAnchor = AnchorEntity(world: result.worldTransform)
            switch (self.type){
            case 1:
                ind = (ind) % Int(wordBook.capacity)
                let entity = wordModel(word: wordBook.words[ind], color: (wordBook.words[ind].isMemorized == true ? UIColor.black : UIColor.red))
                if wordBook.words[ind].isVisited == false {
                    wordBook.words[ind].isVisited = true
                    wordBook.wordVisited += 1
                }
                resultAnchor.addChild(entity)
                arView.scene.addAnchor(resultAnchor)
                entity.playAudio(audioPlace)
                models.append(entity)
                dict[entity] = wordBook.words[ind].id
                
                //print(dict[entity]!)
                /*没效果，不明白原因
                var subscrible:Cancellable!
                subscrible = arView.scene.subscribe(to: SceneEvents.Update.self){_ in
                    print(self.models.capacity)
                    self.models[self.models.capacity-1].look(at: self.arView.cameraTransform.translation, from: entity.position(relativeTo: nil), upVector: [0,1,0],relativeTo: nil)
                }
                */
                
                ind = (ind+1) % Int(wordBook.capacity)
                break
            case 2:
                let entity = arView.entity(at: tapLocation)
                if entity?.children.first != nil{
                    let transform = Transform(scale: .init(x: 0.3, y: 0.3, z: 0.3),rotation: simd_quatf(),translation:[0,0,0])
                    
                    
                    entity?.playAudio(audioPick)
//                    entity?.move(to: transform, relativeTo: entity, duration: 1, timingFunction: .easeInOut)
                    DispatchQueue.main.asyncAfter(deadline: .now()+1){ [self] in
                        
                        entity?.removeFromParent()
                        if let index = self.models.firstIndex(of: entity!){
                            models.remove(at: index)
                        }
                        //print(dict[entity as! ModelEntity]!)
                        // use indice to traverse the wordbook and delete the oblect whose id is dict[entity as! ModelEntity]
//                        let indice = dict[entity as! ModelEntity]
//                        for index in wordBook.words.indices {
//                            
//                            if wordBook.words[index].id == indice {
//                                if wordBook.words[index].isMemorized == false
//                                {
//                                    wordBook.words[index].isMemorized = true
//                                    wordBook.wordMemorized += 1
//                                    
//                                    if wordBook.words[index].isVisited == false {
//                                        wordBook.words[index].isVisited = true
//                                        wordBook.wordVisited += 1
//                                    }
//                                }
//                            }
//                        }
                        
                        
                        dict.removeValue(forKey: entity as! ModelEntity)
                    }
                }
                break
            case 3:
                let entity = arView.entity(at: tapLocation)
                if let firstChild = entity?.children.first{
                    firstChild.isEnabled.toggle()
                }
                break
            case 4:
                let entity = arView.entity(at: tapLocation)
                if entity?.children.first != nil{
                    // 判断是否为ModelEntity
                    guard let modelEntiy = entity as? ModelEntity else { break }
                    var material = SimpleMaterial()
                    material.color = .init(tint: .red)
                    modelEntiy.model?.materials[0] = material
                    if let firstChild = entity?.children.first{
                        guard let childeModelEntity = firstChild as? ModelEntity else { break }
                        childeModelEntity.model?.materials[0]=material
                    }
                }
                break
            default:
                type=1
            }
            
            arView.scene.addAnchor(resultAnchor )
        }
    }
    
    
    func wordModel(word: WordP, color: UIColor)->ModelEntity{
        let word_ = ModelEntity(mesh: .generateText(word.english), materials: [SimpleMaterial(color: color, isMetallic: false)])
        let wordChild = ModelEntity(mesh: .generateText(word.chinese), materials: [SimpleMaterial(color: color, isMetallic: false)])
        //let cameraTransform = arView.cameraTransform
        //word_.look(at: cameraTransform.translation, from: word_.transform.translation, upVector: .init(0, 1, 0), relativeTo: nil)
        
        word_.addChild(wordChild )
        wordChild.isEnabled=false
        wordChild.transform.translation.y+=15
        word_.scale=SIMD3(repeating: 0.01)
        //word_.transform.translation.y+=0.15
        word_.generateCollisionShapes(recursive: true )
        arView.installGestures(.all, for: word_)
        
        return word_
        
    }
    
    /*平面检测对于本app效果不好
    // 当检测到新的平面锚点时，该方法会被调用
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            // 判断锚点是否为平面锚点
            guard let planeAnchor = anchor as? ARPlaneAnchor else { continue }
            // 判断是否已经放置了足够数量的模型
            guard modelCount < 10 else {
                return
            }
            let model = wordModel(word: words[ind], color: .black)
            ind=(ind+1)%words.capacity
            let anchorEntity = AnchorEntity(anchor: planeAnchor)
            anchorEntity.orientation=arView.cameraTransform.rotation
            anchorEntity.addChild(model)
            
            // 调整模型实体的位置，使其位于平面锚点的中心
            model.position = [planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z]
            
            arView.scene.addAnchor(anchorEntity)
            modelCount += 1
        }
    }*/
}

