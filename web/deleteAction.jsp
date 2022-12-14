<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<%--휴대폰이든 노트북이든 디바이스 크기에 맞춰 화면을 보여준다.--%>
	<meta name="viewport" content="width=device-width",intial-scale="1">
	<link rel="stylesheet" href="/style/main.css">
	<link rel="stylesheet" href="/style/menu.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<title>
		Project 01
	</title>

	<style>
		h1{
			background-image: url("/images/2.jpg");
			background-size: cover;
		}
	</style>

</head>

<body>
<center><span style = " font-family: 'Anton-Regular'; font-size:3.0em;  color: green; line-height: 1.5em">
      <br/>
      <i class="fa-solid fa-seedling"></i>
      <a href='index.jsp'>VEGGIE MEAL</a>

      <i class="fa-solid fa-seedling"></i>
      <br/>
      </span>
	<span style="font-family: GmarketSansTTFMedium;font-size: 1.5em; line-height: 1.5em">
      <a>베 지  밀</a>
        </span>
</center>
<br/>

<nav role="navigation">
	<ul id="main-menu">
		<li><a>비건인증</a>
			<ul id="sub-menu">
				<li><a href='intro.jsp'>인증소개&절차</a></li>
				<li><a href='products.jsp'>제품소개</a></li>
			</ul>
		</li></ul>

	<ul id="main-menu">
		<li><a href='restaurant.jsp'>비건식당</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="board.jsp">게시판</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="#">마이페이지</a></li>
	</ul>
</nav>
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
		} else{	
				VeganwebsiteDAO veganwebsiteDAO = new VeganwebsiteDAO();
				int result = veganwebsiteDAO.delete(boardID);	
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'VeganWebSite.jsp'");
					script.println("</script>");
				}
			}		
		
	%>
</body>
</html>