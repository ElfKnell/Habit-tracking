//
//  AddActionView.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 13/08/2022.
//

import SwiftUI

struct AddActionView: View {
    var id_hobby: Int
    
    @ObservedObject var actions: MyActions
    
    @Environment(\.dismiss) var dismiss
    
    @State private var id = ""
    @State private var name = ""
    @State private var description = ""
    @State private var time = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Your action:")
                    TextField("", text: $id)
                        .border(.green)
                }
                    .padding()
                
                HStack {
                    Text("Name of hobby:")
                    TextField("", text: $name)
                        .border(.green)
                }
                    .padding()
                
                HStack {
                    Text("Add description:")
                    TextField("", text: $description)
                        .border(.green)
                }
                    .padding()
                
                Text("Add time \(Int(time)) minutes")
                Slider(value: $time, in: 5...90, step: 5)
                    .padding()
                
                Spacer()
                
                Button {
                    let item = Action(id: id, name: name, description: description, time: Int(time), id_hobby: id_hobby)
                    actions.actions.append(item)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct AddActionView_Previews: PreviewProvider {
    static var previews: some View {
        AddActionView(id_hobby: 0, actions: MyActions())
    }
}
