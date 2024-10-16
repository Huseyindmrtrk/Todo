//
//  Model.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 15.10.2024.
//

import Foundation

struct ListItem: Codable {
    let name: String
}
struct ListStorage {
    static let key = "savedLists"

    // Liste adlarını kaydetme
    static func saveList(_ listName: String) {
        var currentLists = getLists()
        currentLists.append(listName)
        UserDefaults.standard.set(currentLists, forKey: key)
    }

    // Kayıtlı liste adlarını alma
    static func getLists() -> [String] {
        return UserDefaults.standard.stringArray(forKey: key) ?? []
    }
}
