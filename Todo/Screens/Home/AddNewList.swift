import SwiftUI

struct AddNewListView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var listName: String = ""
    @State private var showToast: Bool = false
    var onAdd: (String) -> Void

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section() {
                        TextField("Liste adını girin", text: $listName)
                    }

                    Button("Oluştur") {
                        print("Yeni liste oluşturuldu: \(listName)")
                        onAdd(listName)
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showToast = false
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .navigationTitle("Yeni Liste Ekle")
                .navigationBarItems(trailing: Button("İptal") {
                    presentationMode.wrappedValue.dismiss()
                })

                if showToast {
                    ToastView(message: "\(listName) Listesi oluşturuldu")
                        .transition(.slide)
                        .animation(.easeInOut)
                }
            }
        }
    }
}

#Preview {
    AddNewListView { _ in }
}
