//
//  item.swift
//  Todoey
//
//  Created by 김건우 on 10/16/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class Item: Codable {
    var title: String
    var done: Bool
    
    init(title: String, done: Bool = false) {
        self.title = title
        self.done = done
    }
}
