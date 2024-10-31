import SwiftUI


struct TodoDetailView: View {
    var todoTitle: String
    @State private var todos: [TodoItem] = []
    @State private var newTodoTitle: String = ""
    @State private var showCompletedOnly: Bool = false

    var body: some View {
        VStack {
            Toggle("Sadece yapılanları göster", isOn: $showCompletedOnly)
                .padding()
            ZStack {
                List {
                    ForEach(filteredTodos) { todo in
                        HStack {
                            Button(action: {
                                toggleCompletion(for: todo)
                            }) {
                                Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                        }
                    }
                }
                .background(Color.clear)
            }

            HStack {
                TextField("Yeni madde ekle", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Ekle") {
                    addNewTodo()
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Detay")
        .onAppear(perform: loadTodos)
    }

    private var filteredTodos: [TodoItem] {
        showCompletedOnly ? todos.filter { $0.isCompleted } : todos
    }

    private func addNewTodo() {
        guard !newTodoTitle.isEmpty else { return }
        let newTodo = TodoItem(title: newTodoTitle)
        todos.append(newTodo)
        newTodoTitle = ""
        saveTodos()
    }

    private func toggleCompletion(for todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            saveTodos()
        }
    }

    private func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: "todoItemsList")
            print("Todos saved successfully: \(todos)")
        } else {
            print("Failed to encode todos")
        }
    }

    private func loadTodos() {
        if let savedData = UserDefaults.standard.data(forKey: "todoItemsList"),
           let decodedTodos = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
            todos = decodedTodos
            print("Todos loaded successfully: \(todos)")
        } else {
            print("Failed to load todos")
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todoTitle: "Örnek To-Do")
    }
}
