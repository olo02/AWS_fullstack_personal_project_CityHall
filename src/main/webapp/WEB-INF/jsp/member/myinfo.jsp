<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common/head.jsp" %>	
</head>
<body>
<div class="wrap">
	<%@ include file="../common/header.jsp" %>	
	<%@ include file="../common/nav.jsp" %>	
        <main>
            <div class="title-wrap">
                <h1>내 정보 조회</h1>
            </div>
            <div class="join-process signup-process">
            </div>

            <form method="post" class="signup-form" name ="signupForm">
                <div class="id-info">
                    <div class="frm-subhead">
                        <h4>회원 정보</h4>
                    </div>
                    <div class="frm-input">
                        <h5>아이디</h5>
                        <input id = "id" name = "id" value="${member.id}"
                            autofocus readonly>
                        <br>
                        <h5>이름</h5>
                        <input id = "name" name = "name" readonly value="${member.name}"
                        >
                        <br>
                        <h5>주소</h5>
                        <input type="" id = "address" name = "address" value="${member.address}"
                            readonly>
                        <br>
                        <h5>이메일</h5>
                        <input type="email" id = "email" name = "email" value="${member.email }"
                            readonly>
                    </div>
                </div>
               	<a href="${pageContext.request.contextPath}/member/mypage">
	                <div class="tolist">
	                    <h4>목록으로</h4>
	                </div>
	            </a>
                
                <a href="${pageContext.request.contextPath}/member/modifyme" class="write-btn myinfo-btn">수정하기</a>

            </form>

        </main>
	<%@ include file="../common/footer.jsp" %>	
</div>
</body>


</html>