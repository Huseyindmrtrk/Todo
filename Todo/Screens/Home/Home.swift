import SwiftUI

struct Home: View {
    @State private var showingAddListView = false

    var body: some View {
        NavigationView {
            VStack {
                HomeList()
                
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
            AddNewListView()
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    Home()
}
