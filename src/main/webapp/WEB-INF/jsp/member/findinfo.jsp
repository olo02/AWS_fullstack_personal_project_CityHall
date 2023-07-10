<%@page import="city.olooe.jsp.domain.Member"%>
<%@page import="city.olooe.jsp.service.MemberService"%>
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
        <main class="signin">
            <div class="signin-main findinfo">
                <div class="select_id" onclick="selectId()">아이디 찾기</div>
                <div class="select_pw" onclick="selectPw()">비밀번호 찾기</div>
                
                <p id="find_result">
                    회원가입 시 입력한 정보로 아이디와 비밀번호를 찾을 수 있습니다.
                </p>
                <form method="post" class="signin-form" name ="signinForm" style="margin-left:40px">
                    <h3 class="id_h3" style="display:none; margin-right: 13px">아이디</h3>
                    <input type="hidden" id = "id" name = "id" 
                        placeholder = "아이디를 입력하세요" style="width:380px">
                    <h3 style="display:inline-block; margin-right: 30px" >이름</h3>
                    <input type="text" id = "name" name = "name" autofocus
                        placeholder = "이름을 입력하세요" style="width:380px">
                    <h3 style="display:inline-block; margin-right: 13px">이메일</h3>
                    <input type="text" id = "email" name = "email" 
                        placeholder = "이메일을 입력하세요" style="width:380px">
                    <button class="login" id="login" onclick="findInfo()" style="margin-top: 50px; width: 474px">
                    	찾기
                    </button>
                </form>
                <div class="selectsign" style="padding: 30px 0 10px 165px">
                    <a href="${pageContext.request.contextPath}/member/signin">로그인</a>
                    <p>|</p>
                    <a href="${pageContext.request.contextPath}/member/contract">회원가입</a>                
                </div>
        </main>
	<%@ include file="../common/footer.jsp" %>	
</div>
<script>
	let select = true;
	
	function selectId(){
		$(".select_id").css("background-color", "#fafafa");
		$(".select_pw").css("background-color", "white");
		$("#id").prop("type", "hidden");
		$(".id_h3").css("display", "none");
		$("#id").val("").next().next().val("").focus().next().next().val("");
		$("#find_result").text("회원가입 시 입력한 정보로 아이디와 비밀번호를 찾을 수 있습니다.").css("color",
				"#4a4a4a").css("font-size", "16px");
		select = true;
	}

	function selectPw(){
		$(".select_pw").css("background-color", "#fafafa");
		$(".select_id").css("background-color", "white");
		$("#id").prop("type", "text").focus();
		$(".id_h3").css("display", "inline-block");
		$("#name").val("").next().next().val("");
		$("#find_result").text("회원가입 시 입력한 정보로 아이디와 비밀번호를 찾을 수 있습니다.").css("color",
				"#4a4a4a").css("font-size", "16px");
		select = false;
	}

	function findInfo(){
    	event.preventDefault();
		let id = $("#id").val();
    	let name = $("#name").val();
		let email = $("#email").val();
		let str = !id.length ? "아이디" : "비밀번호" ;

		if(!id.length && !select){
			alert("아이디를 입력해 주세요.");
			return;
		}
		
		if(!name.length){
			alert("이름을 입력해 주세요.");
			return;
		}
					
					
		if(!email.length){
			alert("이메일을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			url : "/member/findinfo?id=" + id + "&name=" + name +"&email=" + email,
			method : "POST",
			data : {id : id, name : name, email : email},
			success : function(data){
				
				if(data != "fail"){
					if(select)
						$("#find_result").text("회원님의 아이디는 '"+ data + "' 입니다.").css("color", "red").css("font-size","20px");
					else
						$("#find_result").html("회원님의 임시 비밀번호는 '" + data + "'입니다.<br>비밀번호를 변경해 주세요").css("color", "red").css("font-size","20px");
				}
				else if(data == "fail"){
					$("#find_result").text("입력하신 정보와 일치하는 회원이 없습니다.").css("color", "red").css("font-size","20px");	
				} 
			}
		})
	}

</script>

</body>
</html>