//
//  Tip.swift
//  Tipsy
//
//  Created by 김건우 on 2023/10/05.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipModel {
    
    var tip: Double = 0.1
    var numberOfPeople: Int = 2
    var billTotal: Double = 0.0
    var finalResult: String = ""
    
    mutating func calculateTotalPerPerson(_ bill: String) {
        // 텍스트필드가 비어있거나, 틀린 형식을 입력했다면
        guard let billTotal = Double(bill) else { return }
        // 결과값 반환하기
        let result = billTotal * (1.0 + tip) / Double(numberOfPeople)
        finalResult = String(format: "%.2f", result)
    }
    
}
