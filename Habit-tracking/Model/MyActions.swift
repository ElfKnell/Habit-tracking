//
//  MyActions.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 11/08/2022.
//

import Foundation

class MyActions: ObservableObject {
    
    @Published var actions = [Action]() {
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(actions) {
                UserDefaults.standard.set(encoded, forKey: "Actions")
            }
        }
    }
    
    init() {
        if let saveActions = UserDefaults.standard.data(forKey: "Actions") {
            if let decodedActions = try? JSONDecoder().decode([Action].self, from: saveActions) {
                actions = decodedActions
                return
            }
        }
        actions = []
    }
}
