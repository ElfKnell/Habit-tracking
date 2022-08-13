//
//  ActionView.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 12/08/2022.
//

import SwiftUI

struct ActionView: View {
    @ObservedObject var myAction = MyActions()
    
    var myHobby : Hobby?
    let actions: [String: Action] = Bundle.main.decode("actions.json")
    
    var body: some View {
        NavigationView {
            VStack {
            List {
                ForEach(myAction.actions, id: \.id) { action in
                    if myHobby?.id == action.id_hobby {
                        HStack {
                            VStack {
                                Text(action.name)
                                    .bold()
                                    .font(.title2)

                                Text(" How long: \(action.time ?? 00) minutes")
                                    .border(.green)
                            }

                            Spacer()

                            Button {

                            } label: {
                                Image(systemName: "hourglass.badge.plus")
                            }
                        }
                    }
                }
                .onDelete(perform: removeActions)
                .padding()
            }
            
            List {
                HStack {
                    
                    NavigationLink {
                        AddActionView(id_hobby: myHobby?.id ?? 0, actions: myAction)
                    } label: {
                        Text(myHobby?.name ?? "N/A")
                            .font(.largeTitle)
                            .padding(.horizontal)
                    }
                }
                if let myHobby = myHobby {
                    ForEach(myHobby.actions, id: \.name) { act in
                        HStack {
                            VStack{
                                Text(act.name)
                                    .bold()
                                    .font(.title2)
                                Text(act.role)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Button {
                                addAction(act.name)
                            } label: {
                                Image(systemName: "plus")
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            }
        }
    }
    
    func removeActions(at offsets: IndexSet) {
        myAction.actions.remove(atOffsets: offsets)
    }
    
    func addAction(_ name: String) {
        for key in actions {
            if key.key == name {
                myAction.actions.append(key.value)
                break
            }
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView(myHobby: nil)
    }
}
