<%@page import="java.util.ArrayList"%>
<%@page import="city.olooe.jsp.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <c:if test="${board.category == 1}">
            <div class="board-title main">
                <h1>운응 소식</h1>
            </div>
            <div class="board-info-wrap">
                <div class="board-info">
                    <h3>정보 공개의 의의</h3>
                    <p>- 공공기관이 직무상 작성 또는 취득하여 관리하고 있는 정보를 국민의 청구에 의하여 열람, 사본, 복제 또는 정보통신망을 통하여 공개하거나, 공공기관이 자발적으로 보유하고 있는 정보를 배포 또는 공표 등의 형태로 제공하는 것</p>
                    <p>- 국민의 알권리를 충족하고 국민의 국정참여를 통한 국민주권주의의 실질적인 보장가능</p>
                </div>
            </div>
        </c:if>
        <c:if test="${board.category == 2}">
            <div class="board-title main">
                <h1>민원 신청</h1>
            </div>
            <div class="board-info-wrap">
            <div class="board-info">
                <p>- 신청하신 민원은 '민원 처리에 관한 법률 및 시행령'에 따라 처리되고 있습니다.</p>
                <p>- 운응시 이외의 민원은 정부부처, 타 지방 자치단체, 공공기관 등 해당 기관으로 이송 처리됩니다.</p>
            </div>
            </div>
        </c:if>

            
            <form method="post">
	            <div class="detailform writeform">
            		<input type="hidden" name="bno" value="${board.bno}">
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="category" value="${cri.category}">
					<c:if test="${not empty cri.type}">
						<c:forEach items="${cri.type }" var="type">
							<input type="hidden" name="type" value="${type }">
						</c:forEach>
						<input type="hidden" name="keyword" value="${cri.keyword}">
					</c:if>
	            
	                <div class="write-title">
	                    <h3>제목 </h3><input type="text" id= "title" 
	                    name="title" value="${board.title}" autofocus /> 
	                    <h4>작성자 </h4><input type="text" id= "writer" name="writer"
	                    	value="${member.id}" readonly> 
	                </div>
	                <div class="detail">
	                    <textarea name="content" id="content">${board.content}</textarea>
	                </div>
	                <div style="height:70px; float:left;" title="비밀글로 설정하면 작성자와 관리자만 확인할 수 있습니다">
	                <h3 style="float:left" >비밀글 설정</h3>
					<input type="checkbox" id="lockpw" name="lockpw" 
						${board.lockpw == null ? '' : 'checked' }
						/>
	                </div>
	                <a href="${pageContext.request.contextPath}/board/${board.category == 1 ?'notice':'free'}">
	                    <div class="tolist">
	                        <h4>목록으로</h4>
	                    </div>
	                </a>
	            </div>
                <button formaction="modify" class="write-btn write-modify">저장</button>
                <a href="${board.category == 1?'notice':'free'}?${cri.fullQueryString }" class="write-cancel">
                	<div>취소</div>
                </a>
            </form>


        </main>
	
	<%@ include file="../common/footer.jsp" %>	
	</div>
</body>
</html>