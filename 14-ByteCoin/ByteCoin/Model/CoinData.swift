//
//  CoinData.swift
//  ByteCoin
//
//  Created by 김건우 on 10/9/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let tradePrice: Int
}

typealias Coins = [CoinData]
