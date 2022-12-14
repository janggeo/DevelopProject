<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-09-30
  Time: 오전 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApi" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.example.new2.data.DataDAO" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.Map" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=utf-8" language="java"
         pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}
    </style>
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
<h2>카테고리 </h2>
<hr width = "90%">
</br></br>
<form method="post" action="restaurant.jsp">
    <label style="font-family: 'GmarketSansMedium', serif; font-size: 1.3em" >지역</label>
    <select style="height: 30px; width: 150px; font-family: 'GmarketSansMedium'; font-size: 1.2em; line-height: 150%" name="region" id="region" size="1">
        <option value="">선택</option>
        <option value="seoul">서울</option>
        <option value="gyeonggi">경기</option>
        <option value="bu_ul_kyung">부울경</option>
        <option value="daegu_kungbuk">대구</option>
        <option value="gwangju">광주_전라</option>
        <option value="daejeon">대전_충청</option>
        <option value="jeju_kangwon">제주_강원</option>
    </select>
    <input type="submit" value="확인" style="margin-left:1px">
</form>
<div style="height: 4px"></div>
<td>
    <form method="post" action="restaurant.jsp">
        <input style="height: 20px; font-family: 'GmarketSansMedium', serif; font-size: 1.2em" type="text" name="keyword">
        <input type="submit" value="search">
    </form>
</td>


<%
    String search = request.getParameter("keyword");
    String region = request.getParameter("region");
    ConnectionString connectionString = new ConnectionString("mongodb+srv://jeonghwan:wlsdlstk6%21@vegandata.696tu4w.mongodb.net/?retryWrites=true&w=majority");
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .serverApi(ServerApi.builder()
                    .version(ServerApiVersion.V1)
                    .build())
            .build();
    MongoClient mongoClient = MongoClients.create(settings);
    System.out.println(region);
    try{
        if(region.equals("")){
            region = "seoul";
        }
    }catch(NullPointerException e){
        region = "seoul";
    }
    DataDAO dao = new DataDAO(mongoClient,region);
%>

</br>
<div align="center">
<div align="center" id="map" style="alignment: center; width:90%;height:550px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb2273b5c733520c556bf71ae2fec18e"></script>
    <script>
        <%
        List<Map> mapdata;
        double default_long;
        double default_lat;

            try{
                if(search.equals("")){}
                mapdata = dao.getMap(search);
                default_long = 36.7766506;
                default_lat = 126.4517461;
//                default_long = mapdata.get(0).getLatlong().get(0);
//                default_lat = mapdata.get(0).getLatlong().get(1);
            }
            catch(NullPointerException e){
                mapdata = dao.getMap();
                switch(region){
            case "bu_ul_kyung":
                default_long = 35.1590283;
                default_lat = 129.0638249;
                break;
            case "daegu_kungbuk":
                default_long = 35.697162250000005;
                default_lat = 128.45370563129268;
                break;
            case "daejeon":
                default_long = 36.7766506;
                default_lat = 126.4517461;
                break;
            case "gwangju":
                default_long = 35.1327569;
                default_lat = 126.8973131;
                break;
            case "gyeonggi":
                default_long = 37.2307737;
                default_lat = 127.1873896;
                break;
            case "jeju_kangwon":
                default_long = 37.7283908;
                default_lat = 128.5951852;
                break;
            default:
                default_long = 37.55082390184424;
                default_lat = 126.98889837934351;
        }
            }
        %>

        let long;
        let lat;
        let name;
        let img;
        let address;
        let phone;
        let page;


        var mapContainer = document.getElementById('map'), // 지도의 중심좌표--%>
                        mapOption = {
                            center: new kakao.maps.LatLng(<%=default_long%>, <%=default_lat%>), //지도의 중심좌표
                            level: 9 // 지도의 확대 레벨
                        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        var marker =[];
        var content =[];
        var overlay = [];

         <%for(int i=0;i<mapdata.size();i++) {%>
            long = <%=mapdata.get(i).getLatlong().get(0)%>;
            lat = <%=mapdata.get(i).getLatlong().get(1)%>;
            name = '<%=mapdata.get(i).getName()%>';
            img = '<%=mapdata.get(i).getImg()%>';
            address = '<%=mapdata.get(i).getAddress()%>';
            phone = '<%=mapdata.get(i).getPhone()%>';
            page = '<%=mapdata.get(i).getPage()%>';

            // 지도에 마커를 표시합니다
            marker[<%=i%>] = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(lat, long)
            });

            content[<%=i%>] = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                    name +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '<img src= ' + img + ' width="73" height="70" alt="restaurant img"> ' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">' + address + '</div>' +
                '                <div class="phone ellipsis">' + phone + '</div>' +
                '                <div><a href=' + page + ' target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>';


            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            overlay[<%=i%>] = new kakao.maps.CustomOverlay({
                content: content[<%=i%>],
                map: map,
                position: marker[<%=i%>].getPosition()
            });
            overlay[<%=i%>].setMap(null);
            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker[<%=i%>], 'click', function () {
                overlay[<%=i%>].setMap(map);
            });

            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
            function closeOverlay() {
                overlay[<%=i%>].setMap(null);
            }
        <%}%>

</script>
</div>
<br><br><br><br>

<hr width="90%" color = "black">
<br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>
