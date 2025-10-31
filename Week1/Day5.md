# 2025-10-31 iOS + AI Day 5

## 📚 오늘 배운 것

### iOS (3.5시간)
- NavigationStack 학습
- Todo 디테일 화면 구현
- NavigationStack 심화 - Deep Link
- init에서 @State 초기화 방법

### AI (1.5시간)
- ModelEvaluator 클래스 구현
- 모델 정확도 계산 방법
- 예측 시간 측정 방법
- 모델 최적화 개념 (양자화, 프루닝)

## 💻 코드
```swift
// NavigationStack
NavigationStack(path: $navigationPath) {
    // ...
}
.navigationDestination(for: TodoRoute.self) { route in
    // ...
}

// 예측 시간 측정
let startTime = Date()
// 예측 실행
let elapsedTime = Date().timeIntervalSince(startTime)
```

## 🤔 어려웠던 점
- async/await 처리가 복잡함

## 💡 해결 방법
-

## ✅ 체크리스트
- [x] NavigationStack 개념 이해
- [x] navigationDestination 사용법 학습
- [x] TODO 디테일 화면 구현
- [x] Deep Link 처리 구현
- [x] 모델 정확도 측정
- [x] 예측 시간 측정
- [x] 혼동 행렬 작성
- [x] 모델 최적화 방법 이해
- [x] GitHub 커밋

## 📝 내일 할 것
- 로그인 화면 UI 구현
- Vision Framework 얼굴 인식
- Vision Framework 텍스트 인식

