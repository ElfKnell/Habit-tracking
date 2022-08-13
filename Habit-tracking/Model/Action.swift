//
//  Action.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 11/08/2022.
//

import Foundation

struct Action: Codable {
    let id: String
    let name: String
    let description: String
    let time: Int?
    let id_hobby: Int
}
