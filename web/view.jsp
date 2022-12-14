<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width",intial-scale="1">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
<%--<link rel = "stylesheet" href = "css/bootstrap.css">--%>
<title>Veggie Meal</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
	<h2>게시판 글보기</h2>
	<hr width = "90%">
	</br></br></br></br>

	<div align="center">
		<div class = "row">
			<table style="alignment: center; border: 1px solid black; width: 1300px; background-color: white; background-size: cover; padding: 30px; line-height: 200%">

				<tbody style="font-size: 1.5em; font-family: 'GmarketSansMedium', serif">
					<tr> 
						<td style = "width: 20%;">글 제목</td>
						<td colspan="2"><%= veganwebsite.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td> 
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan = "2"><%= veganwebsite.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan = "2"><%= veganwebsite.getBoardDate().substring(0, 11) + veganwebsite.getBoardDate().substring(11, 13) + "시 " + veganwebsite.getBoardDate().substring(14,16) + "분"  %></td>
					</tr>
				</tbody>
			</table>
		</br>
					<table style="alignment: center; border: 1px solid black; width: 1300px; background-color: white; background-size: cover; padding: 30px">
						<tbody style="font-size: 1.5em; font-family: 'GmarketSansMedium', serif">
						<tr>
						<td>내용</td>
						<td colspan = "2" style = "min-height: 200px; text-align: Left;"><%= veganwebsite.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
						</tbody>
					</table>

		</br></br>
			<a style="font-family: 'GmarketSansMedium', serif; font-size: 1.5em" href = "VeganWebSite.jsp" class = "btn btn-primary">목록</a>
			<%
				if( (userID != null) && (userID.equals(veganwebsite.getUserID()))){
			%>
					<a style="font-family: 'GmarketSansMedium', serif; font-size: 1.5em"  href = "update.jsp?boardID=<%= boardID %>" class = "btn btn-primary">수정</a>
					<a style="font-family: 'GmarketSansMedium', serif; font-size: 1.5em"  onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?boardID=<%= boardID %>" class = "btn btn-primary">삭제</a>
			<%
				}
			%>			
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