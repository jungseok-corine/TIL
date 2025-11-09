# 2025-11-08 iOS + AI Day 6

## 📚 오늘 배운 것

### iOS (3.5시간)
**보안 모듈**
- Keychain으로 API 키 암호화 저장
- SSL Pinning으로 MITM 공격 방어
- Jailbreak/디버거 탐지
- 앱 보안 체크리스트

**Claude API 통합**
- OpenAI와 구조 비교
- 200K context window 활용
- XML 태그로 구조화된 프롬프트

**핵심 깨달음:**
- Keychain은 UserDefaults보다 안전
- SSL Pinning은 금융 앱 수준 보안
- Claude는 긴 문서 처리에 강함

### AI (1.5시간)
**프롬프트 최적화**
- XML 태그로 구조화
- System Prompt 전략
- Context Window 관리
- 프롬프트 템플릿 패턴

**OpenAI vs Claude:**
- Claude: 긴 컨텍스트, 안전성
- OpenAI: 빠른 속도, 다양한 모델
- 용도에 따라 선택

## 💻 코드
### Keychain 저장
```swift
let query: [String: Any] = [
    kSecClass as String: kSecClassGenericPassword,
    kSecAttrAccount as String: key,
    kSecValueData as String: data
]
SecItemAdd(query as CFDictionary, nil)
```

### SSL Pinning
```swift
func urlSession(
    _ session: URLSession,
    didReceive challenge: URLAuthenticationChallenge,
    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
)
```

## 🤔 어려웠던 점
1. **SSL Pinning 복잡도**
   - 인증서 해시 계산
   - URLSessionDelegate 구현
   - 인증서 갱신 시 대응

2. **Claude API 구조 차이**
   - max_tokens 필수
   - system 파라미터 위치
   - 응답 구조 차이


## 💡 해결 방법
- 공식 문서 정독
- Postman으로 API 테스트
- OpenAI와 Claude 코드 나란히 비교


## 📝 내일 할 것
- Week 2 복습
- AI 챗봇 데모 완성
- Week 3 준비
- 프로젝트 아이디어 구체화
