//
//  Todo.swift
//  TodoApp
//
//  Created by Şerife Türksever on 1.03.2023.
//

import Foundation

struct Todo: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var type: String
    var isDone: Bool
    
}

#if DEBUG
extension Todo {
    static var sampleData = [
        Todo(name: "Kitap Oku", type: "Daily", isDone: false),
        Todo(name: "Markete git", type: "Market", isDone: true),
        Todo(name: "Kargonu al", type: "Social", isDone: true),
        Todo(name: "Yemek yap", type: "Daily", isDone: false),
        Todo(name: "IOS proje yap", type: "Technology", isDone: false)
    ]
}
#endif
