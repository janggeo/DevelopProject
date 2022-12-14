<%@ page language = "java" contentType = "text/html; charset = UTF-8" 
	pageEncoding = "UTF-8" %>
<%@ page import = "java.io.PrintWriter" %> 
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width",intial-scale="1">
	<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<title>Veggie Meal</title>

</head>

<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}

	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		<li><a style = "color: red" href="VeganWebSite.jsp">게시판</a></li>
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


<div class = "container">
	<div class = "row" align="center">
		<table style="alignment: center; border: 1px solid white; width: 1300px; background-color: white; background-size: cover; padding: 30px">
			<thead>
			<tr style="font-size: 1.3em">
				<th style = "background-color : #eeeeee; text-align: center;">번호</th>
				<th style = "background-color : #eeeeee; text-align: center;">제목</th>
				<th style = "background-color : #eeeeee; text-align: center;">작성자</th>
				<th style = "background-color : #eeeeee; text-align: center;">작성일</th>
			</tr>
			</thead>
			<tbody>
			<%
				VeganwebsiteDAO veganwebsiteDAO = new VeganwebsiteDAO();
				ArrayList<Veganwebsite> list = veganwebsiteDAO.getList(pageNumber);
				for(int i = 0; i<list.size(); i++){
			%>
			<tr style="border: #999999; font-size: 1.3em; font-family: 'GmarketSansMedium', serif; line-height: 130%; text-align: center; height: 50px">
				<td><%= list.get(i).getBoardID() %></td>
				<td><a href = "view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
				<td><%= list.get(i).getUserID() %></td>
				<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시 " + list.get(i).getBoardDate().substring(14,16) + "분" %></td>
			</tr>
			<%
				}

			%>
			</tbody>

		<%
			if(pageNumber != 1){
		%>
		<a href = "VeganWebSite.jsp?pageNumber=<%=pageNumber - 1%>" class = "btn btn-success btn-arraw-left">이전</a>
		<%
			} if(veganwebsiteDAO.nextPage(pageNumber + 1)){
		%>
		<a href = "VeganWebSite.jsp?pageNumber=<%=pageNumber + 1%>" class = "btn btn-success btn-arraw-left">다음</a>
		<%
			}
		%></table>
		<button style="font-size: 1.2em; font-family: GmarketSansMedium; alignment: right"><a href = "write.jsp" style="alignment: right">글쓰기</a></button>
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
