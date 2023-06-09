//
//  ViewController.swift
//  ARwords
//
//  Created by qjc on 2023/6/9.
//

import ARKit
import RealityKit
import SceneKit
var gestureStartLocation: SIMD3<Float>?
var cubeEntity: ModelEntity?

class ViewController: UIViewController, ARSessionDelegate {
    var modelCount = 0
    var models:[Entity]=[]
    var arView:ARView{
        return self.view as! ARView
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
        arView.debugOptions.insert(.showSceneUnderstanding)
        //arView.renderOptions = [.disablePersonOcclusion, .disableDepthOfField, .disableMotionBlur]
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
            if(type==1){
                let entity = wordModel(word: words[ind], color: .black)
                resultAnchor.addChild(entity)
                models.append(entity)
                ind=(ind+1)%words.capacity
            }else if(type==2){
                let entity = arView.entity(at: tapLocation)
                if entity?.children.first != nil{
                    entity?.removeFromParent()
                    if let index = models.firstIndex(of: entity!){
                        models.remove(at: index)
                    }
                }
            }else if(type==3){
                let entity = arView.entity(at: tapLocation)
                if let firstChild = entity?.children.first{
                    firstChild.isEnabled.toggle()
                }
            }
        
            arView.scene.addAnchor(resultAnchor )
        }
    }

    
    func wordModel(word: Word, color: UIColor)->ModelEntity{
        let word_ = ModelEntity(mesh: .generateText(word.Eng), materials: [SimpleMaterial(color: color, isMetallic: false)])
        let wordChild = ModelEntity(mesh: .generateText(wordType[word.t]+word.Cn), materials: [SimpleMaterial(color: color, isMetallic: false)])
        //let cameraTransform = arView.cameraTransform
        //word_.look(at: cameraTransform.translation, from: word_.transform.translation, upVector: .init(-1, 0, 0), relativeTo: nil)
        
        word_.addChild(wordChild )
        wordChild.isEnabled=false
        wordChild.transform.translation.y-=15
        word_.scale=SIMD3(repeating: 0.01)
        word_.transform.translation.y+=0.15
        word_.generateCollisionShapes(recursive: true )
        arView.installGestures(.all, for: word_)

        return word_
        
    }
    
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
    }
}
