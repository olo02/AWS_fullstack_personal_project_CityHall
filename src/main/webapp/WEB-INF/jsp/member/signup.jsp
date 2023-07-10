<%@page import="city.olooe.jsp.dao.MemberDao"%>
<%@page import="city.olooe.jsp.domain.Member"%>
<%@page import="city.olooe.jsp.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="city.olooe.jsp.service.MemberService"%>
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
                <h1>회원가입</h1>
            </div>
            <div class="join-process signup-process">
                <div>약관동의</div>
                <div></div>
                <div>회원정보 입력</div>
            </div>

            <form method="POST" class="signup-form" name ="signupForm">
                <div class="id-info">
                    <div class="frm-subhead">
                        <h4>아이디 정보</h4>
                        <p>* 필수 입력 항목입니다.</p>
                    </div>
                    <div class="frm-input">
                        <h5>*아이디</h5>
                        <input type="text" id = "id" name = "id" 
                            placeholder = "최소4자 ~ 최대15자"
                            autofocus
                            />
                        <button class="id_check" onclick="idCheck()">중복확인</button>
                        <h6 id="idchk_result">영문, 숫자만 가능합니다(4~15자)</h6>
                        <br>
                        <h5>*비밀번호</h5>
                        <input type = "password" id = "pw" name = "pw" 
                        placeholder = "최소9자 ~ 최대20자 영문자, 숫자 각 하나 이상 조합" 
                        > 
                        <h6>영문자, 숫자를 각 하나 이상 조합해주세요 (9~20자)</h6>

                        <br>
                        <h5>*비밀번호 확인</h5>
                        <input type = "password" id = "pwchk" name = "pwchk" 
                        >
                    </div>
                </div>
                <div class="privacy">
                    <div class="frm-subhead">
                        <h4>개인정보</h4>
                        <p>* 필수 입력 항목입니다.</p>
                    </div>
                    <div class="frm-input">
                        <h5>*이름</h5>
                        <input id = "name" name = "name" 
                        >
                        <br>
                        <h5>주소</h5>
                        <input type="text" id = "address" name = "address" 
                            placeholder = "운응시" 
                            >
                        <br>
                        <h5>이메일</h5>
                        <input type="email" id = "email" name = "email" 
                            placeholder = "이메일" 
                            >
                        <h6>
                            이메일 주소를 입력하지 않으면 아이디 / 비밀번호 분실 시 불이익이 있을 수 있습니다.
                        </h6>
                    </div>
                    <output name = "result"></output>
                </div>
                
                <button class="write-btn signup-button">가입하기</button>

            </form>

        </main>
	<%@ include file="../common/footer.jsp" %>	
</div>
<script>

	    function idCheck() {
	    	event.preventDefault();
	    	
	    	let id = $("#id").val();
	    	
		    if(id.length == 0){
		        alert("아이디를 입력해 주세요.");
		        return false;
		
		    } else if(id.length < 4 || id.length > 15 || !((/^[a-zA-Z0-9]*$/).test(id))){
		        alert("아이디는 4~15자의 영문, 숫자만 가능합니다.");
		        return false;
		    }
	    	
	    	$.ajax({
	    		url : "idCheck?id=" + id,
	    		method : "POST",
	    		data : {id : id},
	    		success : function(data) {

	    			if(data == "success"){
	    				if(confirm( id + "은(는) 사용 가능한 아이디입니다.")){
	    					$(".id_check").text("완료");
	    					$("#id").prop("readonly", true);
	    					$("#pw").focus();
	    					// 더이상 완료버튼 클릭이 안되도록 막아야 함
		    			}
	    				else{
		    				$("#id").val("");
		    				$("#id").focus();
	    				}
	    			}else if(data == "fail"){
	    				alert("이미 존재하는 아이디입니다.");
	    				$("#id").val("");
	    				$("#id").focus();
	    			}
	    		}		
	    	});
	    }
	    	
	    
	
	$(function() {
	    $("#pw").focusin(function() {
	    	if($(".id_check").text() != "완료"){
				alert("아이디 중복체크가 필요합니다.");
				$("#id").focus();
				return false;
	    	}
		})
	    $(".signup-button").click(function(){
    	event.preventDefault();
    	    
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
	
	    let name = $("#name").val();
	    if(name.length == 0){
	        alert("이름을 입력해 주세요")
	        return false;
	    }
	
	    alert($("#name").val() + "님 회원가입이 완료되었습니다. 운응시 방문을 환영합니다!")
	    document.signupForm.submit();
	    
	    })
	   
	});


</script>
</body>
</html>