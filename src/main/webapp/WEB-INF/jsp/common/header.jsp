<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
        <header>
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/img/citylogo.png"></a>
            </div>
            <c:if test="${indexsearch == 'indexsearch'}">
	            <div class="top-search">
	            <form action="${pageContext.request.contextPath}/board/notice">
	               	<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
					<input type="hidden" name="category" value="1">
					<input type="hidden" name="type" value="title">
					<input type="hidden" name="type" value="content">
					<input type="hidden" name="type" value="writer">
	                
	                <input id ="search" name ="keyword" placeholder = "운응시 소식이 궁금하신가요?">
	                <button>
		                <img src="${pageContext.request.contextPath}/img/searchmain.png">
	                </button>
	            </form>
	            </div>
            </c:if>
            <c:if test="${indexsearch != 'indexsearch'}">
            	<c:if test="${member == null}">
            	<div class="logo-select">
	            	<a href="${pageContext.request.contextPath}/member/signin">로그인</a>
	            	<a href="${pageContext.request.contextPath}/member/contract">회원가입</a>
            	</div>
            	</c:if>
            	<c:if test="${member != null}">
            	<div class="logo-select">
	            	<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	            	<a href="${pageContext.request.contextPath}/member/mypage">나의 정보</a>
            	</div>
            	</c:if>
            	
            </c:if>

        </header>