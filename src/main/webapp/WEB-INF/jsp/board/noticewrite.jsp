<%@page import="java.util.ArrayList"%>
<%@page import="city.olooe.jsp.domain.Board"%>
<%@page import="java.util.List"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@ include file="../common/head.jsp" %>	
</head>

<body>
<div class="wrap">
	<%@ include file="../common/header.jsp" %>	
	<%@ include file="../common/nav.jsp" %>	
        <main>
            <div class="board-title main">
                <h1>운응 소식 작성하기</h1>
            </div>
            <div class="board-info-wrap">
                <div class="board-info">
                    <h3>정보 공개의 의의</h3>
                    <p>- 공공기관이 직무상 작성 또는 취득하여 관리하고 있는 정보를 국민의 청구에 의하여 열람, 사본, 복제 또는 정보통신망을 통하여 공개하거나, 공공기관이 자발적으로 보유하고 있는 정보를 배포 또는 공표 등의 형태로 제공하는 것</p>
                    <p>- 국민의 알권리를 충족하고 국민의 국정참여를 통한 국민주권주의의 실질적인 보장가능</p>
                </div>
            </div>
            
            <form method="post">
	            <div class="detailform writeform">
	                <div class="write-title">
	                    <h3>제목 </h3><input type="text" id= "title" placeholder="제목을 입력하세요" name="title" autofocus /> 
	                    <h4>작성자 </h4><input type="text" id= "writer" placeholder="작성자를 입력하세요" name="writer"
	                    	value="${member.id}" readonly> 
	                </div>
	                <div class="detail">
	                    <textarea name="content" id=content placeholder="내용을 입력하세요"></textarea>
	                </div>
	                <a href="${pageContext.request.contextPath}/board/notice">
	                    <div class="tolist">
	                        <h4>목록으로</h4>
	                    </div>
	                </a>
	            </div>
                <button class="write-btn">작성하기</button>
            </form>
        </main>
	
	<%@ include file="../common/footer.jsp" %>	
	</div>
</body>
</html>