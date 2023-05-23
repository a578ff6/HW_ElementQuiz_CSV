//
//  MultipleChoiceQuestion.swift
//  HW_ElementQuiz
//
//  Created by 曹家瑋 on 2023/5/21.
//

import Foundation
import UIKit

// 導入 CodableCSV （新增）
import CodableCSV

// 定義一個適用於讀取 CSV 資料的結構
struct MultipleChoiceQuestion: Codable {
    
    let questionText: String        // 題目的文字
    let options: String          // 選項的文字 （先前在未使用CSV是用 陣列）
    let correctAnswerText: String     // 正確答案
}

// 在 MultipleChoiceQuestion.swift 中新增了一個擴展
extension MultipleChoiceQuestion {
    static var data: [Self] {
        var array = [Self]()
        
        // 檢查是否能夠讀取名為 "JYQuestion-Grid view" 的資料檔案
        if let data = NSDataAsset(name: "JYQuestion-Grid view")?.data {
            
            // 使用 CSVDecoder 來解碼 CSV 資料
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                // 將資料解碼為 MultipleChoiceQuestion 的陣列
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        // 返回解碼後的陣列
        return array
    }
}


//// 先前未使用 CSV 版本
//struct MultipleChoiceQuestion: {
//
//    let questionText: String        // 題目的文字
//    let options: [String]          // 選項的文字陣列
//    let correctAnswerText: String     // 正確答案
//}
