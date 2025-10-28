# 2025-10-28 iOS + AI Day 2

## 📚 오늘 배운 것

### iOS (3.5시간)
- @Binding 개념 학습
- @Binding 실습 3개(Slider, Picker, TextField)

### AI (1.5시간)
- 이미지 분류 구현

## 💻 코드
```swift
// 핵심 코드
    func classify(image: UIImage) {
        guard let model = model else { return }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else { return }
            
            print("분류: \(topResult.identifier)")
            print("확률: \(topResult.confidence)")
            DispatchQueue.main.async {
                self.resultLabel = topResult.identifier
                self.confidence = topResult.confidence
            }
        }
        
        guard let ciImage = CIImage(image: image) else { return}
        let handler = VNImageRequestHandler(ciImage: ciImage)
        try? handler.perform([request])
    }

```

## 🤔 어려웠던 점
- CoreML을 사용한 이미지 분류 기능을 이해하는데 어려움

## 💡 해결 방법
- ChaGPT와 구글링을 통해 블로그 글 확인함 -> 여전히 어려움

## 💡 배운 것
- @Binding의 값도 바꾸면 @State의 값도 바뀐다는것
- TextField에서 입력하는 텍스트를 @State엔 영향이 주는걸 알지만. 다음뷰로 Binding 해서 넘겼을때도 영향을 주는건 신기했다.

## ✅ 체크리스트
- [x] @Binding 학습, 실습
- [x] CoreML 이미지 분류 구현, 실행
- [x] TODO 앱 세팅
- [x] GitHub 커밋

## 📝 내일 할 것
- @StateObject
- @ObservedObject
- MVVM 패턴
- CreateML 소개
- 간단한 분류 모델
- TODO 앱(MVVM)
