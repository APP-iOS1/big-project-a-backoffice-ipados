# Back-Office-App

### 앱의 소개

<br>

```
관리자용 백오피스 맥앱
```

<br>

### 주요 기능

```
- Login : 권한 별 기능 제한
- 대시보드 : 전반적인 고객, 스토어 앱의 데이터를 차트로 표시(에니메이션 적용)
- 고객 관리 : 고객의 모든 데이터 조회, 검색 및 필터 기능
- 가게 정보 : 가게의 모든 데이터 조회, 검색 및 필터 기능, 가게 이용 정지 기능
- 입점 관리 : 가게 입점 승인 처리, 기록 조회 가능
- 가게별 결제 내역 : 가게의 결제 내역을 표시
- 앱 알림 관리 : 특정 사용자에게 직접적인 메시지 전송 및 기록 확인
- 신고 : 신고된 가게 조회
```

### 스크린샷

<Blockquote>
실제 앱 구동화면입니다.
</Blockquote>

| <img src="asd" width="180"> | <img src="asd" width="180"> | <img src="asd" width="180"> | <img src="asd" width="180"> |
| :-------------------------: | :-------------------------: | :-------------------------: | :-------------------------: |
|           로그인            |          대시보드           |          고객관리           |          가게 정보          |
| <img src="asd" width="180"> | <img src="asd" width="180"> | <img src="asd" width="180"> | <img src="asd" width="180"> |
| :-------------------------: | :-------------------------: | :-------------------------: | :-------------------------: |
|           로그인            |          대시보드           |          고객관리           |          가게 정보          |

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

- Firebase/FireStore
- Firebase/Auth
- Charts

<br>

## ⚙️ 개발 환경

- iPad Pro(12.0-inches) 가로모드 최적화됨
- 다크모드 미지원
- iOS 16이상
  <br>
  <br>

## 아쉬운 점

- 서찬호 : 처음 계획했던 기능들을 모두 구현하지 못했다. 다른 팀과의 협업 과정에서 효율적으로 작업을 진행하지 못했다. 백오피스 앱에 대한 참고 자료가 부족해서 방향성을 잡기 어려웠다.

- 박정우 : 다른 팀과 커뮤니케이션이 부족했다. 내가 만든 기능이 다른 앱에서는 보여줄 view가 없다든지, 데이터 모델이 맞지 않는다든지 이런저런 일이 많았다.

- 허두영 : 멀티플렛폼 앱을 만들지 못했다. 최신기능 위주로 작업을 진행해서 정보를 찾기 어려웠다.

- 서광현 : 아쉽지 않다. 너무 행복함!

- 장다영 : 관리자-스토어-고객 간의 데이터흐름과 시나리오를 디테일한 부분까지 꼼꼼히 정하고 시작했으면 더 수월했을 것 같아 아쉬움이 느껴진다.
  <br>
  <br>

## 시간이 주어진다면 해볼 일

- 서찬호 : 페이징 or 무한스크롤 기능 구현, 검색 기능 고도화, 알림 기능 구현

- 박정우 : 앱 내의 모든 Dummy 데이터를 없애고 싶습니다.

- 허두영 : macOS에서도 구동되는 앱을 만들고 싶습니다.

- 서광현 : 데이터베이스 구조를 더 아름답게 바꾸고 싶다.

- 장다영 : 데이터베이스 구조를 더 아름답게 바꾸고 싶다.
  <br>
  <br>

## 👨‍👩‍👧‍👦 참여자

<div align="center">
  <table style="font-weight : bold">
      <tr align="center">
          <td colspan="5"> 팀 목표 : ipad 용 백오피스 앱 만들기</td>
      </tr>
      <tr>
          <td align="center">
              <a href="https://github.com/SeoChanHo">                 
                  <img alt="서찬호" src="https://avatars.githubusercontent.com/SeoChanHo" width="80" />            
              </a>
          </td>
          <td align="center">
              <a href="https://github.com/Heodoo">                 
                  <img alt="허두영" src="https://avatars.githubusercontent.com/Heodoo" width="80" />            
              </a>
          </td>
          <td align="center">
              <a href="https://github.com/jwoo820">                 
                  <img alt="박정우" src="https://avatars.githubusercontent.com/jwoo820" width="80" />            
              </a>
          </td>
          <td align="center">
              <a href="https://github.com/seo-kh">                 
                  <img alt="서광현" src="https://avatars.githubusercontent.com/seo-kh" width="80" />            
              </a>
          </td>
          <td align="center">
              <a href="https://github.com/Da01002">                 
                  <img alt="장다영" src="https://avatars.githubusercontent.com/Da01002" width="80" />            
              </a>
          </td>
      </tr>
      <tr>
          <td align="center">PO, FrontEnd</td>
          <td align="center">FrontEnd</td>
          <td align="center">FrontEnd</td>
          <td align="center">BackEnd</td>
          <td align="center">BackEnd</td>
      </tr>
      <tr>
          <td align="center">서찬호</td>
          <td align="center">허두영</td>
          <td align="center">박정우</td>
          <td align="center">서광현</td>
          <td align="center">장다영</td>
      </tr>
  </table>
</div>
