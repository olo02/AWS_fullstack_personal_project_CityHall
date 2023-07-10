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
                <h1>민원 신청하기</h1>
            </div>
            <div class="board-info-wrap">
                <div class="board-info">
                    <p>- 신청하신 민원은 '민원 처리에 관한 법률 및 시행령'에 따라 처리되고 있습니다.</p>
                    <p>- 운응시 이외의 민원은 정부부처, 타 지방 자치단체, 공공기관 등 해당 기관으로 이송 처리됩니다.</p>
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
	                <div style="height:70px; float:left;" title="비밀글로 설정하면 작성자와 관리자만 확인할 수 있습니다">
	                <h3 style="float:left" >비밀글 설정</h3>
					<input type="checkbox" id="lockpw" name="lockpw" 
						/>
	                </div>

	                <a href="${pageContext.request.contextPath}/board/free">
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