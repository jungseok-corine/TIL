# 2025-11-05 iOS + AI Day 3

## 📚 오늘 배운 것

### iOS (3.5시간)
**CoreData 기초**
- NSManagedObject, NSManagedObjectContext 이해
- Entity 설계 및 Attributes 추가
- CRUD 구현 (Repository Pattern)
- NSFetchRequest로 데이터 조회
- NSPredicate로 필터링

**핵심 깨달음:**
- CoreData는 UserDefaults보다 복잡하지만 강력함
- Repository Pattern으로 추상화하면 나중에 API로 교체 가능
- NSPredicate 문법이 SQL과 비슷

### AI (1.5시간)
**MLX 소개**
- Apple Silicon 최적화 프레임워크
- 통합 메모리 활용
- NumPy와 유사한 API
- 행렬 연산, Broadcasting

## 💻 코드
```swift
class CoreDataTodoRepository: TodoRepositoryProtocol {
    func addTodo(_ todo: TodoItem) async throws {
        let entity = TodoEntity(context: context)
        entity.id = todo.id
        // ...
        try context.save()
    }
}
```

## 🤔 어려웠던 점
1. **NSFetchRequest Predicate 문법**
   - format 문자열이 익숙하지 않음
   - %@ vs %d 구분

2. **CoreData Context 관리**
   - 언제 save()를 호출해야 하는지
   - 에러 처리 방법


## 💡 해결 방법
- Apple 공식 문서 참고
- NSPredicate 치트시트 정리
- 예제 코드 여러 번 실행하며 이해


## 📝 내일 할 것
- Combine 학습
- Publisher, Subscriber 개념
- MLX로 간단한 신경망 구현
- TODO 앱 Combine 적용
