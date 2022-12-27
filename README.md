# Back-Office-App 

### 앱의 소개

<br>

```
관리자용 백오피스 맥앱
```

<br>

### 코드 컨벤션

```
- [Feat] 새로운 기능 구현
- [Chore] 코드 수정, 내부 파일 수정, 주석
- [Add] Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시, 에셋 추가
- [Fix] 버그, 오류 해결
- [Del] 쓸모없는 코드 삭제
- [Move] 파일 이름/위치 변경
```

### 깃 브랜치

- feat/이슈번호-큰기능명/세부기능명

```
예시)
feat/13-tab1/map
feat/13-tab1/search
feat/26-tab2/recipe
```

### 폴더링 컨벤션

```
📦 BackOfficeTeamA
|
+ 🗂 App
|
+ 🗂 Configuration
|
+------🗂 Constants   // 기기의 제약사항: width, height를 struct로 관리
│
+------🗂 Extensions  // extension 모음
│
+------🗂 UIConfig       // UI 관련 모음
│
+ 🗂 Sources
|
+------🗂 Models      // Json을 받기 위한 Hashable, Codable, Identifiable 프로토콜을 체택한 struct 관리
│
+------🗂 Views       // 여러 View를 모음
│       |
│       +------🗂 Ad
│       │
│       +------🗂 Customer
│       |
│       +------🗂 Home
│       |
│       +------🗂 Log
│       │
│       +------🗂 Notice
│       |
│       +------🗂 Notification
│       |
│       +------🗂 Payment
│       │
│       +------🗂 Report
│       |
│       +------🗂 Store
|       |
│       +------🗂 StoreUser
|
+------🗂 ViewModels

```

<br>

## ⚒️ 활용한 기술

- JSON
- mocki.io // Mock API 제작 서비스

<br>

## ⚙️ 개발 환경

- iPad Pro(12.0-inches)에서 최적화됨
- 다크모드 미지원
  <br>
