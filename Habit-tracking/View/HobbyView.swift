//
//  HobbyView.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 11/08/2022.
//

import SwiftUI

struct HobbyView: View {
    
    var hobby: Hobby
    var body: some View {
        VStack {
            Text(hobby.name)
                .font(.largeTitle)
                .padding(.bottom)
            Text(hobby.description)
        }
    }
}

struct HobbyView_Previews: PreviewProvider {
    
    static let hobbies:[Hobby] = Bundle.main.decode("hobby.json")
    
    static var previews: some View {
        HobbyView(hobby: hobbies[0])
    }
}
