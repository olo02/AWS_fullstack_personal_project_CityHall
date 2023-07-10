<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="city.olooe.jsp.domain.Board"%>
<%@page import="java.util.List"%>
    
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
            <div class="board-title main">
                <h1>운응 소식</h1>
            </div>
            <div class="board-info-wrap">
                <div class="board-info">
                    <h3>정보 공개의 의의</h3>
                    <p>- 공공기관이 직무상 작성 또는 취득하여 관리하고 있는 정보를 국민의 청구에 의하여 열람, 사본, 복제 또는 정보통신망을 통하여 공개하거나, 공공기관이 자발적으로 보유하고 있는 정보를 배포 또는 공표 등의 형태로 제공하는 것</p>
                    <p>- 국민의 알권리를 충족하고 국민의 국정참여를 통한 국민주권주의의 실질적인 보장가능</p>
                
                <!-- 관리자 모드일 때 공지사항 작성 권한 부여 -->
                <c:if test="${member.id =='olooe'}">
                <div class="writingbtn">
                    <a id="noticewrite" href="${pageContext.request.contextPath}/board/noticewrite">작성하기(관리자)</a>
                </div>
                </c:if>
                </div>
            </div>

            <div class="board-search main">
                    <!-- 검색 기능 -->
            	<form>
            	<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="${page.cri.amount}">
				<input type="hidden" name="category" value="${page.cri.category}">
            	
            	<div class="search-list">
					<input class="list-header" type="checkbox" id="check1"
						name="type" value="title" ${fn:contains(fn:join(page.cri.type,','), 'title') ? 'checked' : ''}> 
						<label for="check1">제목</label> 
					<input class="list-header" type="checkbox" id="check2"
						name="type" value="content" ${fn:contains(fn:join(page.cri.type,','), 'content') ? 'checked' : ''}> 
						<label for="check2">내용</label> 
					<input class="list-header" type="checkbox" id="check3"
						name="type" value="writer" ${fn:contains(fn:join(page.cri.type,','), 'writer') ? 'checked' : ''}> 
						<label for="check3">작성자</label>
            	</div>
            	
	            <input class="searchbox" type="text" placeholder="검색어를 입력하세요" name="keyword"
    	        	id="search" value="${page.cri.keyword}">
				<button class="searchbox-icon" type="submit">
	                <img src="${pageContext.request.contextPath}/img/searchmain.png">
				</button>            		
            	</form>
    
				<c:set var="amounts" value="10, 25, 50" />
				<select class="selectIconCount">
					<c:forTokens items="${amounts}" delims=", " var="amount">
						<option value="${amount}"
							${page.cri.amount == amount ? 'selected' : ''}>${amount}개씩 보기
						</option>
					</c:forTokens>
				</select>				
            </div>
	            <table class="main">
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                    <th>조회</th>
	                </tr>
	                <c:forEach var="board" items="${boards}" varStatus="stat">
		                <tr onClick="location.href='detail?bno=${board.bno}&${page.cri.fullQueryString}'">
							<td>${board.bno}</td>
							<td>${board.title}
								<c:if test="${board.replyCnt == 0}"></c:if>
								<c:if test="${board.replyCnt != 0}">[${board.replyCnt}]</c:if>
							</td>
							<td>${board.writer == 'withdrawal' ? '탈퇴 회원' : board.writer}</td>
	                    	<td>${board.regdate}</td>
							<td>${board.hitcount}</td>
		                </tr>
					</c:forEach>
	        	
	            </table>
        		<div class="page">
					<c:if test="${page.prevPages}">
							<a class="page-link" href="notice?pageNum=${page.startPage - 1}&${page.cri.queryString}">
								<i class="fas fa-angle-double-left"></i>
							</a>
					</c:if>
					<c:if test="${page.prevPage}">
							<a href="notice?pageNum=${page.cri.pageNum - 1}&${page.cri.queryString}">
								<i class="fas fa-angle-left"></i>
							</a>
					</c:if>
					<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
							<a class="${page.cri.pageNum == i ? 'active' : ''}" href="notice?pageNum=${i}&${page.cri.queryString}">
							${i}
							</a>
					</c:forEach>
					<c:if test="${page.nextPage}">
							<a class="page-link" href="notice?pageNum=${page.cri.pageNum + 1}&${page.cri.queryString}">
								<i class="fas fa-angle-right"></i>
							</a>
					</c:if>
					<c:if test="${page.nextPages}">
							<a href="notice?pageNum=${page.endPage + 1}&${page.cri.queryString}">
								<i class="fas fa-angle-double-right"></i>
							</a>
					</c:if>
			</div>	
        </main>
	
	<%@ include file="../common/footer.jsp" %>
	</div>
</body>

<script>
	// 페이지네이션
	$(".selectIconCount").change(function() {
		console.log($(this).val());

		let page = '${page.cri.pageNum}';
		let amount = $(this).val();
		let category = '${page.cri.category}';
		let type = '${page.cri.type}';
		
		let obj = {
			pageNum : page,
			amount : amount
		};
		location.search = $.param(obj);
	});

	
	
	
	// 검색 타입 체크 연결
	$(".list-header: checkbox:checked").length ? '' : $(".list-header: checkbox:eq(0)").prop("checked", true);	
	console.log($(".list-header checkbox:checked").length)
	
	// 검색 타입 미지정 및 검색어 부재
	$(".list-header: form").submit(function() {
		console.log($(this).find(":checkbox:checked").length);
	
		if(!$(this).find(":checkbox:checked").length || !$(this).find(":text").val().trim() ) {
			alert("검색 타입을 지정하고 검색어를 입력하세요");
			return false;
		}
	});
	

</script>
</html>