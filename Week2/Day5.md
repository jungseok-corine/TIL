# 2025-11-07 iOS + AI Day 5

## 📚 오늘 배운 것

### iOS (3.5시간)
**네트워킹 기초**
- URLSession + async/await
- Codable로 JSON 파싱
- Custom Error 처리
- NetworkService 구현

**OpenAI API 통합**
- Chat Completions 구현
- 스트리밍 응답 처리
- SSE (Server-Sent Events) 파싱

**핵심 깨달음:**
- async/await가 콜백 지옥을 해결
- Codable이 JSON 파싱을 엄청 쉽게 만듦
- 스트리밍이 UX를 크게 향상

### AI (1.5시간)
**OpenAI API**
- Token 기반 과금 이해
- GPT-4o vs GPT-4o-mini 비교
- 프롬프트 엔지니어링 기초
- Temperature로 창의성 조절

**비용 최적화:**
- GPT-4o-mini 사용으로 96% 절감
- Max Tokens 제한
- 대화 히스토리 관리

## 💻 코드

### async/await 네트워킹
```swift
let (data, response) = try await URLSession.shared.data(for: request)
let result: T = try decoder.decode(T.self, from: data)
```

### 스트리밍 응답
```swift
for try await line in bytes.lines {
    if line.hasPrefix("data: ") {
        // SSE 파싱
    }
}
```

## 🤔 어려웠던 점
1. **스트리밍 응답 파싱**
   - SSE 형식 이해
   - "[DONE]" 신호 처리
   - JSON 파싱 에러 핸들링

2. **에러 처리**
   - 401, 429 등 다양한 상태 코드
   - 사용자 친화적 에러 메시지

## 💡 해결 방법
- OpenAI 공식 문서 정독
- Postman으로 먼저 API 테스트
- 작은 단위로 테스트하며 구현

## 📝 내일 할 것
- Keychain으로 API 키 안전하게 저장
- SSL Pinning 학습
- Claude API 통합
- 프롬프트 최적화 심화
