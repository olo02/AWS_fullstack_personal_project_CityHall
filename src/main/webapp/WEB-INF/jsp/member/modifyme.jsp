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
                <h1>내 정보 수정</h1>
            </div>
            <div class="join-process signup-process">
            </div>

            <form method="post" class="signup-form" name ="signupForm">
                <div class="id-info">
                    <div class="frm-subhead">
                        <h4>아이디 정보</h4>
                        <p>* 필수 입력 항목입니다.</p>
                    </div>
                    <div class="frm-input">
                        <h5>*아이디</h5>
                        <input id = "id" name = "id" value="${member.id}"
                            autofocus readonly>
                        <br>
                        <h5>*비밀번호</h5>
                        <input type = "password" id = "pw" name = "pw"
                        placeholder = "최소9자 ~ 최대20자 영문자, 숫자 각 하나 이상 조합" 
                        > 
                        <h6>영문자, 숫자를<br>각 하나 이상 조합해주세요<br>(9~20자)</h6>
                        <br>
                        <h5>*비밀번호 확인</h5>
                        <input type = "password" id = "pwchk" name = "pwchk" >
                    </div>
                </div>
                <div class="privacy">
                    <div class="frm-subhead">
                        <h4>개인정보</h4>
                        <p>* 필수 입력 항목입니다.</p>
                    </div>
                    <div class="frm-input">
                        <h5>*이름</h5>
                        <input id = "name" name = "name" readonly value="${member.name}"
                        >
                        <br>
                        <h5>*주소</h5>
                        <input type="" id = "address" name = "address" value="${member.address}"
                            placeholder = "운응시" 
                            >
                        <br>
                        <h5>*이메일</h5>
                        <input type="email" id = "email" name = "email" value="${member.email }"
                            placeholder = "이메일" 
                            >
                        <h6>
                            부가서비스(소식지, 행사강좌 등 정보)수신용이므로 주로 사용하는 이메일 주소를 입력해 주시기 바랍니다.
                        </h6>
                    </div>
                    <output name = "result"></output>
                </div>
                <a href="${pageContext.request.contextPath}/member/mypage">
	                <div class="tolist">
	                    <h4>목록으로</h4>
	                </div>
	            </a>
                <button type="submit" class="write-btn">수정하기</button>

            </form>

        </main>
	<%@ include file="../common/footer.jsp" %>	
</div>

<script>
	$(".write-btn").on("click", e => {
		e.preventDefault();
		
	    let pw = $("#pw").val();
	    if(pw.length == 0){
	        alert("비밀번호를 입력해 주세요.");
	        return false;
	
	    } else if(pw.length < 9 || pw.length > 20 || !((/^[a-zA-Z0-9]*$/).test(pw))){
	        alert("비밀번호를 다시 입력해 주세요.");
	        return false;
	    }
		
	    let pwchk = $("#pwchk").val();
	    if(pwchk.length == 0){
	        alert("비밀번호 확인을 입력해 주세요.")
	        return false;
	    }
	    else if(pwchk != pw){
	        alert("비밀번호 확인을 다시 입력해 주세요.")
	        return false;
	    }
		
		alert("회원님의 정보가 수정되었습니다");
	    $(".signup-form").submit();

		
	})	


</script>

</body>
</html>