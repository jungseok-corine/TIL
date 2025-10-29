# 2025-10-29 iOS + AI Day 3

## 📚 오늘 배운 것

### iOS (3.5시간)
- @StateObject VS ObservedObject 학습
- MVVM 패턴 학습
- ObservableObject와 @Published 사용법

### AI (1.5시간)
- CreateML 소개 및 설치
- 머신러닝 학습 프로세스 (Training, Validation, Testing)
- 데이터셋 구조 이해
- Create ML로 이미지 분류 모델 학습

## 💻 코드
```swift
class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = []
    @Published var newTodoTitle = ""
    @Published var filterOption: FilterOption = .all

    enum FilterOption: String, CaseIterable {
        case all = "전체"
        case active = "진행중"
        case completed = "완료"
    }
    
    var filteredTodos: [TodoItem] {
        switch filterOption {
        case .all:
            return todos
        case .active:
            return todos.filter { !$0.isCompleted }
        case .completed:
            return todos.filter { $0.isCompleted }
        }
    }
    
    var completedCount: Int {
        todos.filter { $0.isCompleted }.count
    }
    
    var activeCount: Int {
        todos.filter { !$0.isCompleted }.count
    }
    
    // MARK: - Function

    func addTodo() {
        guard !newTodoTitle.isEmpty else { return }
        
        let newTodo = TodoItem(title: newTodoTitle)
        todos.append(newTodo)
        newTodoTitle = ""
    }
    
    func toggleComplete(todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id}) {
            todos[index].isCompleted.toggle()
        }
    }
    
    func deleteTodo(at offsets: IndexSet) {
            todos.remove(atOffsets: offsets)
    }
}
```

```swift
                Picker("필터", selection: $viewModel.filterOption) {
                    ForEach(TodoViewModel.FilterOption.allCases, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
```

## 🤔 어려웠던 점
- @StateObject, @ObservedObject를 언제 써야하는지 헷갈렸지만 해결 완료.
- View가 초기화 될때 @StateObject는 그 값을 유지하게 해주고. @ObservedObject는 그 값을 유지하지 못한다. @ObservedObject는 그저 관찰만 가능하고 고정되지 않는 프로퍼티 래퍼이다. @StateObject는 View가 초기화 된다 해도 그 값은 고정적으로 변하지 않고 유지되는 프로퍼티 래퍼이다.
- → View가 생성하면 @StateObject, 받아오면 @ObservedObject!


## 💡 해결 방법
-

## ✅ 체크리스트
- [x] TODO 앱 MVVM 패턴으로 완성
- [x] 필터링 기능 추가
- [x] Create ML 실행 완료
- [x] GitHub 커밋

## 📝 내일 할 것
- @Observable (iOS 17+) 학습
- TODO 앱에 ViewModel 리팩토링
