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

class FileManagerHelper {
    static let shared = FileManagerHelper()

    private init() {}

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func saveLists(_ lists: [ListItem]) {
        let url = getDocumentsDirectory().appendingPathComponent("lists.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(lists) {
            try? data.write(to: url)
        }
    }

    func loadLists() -> [ListItem] {
        let url = getDocumentsDirectory().appendingPathComponent("lists.json")
        if let data = try? Data(contentsOf: url),
           let lists = try? JSONDecoder().decode([ListItem].self, from: data) {
            return lists
        }
        return []
    }
}
