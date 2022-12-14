<?xml version="1.0" encoding="UTF-8"?>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.DataDAO" %>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.ServerApi" %>

<%

    ConnectionString connectionString = new ConnectionString("mongodb+srv://jeonghwan:wlsdlstk6%21@vegandata.696tu4w.mongodb.net/?retryWrites=true&w=majority");
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .serverApi(ServerApi.builder()
                    .version(ServerApiVersion.V1)
                    .build())
            .build();
    MongoClient mongoClient = MongoClients.create(settings);
    DataDAO dao = new DataDAO(mongoClient);

%>
<!DOCTYPE html>
<html>
<head>
    <%--휴대폰이든 노트북이든 디바이스 크기에 맞춰 화면을 보여준다.--%>
        <meta name="viewport" content="width=device-width",intial-scale="1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
        <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
    <title>
        Project 01
    </title>


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
                <li><a style = "color: red" href='data.jsp'>제품소개</a></li>
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
<h3>상세정보</h3>
<hr>

<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<div class="row" align="center">
<table style="alignment: center; border: 1.5px solid white; width: 1300px; background-color: white; background-size: cover; padding: 30px">
    <thead style="font-size: 1em">
    <tr >
        <th style="background-color: #eeeeee; font-size: 1.2em;">image</th>
        <th style="background-color: #eeeeee; text-align: center; font-size: 1.2em;">[인증번호, 제품명, 인증시작, 인증종료]</th>
    </tr>
    </thead>
    <%List<Data> data = dao.getList(id);%>
    <%
        //System.out.println(data.size());
        int productsize = data.get(0).getProduct().size();
        //int imgsize = data.get(0).getImg().size();
        System.out.println("productsize"+productsize);
        for(int j=0; j<productsize; j++){
    %>
    <tr>
        <th style="background-color: #eeeeee; "><img width="100" height="100" src=<%=data.get(0).getImg().get(j+1)%>></th>
        <th style="background-color: #eeeeee; text-align: center; font-size: 1.2em"><%=data.get(0).getProduct().get(j)%></th>
        <%--    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getCategory()%></th>--%>
        <%--    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getName()%></th>--%>
    </tr>
    <%
        }%>
</table>
</div>
<br><br><br><br>

<hr width="90%" color = "black">


<br><br><br><br><br><br>
<br><br><br><br><br><br>

</body>

</html>