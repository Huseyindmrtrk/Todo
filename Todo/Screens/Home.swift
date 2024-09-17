//
//  Home.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 17.09.2024.
//

import SwiftUI

struct Home: View {
    @State private var todos: [String] = []
    @State private var newTodo: String = ""
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    ForEach(todos, id: \.self) {todo in
                        Text(todo)
                    }
                }
                Spacer()
                HStack{
                    TextField("Metin Gir Keko", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action : {
                        if !newTodo.isEmpty {
                            todos.append(newTodo)
                            newTodo = ""
                        }
                    }) {
                        Text("Ekle")
                            .padding()
                            .foregroundColor(Color.black)
                            .background(Color.white)
                    }.padding()
                }
            }.background(Color.gray)
            .navigationTitle("Yapılacaklar Listesi")
        }
    }
}

#Preview {
    Home()
}
