# 2025-11-10 iOS + AI Day 1

## 📚 오늘 배운 것

### iOS (3.5시간)
**Unit Testing 기초**
- XCTest 프레임워크 사용법
- Given-When-Then 패턴
- Combine 기반 Mock Repository 작성
- async/await로 Combine 테스트
- @MainActor 테스트 이해

**작성한 테스트:**
- FetchTodosUseCaseTests (4개)
- AddTodoUseCaseTests (3개)
- ToggleTodoUseCaseTests (3개)
- TodoViewModelTests (12개)

**총 22개 테스트 작성 ✅**

### AI (1.5시간)
- (내일 진행 예정)

## 💻 코드
**Combine Mock Repository:**
```swift
func fetchAll() -> AnyPublisher {
    if shouldFail {
        return Fail(error: errorToThrow)
            .eraseToAnyPublisher()
    }
    
    return Just(todos)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
}
```

**async/await 테스트:**
```swift
func test_할일추가() async throws {
    // Given
    let title = "테스트"
    
    // When
    try await sut.execute(title: title)
    
    // Then
    XCTAssertEqual(mockRepository.todos.count, 1)
}
```

## 🤔 어려웠던 점
1. **Combine Publisher 테스트**
   - Publisher를 어떻게 테스트해야 할지 고민
   - async/await 변환 방법 이해 필요

2. **@MainActor 이슈**
   - ViewModel 테스트에서 MainActor 에러
   - 테스트 클래스에 `@MainActor` 추가로 해결

3. **Mock Repository 작성**
   - Combine의 `Just`, `Fail` 사용법
   - `setFailureType` 이해

## 💡 해결 방법
1. **Combine → async/await:**
```swift
   let result = try await publisher.values.first(where: { _ in true })
```

2. **@MainActor:**
```swift
   @MainActor
   final class TodoViewModelTests: XCTestCase { }
```

3. **Just vs Fail:**
   - 성공: `Just(value)`
   - 실패: `Fail(error: error)`

## ✅ 체크리스트
- [ ]
- [ ] GitHub 커밋

## 📝 내일 할 것
- UI Testing 학습
- Snapshot Testing
- CI/CD 기초 (GitHub Actions)
