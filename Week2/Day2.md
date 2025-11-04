# 2025-11-04 iOS + AI Day 2

## 📚 오늘 배운 것

### iOS (3.5시간)
**데이터 영구 저장**
- UserDefaultsTodoRepository 구현
- JSON Codable 패턴
- TodoItem을 JSON으로 인코딩/디코딩
- UserDefaults로 디스크에 저장

**Repository 패턴의 유연성**
- DIContainer에서 단 한 줄만 수정
- 메모리 ↔ UserDefaults 쉽게 전환
- ViewModel, View는 전혀 수정 안 함

**Error Handling**
- Alert로 사용자에게 에러 표시
- onChange로 에러 상태 감지

### AI (1.5시간)
**Create ML Text Classification**
- 영화 리뷰 데이터로 모델 학습
- Training 약 73개, Validation 16개, Testing 16개
- 학습 정확도: 95%
- 테스트 정확도: 87%

**모델 통합**
- MovieSentimentClassifier.mlmodel 생성
- SentimentAnalyzer 클래스 구현
- 실시간 감정 분석 UI 완성

**Natural Language Framework**
- 언어 감지
- 토큰화 (단어 분리)
- 개체명 인식
- 텍스트 통계

## 💻 코드

### UserDefaults 저장

```swift
// JSON 인코딩
let data = try encoder.encode(todos)
userDefaults.set(data, forKey: "todos")

// JSON 디코딩
let data = userDefaults.data(forKey: "todos")
let todos = try decoder.decode([TodoItem].self, from: data)
```

### Repository 교체 (1줄)
```swift
// 메모리 → UserDefaults
private lazy var todoRepository: TodoRepositoryProtocol = {
    return UserDefaultsTodoRepository.shared
}()
```

## 🤔 어려웠던 점
1. **비동기 처리**
   - async/await와 MainActor
   - UI 업데이트 타이밍

2. **Create ML 학습**
   - 데이터 부족으로 정확도 낮음
   - 더 많은 데이터 필요

## 💡 해결 방법
-

## ✅ 체크리스트
- [x] UserDefaultsTodoRepository 구현 완료
- [x] 데이터 영구 저장 성공
- [x] Repository 교체 테스트 (메모리 ↔ UserDefaults)
- [x] Create ML 모델 학습 완료 (87% 정확도)
- [x] 감정 분석 UI 완성
- [x] Natural Language Framework 기초 학습
- [x] Git 커밋 3개

## 📝 내일 할 것
- CoreData 학습 및 적용
- TodoRepository를 CoreData로 변경
- Relationship (할 일 - 카테고리)
- 더 복잡한 데이터 구조
