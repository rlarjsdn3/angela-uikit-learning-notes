//
//  Item.swift
//  Todoey
//
//  Created by 김건우 on 11/1/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var title: String
    @Persisted var done: Bool
    @Persisted var createdDate: Date
    var parentCategory = LinkingObjects(fromType: Category.self, property: "Items") // ❓
}
