# 회원제 게시판, 운응시청 사이트 - Java Servlet / JSP

<div align="center">
<img width="500" alt="image" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/82b966ad-9fe0-4c0b-9489-d0fde5136ac6">

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Folo02%2FAWS_fullstack_personal_project_CityHall&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

[Demo Site](https://wooneung.olooe.city)
</div>

---

## 프로젝트 소개

> **AWS 풀스택 개발자 양성과정 개인 프로젝트** <br>
> **회원제 게시판 제작** <br>
> **개발기간: 2022.02.20 ~ 2022.03.21**

<br>

AWS 풀스택 개발자 과정의 HTML/CSS 수업 중 회원제 게시판 사이트를 제작하는 개인 프로젝트로 작업을 시작하였습니다. 어떠한 형태의 사이트를 제작할 지 고민 끝에 가상의 도시 '운응시' 시청 사이트를 만들게 되었습니다.

Java Servlet과 JSP를 사용하여 사이트의 기능을 구축하였고, DataBase는 MariaDB로 연결하였습니다.

<details markdown="1">
<summary>운응시?</summary>

도시명은 제작자의 별명인 '응공'을 뒤집어 '운응'시로 작명하게 되었습니다 :D

</details>

<br>

---

## 시작 가이드

### Requirements

For building and running the application you need:

- [Java 17](https://www.oracle.com/java/technologies/downloads/#java17) (Java 1.8 이상)

### Installation

```bash
$ git clone https://github.com/olo02/AWS_fullstack_personal_project_CityHall.git
```

---

## 설계

### Stacks

- #### Environment

    <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white">
    <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=for-the-badge&logo=Visual Studio Code&logoColor=white">

- #### Language

    <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
    <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
    <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
    <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">

- #### Framework & Library

    <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
    <img src="https://img.shields.io/badge/Java Servlet-FF7800?style=for-the-badge&logoColor=white">
    <img src="https://img.shields.io/badge/JSP-black?style=for-the-badge&logoColor=white">
    <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

- #### DataBase

    <img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white">

- #### Infrastructure

    <img src="https://img.shields.io/badge/Amazon EC2-FF9900?style=for-the-badge&logo=Amazon EC2&logoColor=white">
    <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=Nginx&logoColor=white">
    <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

### 요구사항

<div align="center">
<img width="500" alt="image" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/10d3a404-9b33-4c96-aa5d-f5995a22d930">
</div>

### ERD

<div align="center">
<img width="500" alt="image" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/a9235f53-3d69-47cf-b5c6-49aa2cb646bc">
</div>

---

## 화면 구성

<div align="center">

|                                                                   메인 페이지                                                                   |                                                                 회원가입 페이지                                                                 |
| :---------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------: |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/1c6c6b92-6944-4a4a-93ea-b97dfb744563"/> | <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/2220c32d-b628-42c8-8f65-f0a7ae4d3370"/> |
|                                                                  로그인 페이지                                                                  |                                                                   마이 페이지                                                                   |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/7befa2d7-0b6c-48ce-9669-6244ba68f5e6"/> | <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/2de195e4-4074-4e62-80d9-7d753b26ceae"/> |
|                                                                  게시판 페이지                                                                  |                                                                 글 작성 페이지                                                                  |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/f75082b3-7aec-4864-b20c-4d75519d5036"/> | <img width="500" src="https://github.com/olo02/AWS_fullstack_personal_project_CityHall/assets/121186383/f6cec749-b764-4a97-afbd-549bf956308b"/> |

</div>

---

## 기능

> [x] 작업완료 [ ] 작업예정

#### 회원가입

- [x] id 중복 검사
- [x] pw 유효성 검사
- [x] 비밀번호 암호화 : Bcrypt

#### 로그인

- [x] 유효성 검사

#### 아이디/비밀번호 찾기

- [x] 아이디 찾기
- [x] 비밀번호 찾기 : 임시 비밀번호 발급

#### 마이페이지

- [x] 내 정보 조회
- [x] 내 정보 수정
- [x] 탈퇴 : 탈퇴 시 회원이 작성한 댓글과 글을 탈퇴회원의 글로 전환

#### 게시판

- [x] 페이지네이션
- [x] 목록 보기의 글 개수 설정
- [x] 글 검색 : 제목 or 내용 or 작성자로 검색 가능
- 게시글
    - [x] 조회수
    - [x] 글 작성
    - [x] 글 수정
    - [x] 글 삭제
    - [x] 비밀글 : 작성자와 관리자만 확인 가능 
- 댓글
    - [x] 비동기 댓글 목록 조회
    - [x] 댓글 작성
    - [x] 댓글 삭제

---

## 아키텍쳐

### 디렉토리 구조

```bash
├── README.md
├── src/main
│   ├── java/city/olooe/jsp
│   │   ├── board/controller
│   │   ├── controller
│   │   ├── dao
│   │   ├── domain
│   │   ├── filter
│   │   ├── member/controller
│   │   ├── service
│   │   └── util
│   └── webapp
│       ├── WEB-INF
│       │   ├── jsp
│       │   │    ├── board : 게시판 관련 페이지
│       │   │    ├── common : header 및 footer 등
│       │   │    ├── member : 회원 관련 페이지
│       │   │    └── index.jsp : 메인 페이지
│       │   ├── lib
│       │   └── web.xml
│       ├── img
│       ├── common1.js
│       └── style29.css
└── .gitignore

```


---

## References

**참고 사이트**

- [서울시청](https://www.seoul.go.kr/main/index.jsp)
- [경주시청](https://www.gyeongju.go.kr/open_content/ko/index.do#self)
- [여수시청](https://www.yeosu.go.kr/)
- [청주시청](https://www.cheongju.go.kr/www/index.do)
- [Pixabay](https://pixabay.com/ko/)

README Template : [parkjiye](https://velog.io/@luna7182/%EB%B0%B1%EC%97%94%EB%93%9C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-README-%EC%93%B0%EB%8A%94-%EB%B2%95)
<br> Hit : [hit](https://hits.seeyoufarm.com/)
