//
//  NewListView.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 15.10.2024.
//
import SwiftUI

struct AddListView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var listName = "" // Liste adı state
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Yeni Liste Adı", text: $listName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Liste adını kaydet ve ekranı kapat
                    if !listName.isEmpty {
                        // Save the list
                        // Burada listeyi HomeList'e ekleyelim
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Oluştur")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Yeni Liste Oluştur")
            .navigationBarItems(trailing: Button("Kapat") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
