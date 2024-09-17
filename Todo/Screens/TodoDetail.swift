//
//  TodoDetail.swift
//  Todo
//
//  Created by Hüseyin Demirtürk on 17.09.2024.
//

import SwiftUI

struct TodoDetail: View {
    var todo: String

    var body: some View {
        VStack {
            Text(todo)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Madde Detayı")
    }
}
//
//#Preview {
//    TodoDetail()
//}
