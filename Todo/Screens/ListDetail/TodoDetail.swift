//
//  TodoDetail.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 17.09.2024.
//

import SwiftUI

struct TodoDetail: View {
    @State private var todos: [String] = []
    @State private var newTodo: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                HStack {
                    TextField("Metin Gir", text: $newTodo)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .padding()
                    
                    Button(action: {
                        print("eklendi")
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    TodoDetail()
}
