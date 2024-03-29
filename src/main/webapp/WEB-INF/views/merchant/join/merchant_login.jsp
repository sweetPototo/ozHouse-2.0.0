<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/merchant/css/login_style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/merchant/css/styleMain.css">

<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	function pressEnter(e){
		if(e.keyCode == 13){
			loginCheck();
			}
	}

	function customAlert(msg){
	    document.querySelector('.custom-alert-text').innerText = msg;
	    document.getElementById('customAlert').style.display = 'block';
	}
	
	function closeCustomAlert(){
	    document.getElementById('customAlert').style.display = 'none';
	}
	function searchMember(mode){
	    window.open("${pageContext.request.contextPath}/members/search?mode=" + mode, "search", "width=640, height=400")
	}
	function loginCheck(){
		if (f.merId.value == ""){
	        alert("아이디를 입력해 주세요!!");
	        f.merId.focus();
	        return;
	    }
	    if (f.merPw.value == ""){
	        alert("비밀번호를 입력해 주세요!!");
	        f.merPw.focus();
	        return;
	    }
	    document.f.submit();
	}
</script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<title>Login</title>

</head>
<body>
	<header>
		<div class="header-left">
			<a href="${pageContext.request.contextPath}/merchant/home"> <img
				src="/merchant/img/ozlogo2.png" width="60" height="60">
				<img src="/merchant/img/oz2.png" width="90" height="50">
				<span class="partner-center"><b>파트너센터</b></span>
			</a>
		</div>
		<div class="header-right"></div>
	</header>
	<br>
	<br>
	<br>
	<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/merchant/login/loginOk" id="login-form"
			name="f">
			<div class="site-login">판매자 사이트 로그인</div>
			<br>
			<br>
			<br>
			<c:if test="${not empty cookie.saveId}">
				<input type="text" name="merId" tabindex="1"
					value="${cookie['saveId'].value}">
			</c:if>
			<c:if test="${empty cookie.saveId}">
				<input type="text" name="merId" tabindex="1" placeholder="아이디 입력">
			</c:if>
			<input type="password" name="merPw" placeholder="비밀번호 입력"
				onkeypress="return pressEnter(event)">
			<div class="remember-me">
				<c:if test="${not empty cookie.saveId}">
					<input type="checkbox" name="saveId" checked id="remember-check">
				</c:if>
				<c:if test="${empty cookie.saveId}">
					<input type="checkbox" name="saveId" id="remember-check">
				</c:if>
				<label for="remember-check"><font face="Roboto, sans-serif">아이디
						저장하기</font></label>
			</div>
			<input type="button" value="로그인" onclick="javascript:loginCheck()">
			<div class="login-options">
				<span class="join"><a href="${pageContext.request.contextPath}/merchant/login/findMerchant">비밀번호 재설정</a></span> <span
					class="join1"><a href="${pageContext.request.contextPath}/merchant/login/join">회원가입</a></span>
			</div>
		</form>
	</div>
</body>