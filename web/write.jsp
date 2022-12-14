<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<!--만약에 안되면 <meta "UTF-8"> -->
	<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/write.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width",intial-scale="1">
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
	<a href='index.jsp'>VEGGIE MEAL</a>
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
		<li><a style="color: red" href="VeganWebSite.jsp">게시판</a></li>
	</ul>

	<%
		if(userID == null){
	%>
	<ul id="main-menu">
		<li><a href="login.jsp">마이페이지</a></li>
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
<h2>게시판 글쓰기</h2>

<form method = "post" action = "writeAction.jsp">
	<table align="center">
		<tr>
			<td><input style="height: 30px; width: 1200px" type = "text" placeholder = "글 제목" name = "boardTitle" maxlength = "50"></td>
		</tr>
		</br>
		<tr>
			<td><textarea style="height: 350px; width: 1200px" placeholder = "글 내용" name = "boardContent" maxlength = "2048"></textarea></td>
		</tr>
		</tbody>
	</table>
	</br>
	<input style="font-size: 1.2em; font-family: GmarketSansMedium" type = "submit" class = "btn btn-primary pull-right" value = "글쓰기">
</form>
<br><br><br><br>

<hr width="90%" color = "black">


<br><br><br><br><br><br>
<br><br><br><br><br><br>

<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
</body>
</html>