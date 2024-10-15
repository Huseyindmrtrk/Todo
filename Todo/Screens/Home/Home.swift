import SwiftUI

struct Home: View {
    @State private var showingAddListView = false
    @State private var items = [String]()

    var body: some View {
        NavigationView {
            VStack {
                HomeList(items: items)
                
                Button(action: {
                    showingAddListView.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
        }
        .sheet(isPresented: $showingAddListView) {
            AddNewListView { newItem in
                items.append(newItem)
            }
            .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    Home()
}
