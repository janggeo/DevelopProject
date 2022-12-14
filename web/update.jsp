<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/write.css" type="text/css">
<%--<link rel = "stylesheet" href = "css/bootstrap.css">--%>
<title>Veggie Meal</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int boardID = 0;
		if(request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'VeganWebSite.jsp'");
			script.println("</script>");
		}	
		
		Veganwebsite veganwebsite = new VeganwebsiteDAO().getVeganwebsite(boardID);
		if(!userID.equals(veganwebsite.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'VeganWebSite.jsp'");
			script.println("</script>");
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
	<h2>수정하기</h2>
	
	<div align="center" class = "container">
		<div class = "row">
		<form method = "post" action = "updateAction.jsp?boardID=<%= boardID %>">
		<table class = "table table-striped" style = "text-align=center; border; 1px solid #dddddd">
				<tbody>
					<tr>
						<td><input style="height: 30px; width: 1200px" type = "text" class  = "form-control" placeholder = "글 제목" name = "boardTitle" maxlength = "50" value="<%= veganwebsite.getBoardTitle() %>"></td>
					</tr> 
					<tr>
						<td><textarea style="height: 350px; width: 1200px" class  = "form-control" placeholder = "글 내용" name = "boardContent" maxlength = "2048" style = "height: 350px;"><%= veganwebsite.getBoardContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input style="font-size: 1.2em; font-family: GmarketSansMedium" type = "submit" class = "btn btn-primary pull-right" value = "글수정">
		</form>
			
		</div>
	</div>
	<br><br><br><br>

	<hr width="90%" color = "black">


	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>