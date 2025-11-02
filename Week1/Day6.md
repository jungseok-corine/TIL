# 2025-11-01 iOS + AI Day 6

## 📚 오늘 배운 것

### iOS (3.5시간)
- TODO 로그인 화면 UI 완성
- TODO 회원가입 화면 추가
- TDDO 이메일 유효성 검사 구현

### AI (1.5시간)
- 텍스트 인식 데모 작성
- 얼굴 인식 데모 작성

## 💻 코드
```swift
    func detectFace(in image: UIImage) async throws -> [VNFaceObservation] {
        guard let cgImage = image.cgImage else {
            throw NSError(domain: "Invalid image", code: 0)
        }
        
        let request = VNDetectFaceRectanglesRequest()
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try handler.perform([request])
        
        guard let observations = request.results else {
            return []
        }
        
        return observations
    }
    
    
    func recognizeText(in image: UIImage) async throws -> [String] {
        guard let cgImage = image.cgImage else {
            throw NSError(domain: "Invalud", code: 0)
        }
        
        let request = VNRecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR", "en-US"]
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try handler.perform([request])
        
        guard let observations = request.results else {
            return []
        }
        
        return observations.compactMap { observation in
            observation.topCandidates(1).first?.string
        }
    }

```

## 🤔 어려웠던 점
- 얼굴, 텍스트 인식 데모가 이해가 안감

## 💡 해결 방법
- 이해 될때까지 구글링

## ✅ 체크리스트
- [x] 로그인 화면 UI 완성
- [x] 회원가입 화면 추가
- [x] 이메일 유효성 검사 구현
- [x] Vision Framework 이해
- [x] 얼굴 인식 데모 작성
- [x] 텍스트 인식 데모 작성
- [x] TIL 작성

## 📝 내일 할 것
- Week 1 iOS 내용 완벽 복습
- Week 1 AI 내용 완벽 복습
- GitHub README 작성
- 프로젝트 정리
- Week 1 종합 TIL 작성
