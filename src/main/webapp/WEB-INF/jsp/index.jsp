<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="common/head.jsp" %>
</head>

<body>
	<div class="wrap indexwrap">
<%@ include file="common/header.jsp" %>
<%@ include file="common/nav.jsp" %>
        
        <main>
            <div class="slider-wrapper">
                <div class="slider">
                    <div>
                        <img src="./img/main_slider1.png">
                        <div class="slide-text">
                            운응시 홈페이지와 모바일 시티운응 통합 개편, 더 쉽고 간편한 정보 창구
                        </div>
                    </div>
                    <div>
                        <img src="./img/main_slider2.png">
                        <div class="slide-text">
                            모두 함께 나아가는 사회, 2023년 장애인단체 공모사업 지원 모집
                        </div>
                    </div>
                     <div>
                        <img src="./img/main_slider3.png">
                        <div class="slide-text">
                            코로나19 대응수준 완화 안내...대중교통 등 거리두기 2주간 유지 
                        </div>
                    </div>
                    <div>
                        <img src="./img/main_slider4.png">
                        <div class="slide-text">
                            청년의 바람이 정책으로! '청년정책네트워크' 모집
                        </div>
                    </div>
                    <div>
                        <img src="./img/main_slider5.png">
                        <div class="slide-text">
                            집에서도 무료로 주민등록등본 발급 가능! 온라인 민원 신청 서비스 안내
                        </div>
                    </div>

                </div>
            </div>
            
            <aside class="login-aside">
            <c:if test = "${empty member}">
                <div class="side-sign">
                    <div class="login-side-sign">
                        <p>운응시를 더 안전하고 편리하게 이용하세요</p>
                        <a href="${pageContext.request.contextPath}/member/signin"><div>로그인</div></a>
                        <a href="${pageContext.request.contextPath}/member/findinfo"><div>아이디/비밀번호 찾기</div></a>
                        <a href="${pageContext.request.contextPath}/member/contract"><div>회원가입</div></a>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty member }">
                <div class="side-signin">
                        <div class="login-me">
                            <p>${member.name}(${member.id })님,<br>운응시 방문을 환영합니다!</p>
                            <a href="member/logout"><div>로그아웃</div></a>
                        </div>
                        <div class="login-offer">
                            <a href="member/mypage"><div>나의 정보</div></a>
                            <a href="board/freewrite"><div>민원 신청</div></a>
                            <a href="board/notice"><div>운응 소식</div></a>
                        </div>
                </div>
			</c:if>                
                <div class="side-weather">
                    <div>
                        <p>운응시 오늘의 날씨</p>
                        <p>22˚C 맑음 <br>초미세먼지 <span style="color:red">위험</span></p>
                        <img src="./img/cloudy.png">
                    </div>
                </div>
                <div class="side-ad">
                    <a href="https://play.google.com/store/apps/details?id=kr.go.seoul.mobileseoulapp&hl=en_US&gl=US&pli=1" target="_blank">
                        <div>
                            <img src="./img/smartphone.png">
                            <p>'CITY운응'<br>App 다운로드</p>
                        </div>
                    </a>
                </div>
            </aside>

            <section class="main-service">
                    <div><h2>주요 서비스</h2></div>
                    <div>

                        <a href="https://coronaboard.kr/">
                            <div>
                                <div><img src="./img/icons-1-removebg-preview.png"></div>
                                코로나19 현황
                            </div>
                        </a>
                        <a href="https://yeyak.seoul.go.kr/web/main.do">
                            <div>
                                <div><img src="./img/icons-1286876-removebg-preview.png"></div>
                                공공서비스 예약
                            </div>
                        </a>
                        <a href="https://eungdapso.seoul.go.kr/main.do">
                            <div>
                                <div><img src="./img/icons-3-removebg-preview.png"></div>
                                온라인 민원
                            </div>
                        </a>
                        <a href="https://www.saramin.co.kr/zf_user/">
                            <div>
                                <div><img src="./img/icons-4-removebg-preview.png"></div>
                                운응 일자리
                            </div>
                        </a>
                        <a href="https://www.youtube.com/">
                            <div>
                                <div><img src="./img/icons-5-removebg-preview.png"></div>
                                운응 복지 서비스
                            </div>
                        </a>
                        <a href="https://www.tjoeun.co.kr/">
                            <div>
                                <div><img src="./img/icons-6-removebg-preview.png"></div>
                                운응 청년 정책
                            </div>
                        </a>
                        <a href="https://www.smc.seoul.kr/main/index.do">
                            <div>
                                <div><img src="./img/icons-7-removebg-preview.png"></div>
                                시의회
                            </div>
                        </a>
                    </div>
            </section>
            <div class="bottom-info">
                <div><h2>시민과 함께 도약하는 운응</h2></div>
                <div class="culture tour">
                    <div class="title">
                        <h3>운응문화관광</h3>
                        <h4>- 사계절 추천여행 -</h4>
                        <div>
                            <img src="./img/couple-5963678_1920.png">
                        </div>
                    </div>
                    <div class="info">
                        <a href="">
                            <div class="culture-img">
                                <img src="./img/img_tree.jpg">
                            </div>
                            <p>봄</p>
                        </a>
                        <a href="">
                            <div class="culture-img">
                                <img src="./img/img_seoul-71469_1920.jpg">
                            </div>
                            <p>여름</p>
                        </a>
                        <a href="">
                            <div class="culture-img">
                                <img src="./img/img_gyeongbokgung.jpg">
                            </div>
                            <p>가을</p>
                        </a>
                        <a href="">
                            <div class="culture-img">
                                <img src="./img/img_night-view-593026_1920.jpg">
                            </div>
                            <p>겨울</p>
                        </a>
                    </div>
                </div>
                <div class="culture news">
                    <div class="title">
                        <h3>운응 소식</h3>
                        <h4>new</h4>
                        <h4>2023년 맞이 운응시 유튜브 개설</h4>
                        <div><img src="./img/public-speaker-153728_1280.png"></div>
                    </div>
                    <div class="culture-video">
                        <iframe width="448" height="252" src="https://www.youtube.com/embed/faX2Cfl1xzY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </main>

<%@ include file="common/footer.jsp" %>

</div>
</body>
</html>