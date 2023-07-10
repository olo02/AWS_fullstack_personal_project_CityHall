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
                <h1>민원 신청</h1>
            </div>
            <div class="board-info-wrap">
            <div class="board-info">
                <p>- 신청하신 민원은 '민원 처리에 관한 법률 및 시행령'에 따라 처리되고 있습니다.</p>
                <p>- 운응시 이외의 민원은 정부부처, 타 지방 자치단체, 공공기관 등 해당 기관으로 이송 처리됩니다.</p>
                <div class="writingbtn">
                    <a href="${pageContext.request.contextPath}/board/freewrite">민원 신청하기</a>
                </div>
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
            
            <!-- 1페이지당 글 조회 개수 지정 -->
				<c:set var="amounts" value="10, 25, 50" />
				<select class="selectIconCount">
					<c:forTokens items="${amounts}" delims=", " var="amount">
						<option value="${amount}"
							${page.cri.amount == amount ? 'selected' : ''}>${amount}개씩 보기
						</option>
					</c:forTokens>
				</select>				
            </div>
            
            <!-- 글 리스트 조회 -->
            <p style="display:inline-block; margin:10px; margin-top:50px"><i class="fas fa-lock" style="margin:0 10px"></i>비밀글은 작성자와 관리자만 확인할 수 있습니다</p>
            
			<table class="main">
                <tr>
                   <th>번호</th>
                   <th>제목</th>
                   <th>작성자</th>
                   <th>작성일</th>
                   <th>조회</th>
                </tr>
                <c:forEach var="board" items="${boards}" varStatus="stat">
	                <tr class="boardClick"  
	                	onclick="
	                	<c:if test="${board.lockpw == null || member.id == board.writer || member.id == 'olooe'}">
	                	location.href= 'detail?bno=${board.bno}&${page.cri.fullQueryString}'
	                	</c:if>
	                	">
						<td>${board.bno} </td>
						<td>
							<c:if test="${board.lockpw != null}">
								<i class="fas fa-lock" style="margin: 0 5px"></i>
							</c:if>
							${board.title}
							<c:if test="${board.replyCnt == 0}"></c:if>
							<c:if test="${board.replyCnt != 0}">[${board.replyCnt}]</c:if>
						</td>
						<td>${board.writer == 'withdrawal' ? '탈퇴 회원' : board.writer}</td>
	                   	<td>${board.regdate}</td>
						<td>${board.hitcount}</td>
	               </tr>
				</c:forEach>
			</table>
			
			<!-- 페이지네이션 -->
        	<div class="page">
				<c:if test="${page.prevPages}">
					<a class="page-link" href="free?pageNum=${page.startPage - 1}&${page.cri.queryString}">
						<i class="fas fa-angle-double-left"></i>
					</a>
				</c:if>
				<c:if test="${page.prevPage}">
					<a href="free?pageNum=${page.cri.pageNum - 1}&${page.cri.queryString}">
						<i class="fas fa-angle-left"></i>
					</a>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
					<a class="${page.cri.pageNum == i ? 'active' : ''}" href="free?pageNum=${i}&${page.cri.queryString}">
						${i}
					</a>
				</c:forEach>
				<c:if test="${page.nextPage}">
					<a class="page-link" href="free?pageNum=${page.cri.pageNum + 1}&${page.cri.queryString}">
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
	$(".list-header : checkbox:checked").length ? '' : $(".list-header : checkbox:eq(0)").prop("checked", true);	
	
	// 검색 타입 미지정 및 검색어 부재
	$(".list-header form").submit(function() {
		console.log($(this).find(":checkbox:checked").length);
	
		if(!$(this).find(":checkbox:checked").length || !$(this).find(":text").val().trim() ) {
			alert("검색 타입을 지정하고 검색어를 입력하세요");
			return false;
		}
	});

	function boardClick() {
		console.log(${member.id});
		alert("이벤트");
	}
	function lockClick() {
		alert("잠금");
	}
	
/*		
location.href= 'detail?bno=${board.bno}&${page.cri.fullQueryString}'
		$(".boardClick").off("click");
		e.stopPropagation();
		e.preventDefault();
		if('${member.id}' =='olooe' || prompt("비밀번호를 입력하세요") == '${board.lockpw}'){
			location.href= 'detail?bno=${board.bno}&${page.cri.fullQueryString}';
		}
		else{
			alert("비밀번호를 잘못 입력하셨습니다");
			location.href= 'free?${page.cri.queryString}';
		}
*/
//	$(".boardClick").on("click", function(){
//	});
	
	
	
</script>
</html>