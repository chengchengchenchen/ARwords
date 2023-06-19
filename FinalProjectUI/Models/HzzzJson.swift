//
//  HzzzJson.swift
//  hzzzP8
//
//  Created by Zheng Hwang on 2023/5/19.
//

import Foundation


//class HzzzHTTP
//{
//    static func SendJson(urlStr: String, data: Dictionary<String, String>//, whenFinish: @escaping (Dictionary<String, String>)->Void
//    )
//    {
//        let url = URL(string: urlStr)!
//        var request = URLRequest(url: url)
//        // 创建请求对象
//        request.httpMethod = "POST"
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: data)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        // 创建URLSession对象
//        let session = URLSession.shared
//
//        // 发送请求
//        let task = session.dataTask(with: request)
//        {
//            (data, response, error) in
//            // 处理响应
//            if let data = data
//            {
//                print(String(data: data, encoding: .utf8)!)
//                globalARViewModel.arDisplayResText = String(data: data, encoding: .utf8)!
//                globalARViewModel.isEdited += 1
////                whenFinish(["it is test":""])
//            }
//        }
//        task.resume()
//    }
//}

class HzzzJSON
{
    // 从原始文件中读取JSON数据
    static func JsonStartFromOrigin(filename: String) -> Dictionary<String, String>
    {
        var jsonResult = ["data":""]
        var oriWordBook: [WordBookP] = [
            WordBookP(id: 1, wordMemorized: 28, batchFinished: 0, batchLeft: 0, batchSize: 0, capacity: 100, lastVisitTime: Date(), name: "近义词 1", wordVisited: 62,
                          words: [
                            WordP(id: 0, english: "speculative", chinese: "推测的", isMemorized: false, isVisited: true),
                            WordP(id: 1, english: "conjectural", chinese: "推测的", isMemorized: false, isVisited: false),
                            WordP(id: 2, english: "accession to", chinese: "同意/默许", isMemorized: true, isVisited: true),
                            WordP(id: 3, english: "acquiescence to", chinese: "同意/默许", isMemorized: false, isVisited: true),
                            WordP(id: 4, english: "lambast", chinese: "谴责，嘲讽", isMemorized: false, isVisited: false),
                            WordP(id: 5, english: "deride", chinese: "谴责，嘲讽", isMemorized: false, isVisited: true),
                            WordP(id: 6, english: "perspicacity", chinese: "洞察力", isMemorized: true, isVisited: true),
                            WordP(id: 7, english: "discernment", chinese: "洞察力", isMemorized: true, isVisited: true),
                            WordP(id: 8, english: "perplexing", chinese: "令人困惑的", isMemorized: false, isVisited: false),
                            WordP(id: 9, english: "enigmatic", chinese: "令人困惑的", isMemorized: false, isVisited: false),
                            WordP(id: 10, english: "extirpate", chinese: "绝迹/消灭", isMemorized: false, isVisited: true),
                            WordP(id: 11, english: "eliminate", chinese: "绝迹/消灭", isMemorized: false, isVisited: false),
                            WordP(id: 12, english: "encyclopedic", chinese: "全面的", isMemorized: false, isVisited: true),
                            WordP(id: 13, english: "exhaustive", chinese: "全面的", isMemorized: false, isVisited: false),
                            WordP(id: 14, english: "bypass", chinese: "避开", isMemorized: false, isVisited: false),
                            WordP(id: 15, english: "circumvent", chinese: "避开", isMemorized: true, isVisited: true),
                            WordP(id: 16, english: "slippery", chinese: "不确定的", isMemorized: false, isVisited: true),
                            WordP(id: 17, english: "elusive", chinese: "不确定的", isMemorized: false, isVisited: true),
                            WordP(id: 18, english: "counterpart", chinese: "对应物", isMemorized: false, isVisited: false),
                            WordP(id: 19, english: "parallel", chinese: "对应物", isMemorized: false, isVisited: true),
                            WordP(id: 20, english: "adaptability", chinese: "灵活性", isMemorized: false, isVisited: false),
                            WordP(id: 21, english: "flexibility", chinese: "灵活性", isMemorized: false, isVisited: true),
                            WordP(id: 22, english: "cure-all", chinese: "万能药", isMemorized: false, isVisited: true),
                            WordP(id: 23, english: "panacea", chinese: "万能药", isMemorized: false, isVisited: false),
                            WordP(id: 24, english: "shrieking", chinese: "尖叫", isMemorized: true, isVisited: true),
                            WordP(id: 25, english: "caterwauling", chinese: "尖叫", isMemorized: true, isVisited: true),
                            WordP(id: 26, english: "capricious", chinese: "变化无常的/无法预计的", isMemorized: false, isVisited: false),
                            WordP(id: 27, english: "unpredictable", chinese: "变化无常的/无法预计的", isMemorized: false, isVisited: true),
                            WordP(id: 28, english: "origin", chinese: "起源", isMemorized: false, isVisited: false),
                            WordP(id: 29, english: "provenance", chinese: "起源", isMemorized: false, isVisited: false),
                            WordP(id: 30, english: "intelligible", chinese: "可理解的", isMemorized: false, isVisited: true),
                            WordP(id: 31, english: "readable", chinese: "可理解的", isMemorized: false, isVisited: true),
                            WordP(id: 32, english: "humility", chinese: "谦逊", isMemorized: true, isVisited: true),
                            WordP(id: 33, english: "modesty", chinese: "谦逊", isMemorized: true, isVisited: true),
                            WordP(id: 34, english: "superlative", chinese: "优秀的，值得称赞的", isMemorized: false, isVisited: false),
                            WordP(id: 35, english: "praiseworthy", chinese: "优秀的，值得称赞的", isMemorized: true, isVisited: true),
                            WordP(id: 36, english: "encomium", chinese: "赞扬", isMemorized: false, isVisited: true),
                            WordP(id: 37, english: "tribute", chinese: "赞扬", isMemorized: false, isVisited: true),
                            WordP(id: 38, english: "futility", chinese: "无意义", isMemorized: false, isVisited: true),
                            WordP(id: 39, english: "pointlessness", chinese: "无意义", isMemorized: true, isVisited: true),
                            WordP(id: 40, english: "sober", chinese: "严肃的", isMemorized: false, isVisited: true),
                            WordP(id: 41, english: "staid", chinese: "严肃的", isMemorized: false, isVisited: false),
                            WordP(id: 42, english: "glut", chinese: "过多", isMemorized: false, isVisited: true),
                            WordP(id: 43, english: "surfeit", chinese: "过多", isMemorized: false, isVisited: false),
                            WordP(id: 44, english: "deliberation", chinese: "考虑", isMemorized: true, isVisited: true),
                            WordP(id: 45, english: "consideration", chinese: "考虑", isMemorized: false, isVisited: true),
                            WordP(id: 46, english: "formidable", chinese: "艰巨的", isMemorized: true, isVisited: true),
                            WordP(id: 47, english: "daunting", chinese: "艰巨的", isMemorized: true, isVisited: true),
                            WordP(id: 48, english: "restorative", chinese: "促进康复的/滋补的", isMemorized: false, isVisited: false),
                            WordP(id: 49, english: "tonic", chinese: "促进康复的/滋补的", isMemorized: true, isVisited: true),
                            WordP(id: 50, english: "unprepossessing", chinese: "普通的", isMemorized: true, isVisited: true),
                            WordP(id: 51, english: "unremarkable", chinese: "普通的", isMemorized: true, isVisited: true),
                            WordP(id: 52, english: "detect", chinese: "察觉", isMemorized: true, isVisited: true),
                            WordP(id: 53, english: "discern", chinese: "察觉", isMemorized: false, isVisited: false),
                            WordP(id: 54, english: "meticulous", chinese: "一丝不苟的/彻底的", isMemorized: true, isVisited: true),
                            WordP(id: 55, english: "thorough", chinese: "一丝不苟的/彻底的", isMemorized: false, isVisited: false),
                            WordP(id: 56, english: "confined", chinese: "受限制的/局限的", isMemorized: true, isVisited: true),
                            WordP(id: 57, english: "circumscribed", chinese: "受限制的/局限的", isMemorized: false, isVisited: false),
                            WordP(id: 58, english: "experimental", chinese: "创新的", isMemorized: true, isVisited: true),
                            WordP(id: 59, english: "innovative", chinese: "创新的", isMemorized: false, isVisited: true),
                            WordP(id: 60, english: "shun", chinese: "", isMemorized: false, isVisited: false),
                            WordP(id: 61, english: "eschew", chinese: "", isMemorized: false, isVisited: true),
                            WordP(id: 62, english: "learned", chinese: "博学的", isMemorized: false, isVisited: false),
                            WordP(id: 63, english: "erudite", chinese: "博学的", isMemorized: false, isVisited: false),
                            WordP(id: 64, english: "nebulous", chinese: "模糊的", isMemorized: false, isVisited: true),
                            WordP(id: 65, english: "vague", chinese: "模糊的", isMemorized: false, isVisited: false),
                            WordP(id: 66, english: "unquestionable", chinese: "不可否认的", isMemorized: true, isVisited: true),
                            WordP(id: 67, english: "undeniable", chinese: "不可否认的", isMemorized: false, isVisited: false),
                            WordP(id: 68, english: "antediluvian", chinese: "过时的", isMemorized: false, isVisited: true),
                            WordP(id: 69, english: "archaic", chinese: "过时的", isMemorized: false, isVisited: true),
                            WordP(id: 70, english: "novel", chinese: "新颖的/原创的", isMemorized: true, isVisited: true),
                            WordP(id: 71, english: "original", chinese: "新颖的/原创的", isMemorized: false, isVisited: true),
                            WordP(id: 72, english: "sound", chinese: "合理的/不容置疑的", isMemorized: false, isVisited: false),
                            WordP(id: 73, english: "unassailable", chinese: "合理的/不容置疑的", isMemorized: true, isVisited: true),
                            WordP(id: 74, english: "paltry", chinese: "无价值的/缺乏的", isMemorized: false, isVisited: true),
                            WordP(id: 75, english: "meager", chinese: "无价值的/缺乏的", isMemorized: false, isVisited: true),
                            WordP(id: 76, english: "aspersion", chinese: "诽谤", isMemorized: false, isVisited: true),
                            WordP(id: 77, english: "slur", chinese: "诽谤", isMemorized: false, isVisited: true),
                            WordP(id: 78, english: "exacerbate", chinese: "加重", isMemorized: false, isVisited: false),
                            WordP(id: 79, english: "aggravate", chinese: "加重", isMemorized: false, isVisited: false),
                            WordP(id: 80, english: "insular", chinese: "与世隔绝的", isMemorized: false, isVisited: true),
                            WordP(id: 81, english: "parochial", chinese: "与世隔绝的", isMemorized: false, isVisited: false),
                            WordP(id: 82, english: "placidity", chinese: "平静，自满", isMemorized: false, isVisited: false),
                            WordP(id: 83, english: "complacency", chinese: "平静，自满", isMemorized: true, isVisited: true),
                            WordP(id: 84, english: "proliferate", chinese: "激增", isMemorized: false, isVisited: false),
                            WordP(id: 85, english: "abound", chinese: "激增", isMemorized: true, isVisited: true),
                            WordP(id: 86, english: "relished", chinese: "享受", isMemorized: false, isVisited: false),
                            WordP(id: 87, english: "delighted in", chinese: "享受", isMemorized: true, isVisited: true),
                            WordP(id: 88, english: "emendation", chinese: "修订", isMemorized: false, isVisited: false),
                            WordP(id: 89, english: "revision", chinese: "修订", isMemorized: false, isVisited: false),
                            WordP(id: 90, english: "limit", chinese: "限制", isMemorized: false, isVisited: false),
                            WordP(id: 91, english: "confine", chinese: "限制", isMemorized: false, isVisited: false),
                            WordP(id: 92, english: "scarce", chinese: "缺少的", isMemorized: false, isVisited: true),
                            WordP(id: 93, english: "inadequate", chinese: "缺少的", isMemorized: false, isVisited: false),
                            WordP(id: 94, english: "preserve", chinese: "保存/保护", isMemorized: true, isVisited: true),
                            WordP(id: 95, english: "safeguard", chinese: "保存/保护", isMemorized: false, isVisited: true),
                            WordP(id: 96, english: "robust", chinese: "强有力的", isMemorized: false, isVisited: false),
                            WordP(id: 97, english: "strong", chinese: "强有力的", isMemorized: false, isVisited: true),
                            WordP(id: 98, english: "anticipate", chinese: "预示", isMemorized: false, isVisited: true),
                            WordP(id: 99, english: "prefigure", chinese: "预示", isMemorized: true, isVisited: true)
                          ]),
        WordBookP(id: 1, wordMemorized: 24, batchFinished: 0, batchLeft: 0, batchSize: 0, capacity: 100, lastVisitTime: Date(), name: "近义词 2", wordVisited: 62,
                          words: [
                            WordP(id: 180, english: "vitiate", chinese: "损害", isMemorized: false, isVisited: true),
                            WordP(id: 181, english: "impair", chinese: "损害", isMemorized: false, isVisited: false),
                            WordP(id: 182, english: "predilection", chinese: "倾向", isMemorized: false, isVisited: false),
                            WordP(id: 183, english: "proclivity", chinese: "倾向", isMemorized: false, isVisited: false),
                            WordP(id: 184, english: "intricate", chinese: "复杂的", isMemorized: false, isVisited: false),
                            WordP(id: 185, english: "convoluted", chinese: "复杂的", isMemorized: false, isVisited: false),
                            WordP(id: 186, english: "trivial", chinese: "不重要的", isMemorized: true, isVisited: true),
                            WordP(id: 187, english: "insignificant", chinese: "不重要的", isMemorized: false, isVisited: false),
                            WordP(id: 188, english: "abstracted from", chinese: "与…分离", isMemorized: false, isVisited: false),
                            WordP(id: 189, english: "divorced from", chinese: "与…分离", isMemorized: false, isVisited: false),
                            WordP(id: 190, english: "inconstant", chinese: "易变的", isMemorized: false, isVisited: false),
                            WordP(id: 191, english: "capricious", chinese: "易变的", isMemorized: false, isVisited: true),
                            WordP(id: 192, english: "hail", chinese: "称赞", isMemorized: false, isVisited: true),
                            WordP(id: 193, english: "acclaim", chinese: "称赞", isMemorized: false, isVisited: false),
                            WordP(id: 194, english: "coherent", chinese: "连贯的/井然有序的", isMemorized: false, isVisited: true),
                            WordP(id: 195, english: "orderly", chinese: "连贯的/井然有序的", isMemorized: false, isVisited: true),
                            WordP(id: 196, english: "familiar", chinese: "容易识别的/可识别的", isMemorized: true, isVisited: true),
                            WordP(id: 197, english: "recognizable", chinese: "容易识别的/可识别的", isMemorized: false, isVisited: true),
                            WordP(id: 198, english: "artificial", chinese: "虚假的", isMemorized: false, isVisited: true),
                            WordP(id: 199, english: "spurious", chinese: "虚假的", isMemorized: false, isVisited: true),
                            WordP(id: 200, english: "acerbic", chinese: "尖酸的，苛刻的", isMemorized: true, isVisited: true),
                            WordP(id: 201, english: "harsh", chinese: "尖酸的，苛刻的", isMemorized: true, isVisited: true),
                            WordP(id: 202, english: "quiescent", chinese: "中止的", isMemorized: false, isVisited: true),
                            WordP(id: 203, english: "abeyant", chinese: "中止的", isMemorized: false, isVisited: true),
                            WordP(id: 204, english: "mediate", chinese: "影响", isMemorized: false, isVisited: true),
                            WordP(id: 205, english: "influence", chinese: "影响", isMemorized: false, isVisited: true),
                            WordP(id: 206, english: "adept at", chinese: "精通", isMemorized: false, isVisited: true),
                            WordP(id: 207, english: "proficient in", chinese: "精通", isMemorized: false, isVisited: true),
                            WordP(id: 208, english: "trivial", chinese: "不重要的", isMemorized: false, isVisited: true),
                            WordP(id: 209, english: "inessential", chinese: "不重要的", isMemorized: true, isVisited: true),
                            WordP(id: 210, english: "heterogeneous", chinese: "不同的", isMemorized: false, isVisited: false),
                            WordP(id: 211, english: "disparate", chinese: "不同的", isMemorized: true, isVisited: true),
                            WordP(id: 212, english: "complicated", chinese: "复杂的", isMemorized: true, isVisited: true),
                            WordP(id: 213, english: "knotty", chinese: "复杂的", isMemorized: false, isVisited: false),
                            WordP(id: 214, english: "implacable", chinese: "难和解的/不屈的", isMemorized: false, isVisited: true),
                            WordP(id: 215, english: "unyielding", chinese: "难和解的/不屈的", isMemorized: false, isVisited: false),
                            WordP(id: 216, english: "snag", chinese: "故障", isMemorized: true, isVisited: true),
                            WordP(id: 217, english: "hitch", chinese: "故障", isMemorized: true, isVisited: true),
                            WordP(id: 218, english: "disparity", chinese: "不同", isMemorized: false, isVisited: false),
                            WordP(id: 219, english: "variance", chinese: "不同", isMemorized: false, isVisited: true),
                            WordP(id: 220, english: "sidestep", chinese: "回避", isMemorized: false, isVisited: true),
                            WordP(id: 221, english: "circumvent", chinese: "回避", isMemorized: false, isVisited: true),
                            WordP(id: 222, english: "prodigious", chinese: "巨大的/贪吃的", isMemorized: false, isVisited: true),
                            WordP(id: 223, english: "voracious", chinese: "巨大的/贪吃的", isMemorized: true, isVisited: true),
                            WordP(id: 224, english: "defy", chinese: "违抗/忽视", isMemorized: false, isVisited: false),
                            WordP(id: 225, english: "disregard", chinese: "违抗/忽视", isMemorized: true, isVisited: true),
                            WordP(id: 226, english: "triumph", chinese: "成功", isMemorized: true, isVisited: true),
                            WordP(id: 227, english: "success", chinese: "成功", isMemorized: false, isVisited: false),
                            WordP(id: 228, english: "irrelevant", chinese: "无关的", isMemorized: false, isVisited: false),
                            WordP(id: 229, english: "extraneous", chinese: "无关的", isMemorized: false, isVisited: false),
                            WordP(id: 230, english: "discrepancy", chinese: "不一致", isMemorized: false, isVisited: false),
                            WordP(id: 231, english: "incongruity", chinese: "不一致", isMemorized: false, isVisited: false),
                            WordP(id: 232, english: "hamper", chinese: "阻碍", isMemorized: false, isVisited: false),
                            WordP(id: 233, english: "impede", chinese: "阻碍", isMemorized: false, isVisited: false),
                            WordP(id: 234, english: "brook", chinese: "容忍", isMemorized: false, isVisited: true),
                            WordP(id: 235, english: "tolerate", chinese: "容忍", isMemorized: true, isVisited: true),
                            WordP(id: 236, english: "essential for", chinese: "不可或缺的", isMemorized: false, isVisited: true),
                            WordP(id: 237, english: "indispensable to", chinese: "不可或缺的", isMemorized: false, isVisited: false),
                            WordP(id: 238, english: "understandable", chinese: "易懂的", isMemorized: false, isVisited: false),
                            WordP(id: 239, english: "transparent", chinese: "易懂的", isMemorized: false, isVisited: false),
                            WordP(id: 240, english: "presage", chinese: "预示", isMemorized: false, isVisited: true),
                            WordP(id: 241, english: "portend", chinese: "预示", isMemorized: false, isVisited: true),
                            WordP(id: 242, english: "self-interest", chinese: "自私/机会主义", isMemorized: false, isVisited: false),
                            WordP(id: 243, english: "opportunism", chinese: "自私/机会主义", isMemorized: false, isVisited: false),
                            WordP(id: 244, english: "shackle", chinese: "束缚", isMemorized: false, isVisited: true),
                            WordP(id: 245, english: "stifle", chinese: "束缚", isMemorized: true, isVisited: true),
                            WordP(id: 246, english: "robust", chinese: "强壮的", isMemorized: false, isVisited: false),
                            WordP(id: 247, english: "strong", chinese: "强壮的", isMemorized: false, isVisited: false),
                            WordP(id: 248, english: "unimpeachable", chinese: "无可指责的", isMemorized: false, isVisited: true),
                            WordP(id: 249, english: "blameless", chinese: "无可指责的", isMemorized: true, isVisited: true),
                            WordP(id: 250, english: "captivated", chinese: "着迷的", isMemorized: false, isVisited: true),
                            WordP(id: 251, english: "enamored", chinese: "着迷的", isMemorized: false, isVisited: false),
                            WordP(id: 252, english: "immaterial", chinese: "不重要的", isMemorized: true, isVisited: true),
                            WordP(id: 253, english: "irrelevant", chinese: "不重要的", isMemorized: true, isVisited: true),
                            WordP(id: 254, english: "confound", chinese: "迷惑/使困惑", isMemorized: false, isVisited: false),
                            WordP(id: 255, english: "perplex", chinese: "迷惑/使困惑", isMemorized: false, isVisited: false),
                            WordP(id: 256, english: "augment", chinese: "增大", isMemorized: true, isVisited: true),
                            WordP(id: 257, english: "extend", chinese: "增大", isMemorized: false, isVisited: true),
                            WordP(id: 258, english: "inertia", chinese: "停滞", isMemorized: false, isVisited: true),
                            WordP(id: 259, english: "stasis", chinese: "停滞", isMemorized: false, isVisited: false),
                            WordP(id: 260, english: "extremist", chinese: "狂热者", isMemorized: false, isVisited: true),
                            WordP(id: 261, english: "zealot", chinese: "狂热者", isMemorized: true, isVisited: true),
                            WordP(id: 262, english: "unostentatious", chinese: "朴素的", isMemorized: false, isVisited: false),
                            WordP(id: 263, english: "modest", chinese: "朴素的", isMemorized: false, isVisited: true),
                            WordP(id: 264, english: "exactitude", chinese: "精确性/注重细节", isMemorized: false, isVisited: true),
                            WordP(id: 265, english: "meticulousness", chinese: "精确性/注重细节", isMemorized: true, isVisited: true),
                            WordP(id: 266, english: "dissemblance", chinese: "伪装/表里不一", isMemorized: false, isVisited: true),
                            WordP(id: 267, english: "duplicity", chinese: "伪装/表里不一", isMemorized: false, isVisited: false),
                            WordP(id: 268, english: "pressing", chinese: "迫切的", isMemorized: false, isVisited: true),
                            WordP(id: 269, english: "exigent", chinese: "迫切的", isMemorized: false, isVisited: true),
                            WordP(id: 270, english: "essential", chinese: "不可或缺的", isMemorized: false, isVisited: false),
                            WordP(id: 271, english: "indispensable", chinese: "不可或缺的", isMemorized: false, isVisited: false),
                            WordP(id: 272, english: "combine", chinese: "合并", isMemorized: false, isVisited: false),
                            WordP(id: 273, english: "meld", chinese: "合并", isMemorized: false, isVisited: true),
                            WordP(id: 274, english: "tantamount to", chinese: "等同于", isMemorized: true, isVisited: true),
                            WordP(id: 275, english: "synonymous with", chinese: "等同于", isMemorized: false, isVisited: true),
                            WordP(id: 276, english: "eclipse", chinese: "超过", isMemorized: true, isVisited: true),
                            WordP(id: 277, english: "outdo", chinese: "超过", isMemorized: false, isVisited: true),
                            WordP(id: 278, english: "speculation", chinese: "推测", isMemorized: true, isVisited: true),
                            WordP(id: 279, english: "conjecture", chinese: "推测", isMemorized: true, isVisited: true),
                          ])]
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encodeString = String(data: try! encoder.encode(oriWordBook), encoding: .utf8)!
        jsonResult["data"] = encodeString
        return jsonResult
    }
    
    // 从本地文件中读取JSON数据
    static func JsonRead(filename: String) -> Dictionary<String, String>
    {
        var newReadRes = ["":""]
        do
        {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileUrl = documentsDirectory.appendingPathComponent(filename)
            let data = try Data(contentsOf: fileUrl)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: String]
            {
//                print(object)
                if object["data"] != nil {
                    newReadRes = object
                }
                else {
                    newReadRes = HzzzJSON.JsonStartFromOrigin(filename: "default.json")
                }
            }
            else
            {
                print("JSON is invalid")
            }
        }
        catch
        {
            newReadRes = HzzzJSON.JsonStartFromOrigin(filename: "default.json")
        }
        
        return newReadRes
    }
    
    static func JsonWrite(filename: String, data: Dictionary<String, String>)
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = documentsDirectory.appendingPathComponent(filename)
        
        do
        {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            try jsonData.write(to: fileUrl)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}



