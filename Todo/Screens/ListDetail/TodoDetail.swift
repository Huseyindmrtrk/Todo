import SwiftUI

struct TodoDetailView: View {
    var todoTitle: String

    var body: some View {
        VStack {
            Text(todoTitle)
                .font(.largeTitle)
                .padding()

            Text("Burada \(todoTitle) ile ilgili detaylar yer alacak.")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Detay")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todoTitle: "Örnek To-Do")
    }
}
