//
//  ToastView.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 15.10.2024.
//
import SwiftUI
struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .shadow(radius: 10)
            .offset(y: 0) // Ekranın altında görünüm
    }
}

#Preview {
    AddNewListView()
}
