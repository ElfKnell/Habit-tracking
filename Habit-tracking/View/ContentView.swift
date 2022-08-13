//
//  ContentView.swift
//  Habit-tracking
//
//  Created by Andrii Kyrychenko on 11/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myHobbies = MyHobbies()
    
    let hobby: [Hobby] = Bundle.main.decode("hobby.json")
    
    @State private var isAction = false
    @State var myHobby: Hobby?
    
    @State private var rows = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    Text("My hobby")
                        .font(.largeTitle)
                    ForEach(myHobbies.hobbies, id: \.id) { mHobby in
                        Text(mHobby.name)
                            .font(.headline)
                            .onTapGesture {
                                myHobby = mHobby
                                isAction = true
                            }
                    }
                    .onDelete(perform: removeHobby)
                }
                
                ScrollView {
                    LazyVGrid(columns: rows) {
                        ForEach(hobby) { hob in
                            NavigationLink {
                                HobbyView(hobby: hob)
                            } label: {
                                HStack{
                                    Text(hob.name)
                                        .font(.largeTitle)
                                        .padding()
                                    
                                    Spacer()
                                    
                                    Button {
                                        myHobbies.hobbies.append(hob)
                                    } label: {
                                        Image(systemName: "plus")
                                    }
                                    .padding()
                                }
                                .border(.green)
                            }
                        }
                    }
                }
            }
            //.navigationTitle("Hobby :)")
            .sheet(isPresented: $isAction) {
                ActionView(myHobby: myHobby)
            }
        }
    }
    func removeHobby(at offsets: IndexSet) {
        myHobbies.hobbies.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
