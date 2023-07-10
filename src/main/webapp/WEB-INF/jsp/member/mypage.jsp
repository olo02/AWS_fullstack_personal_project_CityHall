<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common/head.jsp" %>
</head>
<body>
<div class="wrap mypage-wrap">
	<%@ include file="../common/header.jsp" %>	
	<%@ include file="../common/nav.jsp" %>	
        <main class="signin">
            <div class="signin-main mypage-main">
                <h2>${member.name}님, 환영합니다</h2>
                <p>
                    운응시를 방문해 주셔서 감사합니다. 편리하게 서비스를 이용하세요.
                </p>
				
				<a href="myinfo">
	                <div class="mypage-modify mypage-read">
	                	<h3>내 정보 조회</h3>
	                	<div>
	                		<img src="${pageContext.request.contextPath}/img/mypage-me.png">
	                	</div>
	       	        </div>
				</a>                
				<a href="modifyme">
	                <div class="mypage-modify">
	                	<h3>내 정보 수정</h3>
	                	<div>
	                		<img src="${pageContext.request.contextPath}/img/mypage-modify.png">
	                	</div>
	       	        </div>
				</a>                
				<a href="withdrawal">
	                <div class="mypage-modify withdrawal">
	    	            <h3>회원 탈퇴</h3>
	       	        </div>
				</a>
			</div>
        </main>	
<%@ include file="../common/footer.jsp" %>

<script>
	$(function() {
	    $("a[href$='withdrawal']").click(function(){
	    if(!confirm("확인을 누르시면 모든 회원 정보가 삭제됩니다. 정말 탈퇴하시겠습니까?")){
			return false;	    	
	    }
	    else{
	    	alert("운응시를 이용해 주셔서 감사합니다")
	    }
		})
	});
	

</script>

</div>
</body>
</html>