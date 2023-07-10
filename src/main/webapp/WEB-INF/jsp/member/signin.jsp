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
        <main class="signin">
            <div class="signin-main">
                <h2>운응시 통합 로그인</h2>
                <p>
                    운응시를 방문해주셔서 감사합니다.<br>로그인하시면 보다 편리하게 서비스 이용이 가능합니다.
                </p>
                <form method="post" class="signin-form" name ="signinForm">
                    <input type="text" id = "id" name = "id" 
                        placeholder = "아이디(4~15자의 영문, 숫자만 가능)" >
                    <br>
                    <input type = "password" id = "pw" name = "pw" 
                        placeholder = "비밀번호" >
                    <label class="chk"><input type = "checkbox" name = chk 
                        value = "remember-me">아이디 저장
                    </label>
                    <div class="sign-error"> ${param.msg} </div>
                    <button class="login" id="login" type="submit" >로그인</button>
                </form>
                <div class="selectsign">
                    <a href="${pageContext.request.contextPath}/member/findinfo">아이디/비밀번호 찾기</a>
                    <p>|</p>
                    <a href="${pageContext.request.contextPath}/member/contract">회원가입</a>                
                </div>
        </main>	
	<%@ include file="../common/footer.jsp" %>	
</div>

</body>
</html>