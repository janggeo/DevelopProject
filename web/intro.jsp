<%--
  Created by IntelliJ IDEA.
  User: jo-eunji
  Date: 2022/11/13
  Time: 6:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>intro</title>
    <meta name="viewport" content="width=device-width",intial-scale="1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
    <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>


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
                <li><a style = "color: red" href='intro.jsp'>인증소개&절차</a></li>
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

</br>
</br>
</br></br></br></br>
<hr width = "90%" color = "black">
<div align="center" style="border: 1px dotted white; height: content-box; width: 1300px; background-color: white; background-size: cover; padding: 30px; opacity: 0.9">
    <td style='letter-spacing: normal'>
        <h2>비건인증이란?
            <hr style="width: border-box;">
        </h2>
    <h5>
        <a style="color: darkgreen">한국비건인증원</a>에서 실시하는 '비건인증'은 동물 유래 원재료를 사용하거나 이용하지 않고<br>
        교차오염되지 않도록 관리하며, 제품에 동물실험을 실시하지 않는 기준으로 부여하는 인증이다.<br>
        식품첨가물이나 원료의 생산 중 정제, 여과, 화학반응 등에서 소비자나 2차 제조자가 알 수 없는 갖가지 동물 유래 원료가 사용될 수 있다.<br>
        한국비건인증원은 혼합, 성분, 제조 과정에 대한 확인서 요청 등 철저한 확인으로 식품, 화장품, 생활용품 등의 표시사항에서 알 수 없는 하위 원료까지 확인한다.<br>
        <br><br>
        <img style="width: 300px; height: 300px" src="https://cdn.imweb.me/thumbnail/20180511/5af592e5b4698.png">
        <br><br><a style="font-size: 0.8em">한국비건인증원 비건 인증 마크(Vegan Certification Mark)</a>
        <br><br><br><br><br><br>

       <h2>비건 인증 기준</h2>
        <hr style="width: border-box">

    <h5>
        1. 동물 유래 원재료를 이용하지 않아야 한다.<br><br>
        2. 동물을 이용한 실험을 해서는 안된다.<br><br>
        3. 제품 생산 공정 전 중 후 교차오염이 없어야 한다.<br><br><br><br><br><br>
    </h5>

        <h2>비건 인증 절차</h2>
        <hr style="width:border-box">

        <h5>
            비건 제품 인증은 ‘한국비건인증원’을 통해 받을 수 있다.,<br>
            신청 가능 대상 : 식품제조가공업, 식품첨가물제조업, 건강기능식품제조업, 수입식품 등 수입판매업, 식품접객업, 유통전문판매원, 화장품제조업, 화장품제조판매업<br><br><br>

            1. 비건 인증을 원하는 제품에 대한 서류 제출<br><br>
            2. 신청서의 원재료를 검토하는 서류 심사 실시<br><br>
            3. 서류 심사 후 적합 제품은 동물성 DNA 검사 실시<br><br>
            4. 동물성 DNA 결과 동물성 유전자가 불검출임이 확인되면 비건 인증 완료<br><br>
            5. 한국비건인증원은 인증받은 제품 및 정보 홈페이지 게시<br><br></h5>
        <br><br><br><br><br><br>
        <hr width = width="border-box" color = "black">
    </h5></td></div>

<br><br><br><br><br><br>
    <br><br><br><br><br><br>


</body>
</html>
