# 2025-11-03 iOS + AI Day 1

## 📚 오늘 배운 것

### iOS (3.5시간)
**Clean Architecture 실전 적용**
- 기존 TODO 앱을 3계층으로 리팩토링
- Domain/Data/Presentation 계층 분리
- UseCase 패턴으로 비즈니스 로직 분리
- Repository Pattern으로 데이터 계층 독립화
- DI Container로 의존성 관리

**Before → After 비교**
- Before: ViewModel이 모든 것 담당 (200줄)
- After: 역할별로 분리 (UseCase 4개 + Repository)

### AI (1.5시간)
**Create ML 준비**
- 영화 리뷰 감정 분석 데이터셋 105개 생성
- Playground로 자동 생성 도구 제작
- Training/Validation/Testing 자동 분할

## 💻 코드

### UseCase 패턴
```swift
class AddTodoUseCase {
    private let repository: TodoRepositoryProtocol
    
    func execute(title: String) async throws {
        let todo = TodoItem(title: title)
        try await repository.add(todo)
    }
}
```

### DI Container
```swift
class DIContainer {
    static let shared = DIContainer()
    
    func makeTodoViewModel() -> TodoViewModel {
        // 모든 의존성을 여기서 주입
    }
}
```

## 🤔 어려웠던 점
1. **async/await 적용**
   - 기존 동기 코드를 비동기로 변경
   - Task { await ... } 패턴 익히기

2. **의존성 주입 이해**
   - 왜 생성자로 주입해야 하는지
   - Mock 객체로 테스트 가능하다는 것을 깨달음

3. **폴더 구조 정리**
   - 어느 파일이 어느 계층인지 헷갈림
   - Domain/Data/Presentation 기준 명확히 이해


## 💡 해결 방법
-

## ✅ 체크리스트 
- [x] 현재 코드의 문제점 파악
- [x] Clean Architecture 3계층 이해
- [x] 폴더 구조 생성 및 파일 이동
- [x] TodoRepositoryProtocol 작성
- [x] 4개 UseCase 작성 (Fetch/Add/Toggle/Delete)
- [x] TodoRepository 구현
- [x] TodoViewModel 리팩토링
- [x] DIContainer 구현
- [x] TodoListView 수정
- [x] 전체 빌드 및 테스트 성공
- [x] Text Classification 개념 이해
- [x] Playground로 데이터셋 생성기 작성
- [x] 영화 리뷰 105개 데이터 생성
- [x] Training/Validation/Testing 분할 완료
- [x] CSV 파일 검증 완료 

## 📝 내일 할 것
- Create ML로 텍스트 분류 모델 학습
- 학습한 모델 TODO 앱에 통합
- Repository를 UserDefaults로 변경 (데이터 영구 저장)
- Natural Language Framework 학습
