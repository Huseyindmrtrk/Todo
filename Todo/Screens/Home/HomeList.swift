import SwiftUI

struct HomeList: View {
    @State private var showFavoritesOnly = false
    @State private var isFavorited = Array(repeating: false, count: 5)
    let items: [String]
    
    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Tamamlananları Göster")
            }
            
            ForEach(items.indices, id: \.self) { index in
                if !showFavoritesOnly || isFavorited[index] {
                    HomeRow(text: items[index], isChecked: $isFavorited[index])
                }
            }
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList(items: ["test", "test 2", "test 3"])
    }
}
