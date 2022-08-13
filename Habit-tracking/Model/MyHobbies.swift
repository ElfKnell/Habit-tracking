//
//  MyHobbies.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 11/08/2022.
//

import Foundation

class MyHobbies: ObservableObject {
    
    @Published var hobbies = [Hobby]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(hobbies) {
                UserDefaults.standard.set(encoded, forKey: "Hobbies")
            }
        }
    }
    
    init() {
        if let saveHobbies = UserDefaults.standard.data(forKey: "Hobbies") {
            if let decodedHobbies = try? JSONDecoder().decode([Hobby].self, from: saveHobbies) {
                hobbies = decodedHobbies
                return
            }
        }
        
        hobbies = []
    }
}
