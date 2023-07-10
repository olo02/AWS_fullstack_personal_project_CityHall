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
                
                <!-- 관리자 모드일 때 공지사항 작성 권한 부여 -->
                <c:if test="${member.id =='olooe'}">
                <div class="writingbtn">
                    <a href="${pageContext.request.contextPath}/board/noticewrite">작성하기(관리자)</a>
                </div>
                </c:if>
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
                <div class="writingbtn">
                    <a href="${pageContext.request.contextPath}/board/freewrite">민원 신청하기</a>
                </div>
            </div>
            </div>
        </c:if>
            <form method="post">
	            <div class="detailform writeform">
	                <div class="write-title">
	                    <h3>제목 </h3><input type="text" id= "title" 
	                    	name="title" readonly value="${board.title }" autofocus /> 
	                    <h4>작성자 </h4><input type="text" id= "writer" name="writer"
	                    	value="${board.writer == 'withdrawal'? '탈퇴한 회원입니다': board.writer}"
	                    	readonly> 
	                </div>
	                <p class="detail">
	                	<c:if test="${board.lockpw == null || member.id == 'olooe' || member.id == board.writer}">
	                    <textarea name="content" id=content cols="100"  readonly>${board.content}</textarea>
	                	</c:if>
	                	<c:if test="${board.lockpw != null && member.id != 'olooe' && member.id != board.writer}">
	                	<div style="margin:50px; padding-bottom:250px;">비밀글입니다.</div>
	                	</c:if>
	                </p>
	                <a href="${board.category == 1?'notice':'free'}?${cri.fullQueryString }">
	                    <div class="tolist">
	                        <h4>목록으로</h4>
	                    </div>
	                </a>
	            </div>
	            <c:if test="${member.id == board.writer}">
	            <a href="modify?bno=${board.bno}&${cri.fullQueryString }" class="write-modify">
                    <div>수정</div>
	            </a>
	            <a href="remove?bno=${board.bno}&${cri.fullQueryString }" class="write-remove write-cancel">
                    <div>삭제</div>
	            </a>
	            </c:if>
	            
	            <div id="replyArea" style="background-color: #e0e8ee4a">
					<p for="writer">
						<i class="fas fa-comment"></i> 댓글
					</p>
					<div>
						<textarea id="commentArea"
							placeholder="댓글을 입력해 주세요" rows="3" style="font-size:15px"></textarea>
						<button type="button">작성하기</button>
					</div>
					<ul class="replies">
					</ul>
				</div>
	            
            </form>
            
        </main>
	
	<%@ include file="../common/footer.jsp" %>	
	</div>

	<script>
	// 삭제 confirm
		$(".btn-remove").click(function() {
			return confirm("삭제하시겠습니까?");
		});
	
		let contextPath = '${pageContext.request.contextPath}';
		let replyPath = contextPath + "/reply"
		let bno = '${board.bno}'
		let writer = '${member.id}'; // 세션정보로 사용됨. 또한 이것은 '나'를 의미
		
		showList();
		
		function showList() {
			$.ajax({
				url : replyPath,
				data : {bno : bno},
				success : list
			})
		}
		
	// 댓글 목록
	function list(replies) {
		let str = "";
		
		if(!replies.length) {
			str = `<li class="reply-li">
					<div class="reply-content">
						<p style="font-size:15px;">댓글이 없습니다</p>
					</div>
				</li>`;
			$(".replies").html(str);
			return;
		}
		
		
		for(let i in replies) {
			let r = replies[i];
			let isMine = writer === r.writer
			str += `
				<li class="reply-li" data-rno="\${r.rno}">
				<div class="reply-writer">\${r.writer == 'withdrawal'? '탈퇴한 회원입니다' : r.writer}</div>
				<div class="reply-date">\${r.regDate}</div>
				<div class="good"><i class="fas fa-heart"></i></div> 
				<div class="good"><i class="far fa-heart"></i></div> 
					<div class="reply-delete">`;
					
			str += isMine ? '<a href=""><i class="fas fa-times"></i></a>' : "";
			str += `</div>
				<div class="reply-content">
					<p>\${r.content}</p>
				</div>
				</li>
			`;
		}
		$(".replies").html(str);
	}
	
	
		// 댓글 작성
		$("#commentArea").next().click(function() {
			let content = $("#commentArea").val();
			if(!writer) {
				alert("로그인 후 작성하세요");
				location.href = contextPath + "/member/signin?href=" + encodeURIComponent(location.pathname + location.search + '#replyArea');
				return;
			}
			else if(!content) {
				alert("댓글 내용을 입력하세요");
				return;
			}
		
			$.ajax({
				url : replyPath,
				data : {bno : bno, content : content, writer : writer},
				method : "POST",
				success : function(data) {
					alert("댓글이 작성되었습니다.");
					$("#commentArea").val('');
					showList();
				}
			})
		})
		
		// 댓글 삭제
		$(".replies").on("click", ".reply-delete", function() {
			event.preventDefault();
			if(!confirm("댓글을 삭제하시겠습니까?")) {
				return false;
			}			
			let rno = $(this).closest("li").data("rno");
			$.ajax({
				url : replyPath + "?rno=" + rno,
				data : {rno : rno},
				method : "DELETE",
				success : function(data) {
					alert("댓글이 삭제되었습니다.");
					showList();
				}
			})
		})
		
	</script>	
	
	
</body>
</html>