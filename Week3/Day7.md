# 2025-11-16 iOS + AI Day 7

## 📚 오늘 배운 것

### iOS (3.5시간)
**CoreData 통합 시작**
- CoreData Entity 설계 및 생성
- TodoItem ↔ TodoEntity 매핑
- CoreDataTodoRepository 구현
- In-Memory Store for Testing

**핵심 개념**
- NSManagedObjectContext: CoreData 작업 공간
- NSPersistentContainer: CoreData Stack 관리
- Mapper Pattern: Domain Model ↔ Entity 변환

### AI (1.5시간)
-

## 💻 코드
```swift
// Mapper Pattern
static func toDomain(_ entity: TodoEntity) -> TodoItem {
    TodoItem(
        id: entity.id ?? UUID(),
        title: entity.title ?? "",
        isCompleted: entity.isCompleted,
        createdAt: entity.createdAt ?? Date()
    )
}
```

## 🤔 어려웠던 점
1. Context 관리
   - 언제 save()를 호출해야 하는지
   - rollback()은 언제 쓰는지

## 💡 해결 방법
- save() 전에 항상 do-catch로 에러 핸들링
- 실패시 rollback()으로 변경사항 취소
- 테스트에서 In-Memory Store 사용

## ✅ 체크리스트
- [x] CoreData Entity 생성
- [x] Mapper 구현
- [x] CoreDataTodoRepository 구현
- [x] 테스트 코드 작성
- [x] 앱에서 데이터 영속화 확인


## 📝 내일 할 것
-
