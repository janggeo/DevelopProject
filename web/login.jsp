<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<link rel="stylesheet" href="/style/login.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width",intial-scale="1">

<%--<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">--%>
<%--<link rel = "stylesheet" href = "style/bootstrap.css">--%>
<title>Veggie Meal</title>
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>

<h1>
	<i class="fa-solid fa-seedling"></i>
	<a style="color: #23527c" href='index.jsp'>VEGGIE MEAL</a>
	<i class="fa-solid fa-seedling"></i></h1>

<br/>

<nav role="navigation">
	<ul id="main-menu">
		<li><a>비건인증</a>
			<ul id="sub-menu">
				<li><a href='intro.jsp'>인증소개&절차</a></li>
				<li><a href='data.jsp'>제품소개</a></li>
			</ul>
		</li></ul>

	<ul id="main-menu">
		<li><a href='restaurant.jsp'>비건식당</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="VeganWebSite.jsp">게시판</a></li>
	</ul>

	<%
		if(userID == null){
	%>
	<ul id="main-menu">
		<li><a href="login.jsp">마이페이지</a>
			<ul id="sub-menu">
				<li><a style = "color: red" href='login.jsp'>로그인</a></li>
				<li><a href='join.jsp'>회원가입</a></li>
			</ul></li>
	</ul>

	<%
	} else{
	%>
	<ul id="main-menu">
		<li><a href="login.jsp">마이페이지</a>
			<ul id="sub-menu">
				<li><a style = "color: red" href='logoutAction.jsp'>로그아웃</a></li>
			</ul></li>
	</ul>

	<%
		}
	%>




</nav>
</br></br></br></br></br></br>
<hr width = "90%" color = "black">
</br>
<h2>로그인</h2>
<hr width = "90%">
</br></br></br></br>

<form method = "post" action="loginAction.jsp">
	<div class = "form-group">
		<input type = "text" class = "form-control" placeholder = "아이디" name = "userID" maxlength = "20">
	</div>

	<div class = "form-group">
		<input type = "password" class = "form-control" placeholder = "비밀번호" name = "userPassword" maxlength = "20">
	</div>
	<input type = "submit" class = "btn btn-primary form-control" value = "로그인">
	<br><br><br><br>
</form>

<br><br><br><br>

<hr width="90%" color = "black">


<br><br><br><br><br><br>
<br><br><br><br><br><br>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
</body>
</html>