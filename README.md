# PIPKit

iOS용 Picture-in-Picture (PIP) 라이브러리입니다. UIViewController를 간단하게 PIP 모드로 전환할 수 있습니다.

iOS 13+ Scene 기반 앱을 지원합니다.

## 요구사항

- iOS 13.0+
- Swift 5.9+

## 설치

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/mobidoo-official/PIPKit.git", from: "1.0.0")
]
```

또는 Xcode에서:
1. File > Add Package Dependencies...
2. URL 입력: `https://github.com/mobidoo-official/PIPKit.git`

## 사용법

### 1. PIPUsable 프로토콜 구현

```swift
import PIPKit

class PlayerViewController: UIViewController, PIPUsable {

    // PIP 창 크기
    var pipSize: CGSize {
        return CGSize(width: 150, height: 267)  // 9:16 비율
    }

    // 초기 상태 (full 또는 pip)
    var initialState: PIPState {
        return .full
    }

    // 초기 위치
    var initialPosition: PIPPosition {
        return .bottomRight
    }

    // 상태 변경 콜백
    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIP 모드로 전환됨")
        case .full:
            print("전체 화면으로 전환됨")
        }
    }

    // 위치 변경 콜백
    func didChangePosition(_ position: PIPPosition) {
        print("위치 변경됨: \(position)")
    }
}
```

### 2. PIP 표시/해제

```swift
// PIP 창 표시
let playerVC = PlayerViewController()
PIPKit.show(with: playerVC)

// PIP 창 해제
PIPKit.dismiss(animated: true)
```

### 3. PIP 모드 전환

```swift
// PIP 모드로 전환 (ViewController 내부에서)
startPIPMode()

// 전체 화면으로 전환
stopPIPMode()
```

## PIPUsable 프로토콜 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| `initialState` | `PIPState` | `.pip` | 초기 상태 |
| `initialPosition` | `PIPPosition` | `.bottomRight` | 초기 위치 |
| `insetsPIPFromSafeArea` | `Bool` | `true` | Safe Area 적용 여부 |
| `pipEdgeInsets` | `UIEdgeInsets` | `15pt all` | 화면 가장자리 여백 |
| `pipSize` | `CGSize` | `200x112.5` | PIP 창 크기 |
| `pipShadow` | `PIPShadow?` | 기본 그림자 | PIP 창 그림자 |
| `pipCorner` | `PIPCorner?` | 6pt radius | 모서리 둥글기 |

## PIPPosition

PIP 창은 6개 위치로 스냅됩니다:

- `.topLeft` - 왼쪽 상단
- `.topRight` - 오른쪽 상단
- `.middleLeft` - 왼쪽 중앙
- `.middleRight` - 오른쪽 중앙
- `.bottomLeft` - 왼쪽 하단
- `.bottomRight` - 오른쪽 하단

## 기능

- 드래그로 PIP 창 이동
- 6개 위치로 자동 스냅 (바운스 애니메이션)
- 키보드 표시 시 자동 위치 조정
- Safe Area 지원
- 그림자 및 모서리 라운딩 커스터마이징
- iOS 13+ Scene 기반 앱 지원

## License

MIT License

## Credits

Original by [Kofktu](https://github.com/Kofktu)
Modified for iOS 13+ Scene support by Mobidoo
