import SwiftUI

struct HomeRow: View {
    var text: String
    @Binding var isChecked: Bool

    var body: some View {
        NavigationLink(destination: TodoDetailView(todoTitle: text)) {
            HStack {
                Text(text)
                Spacer()
                Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(isChecked ? .orange : .gray)
                    .scaleEffect(isChecked ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.3), value: isChecked)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isChecked.toggle()
                        }
                    }
            }
            .padding()
        }
    }
}

struct HomeRow_Previews: PreviewProvider {
    @State static var isChecked = false
    
    static var previews: some View {
        HomeRow(text: "Example", isChecked: $isChecked)
    }
}
