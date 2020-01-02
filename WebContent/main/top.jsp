<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첫 펜션</title>
 <style>
 
  body { margin:0; }
  #member, #header, #move_img, #insa, #link, #footer {
  margin:auto;
  }
  #member {                       /* 1층 */
      width:1200px;
      height:50px;
      display:flex;
      justify-content:flex-end;
      align-items:center;
      font-family:돋움;
  }
  #member > a {
      color:black;
      text-decoration:none;
      margin-left:20px;
  }
  #header{                     /* 2층 */
      width:1200px;
      height:60px;
  }
  #header #logo {
      width:250px;
      height:60px;
      float:left;
      display:flex;
      align-items:center;
  }
  #header #menu {
      float:right;
      width:950px;
      height:60px;
      display:flex;
      align-items:center;
  }
  #header #menu li {
      list-style-type:none;  /* 목록에서 앞에 목록표시 아이콘 지우기 */
      float:left;
      font-size:22px;
      font-weight:900;
      margin-left:80px;
      font-family:돋움체;
  }
  #header #menu > a
  {
  color:black
  text-decoration:none;
  }
  #move_img{                            /* 3층 */
      width:1200px;
      height:400px;
  }
  #insa{                                /* 4층 */
      width:1200px;
      height:250px;
  }
  #insa #insa_left {
  width:300px;
  height:250px;
  float:left;
  display:flex;
  justify-content:center;
  align-items:center;
  font-size:30px;
  }
  #insa #insa_left #gray1 {
  color:gray;
  font-size:30px;
  }
  #insa #insa_right {
  width:900px;
  height:250px;
  float:right;
  justify-content:center;
  margin-top:70px;
  font-size:15px;
  font-family:돋움;
  }
  #insa #insa_right #gray2 {
  color:gray;
  font-size:15px;
  }
  #insa #insa_right #detail_view {
  border:1px solid black;
  padding:10px;
  margin-left:750px;
  }
  #insa #insa_right #detail_view > a {
  text-decoration:none;
  color:black;
  }
   #link  {                         /* 5층 */
    width:1200px;
    height:570px;
 
  }
  #link td:first-child {
    padding-left:0px;
  }
  #link td {
    padding:12px;
  }
  #link img:hover {
    opacity:0.6;
  }
  #footer { /* 6층 */
    width:1200px;
    height:130px;
    color:#aaaaaa;
    line-height:8px;
    padding-top:20px;
    font-size:14px;
  }
  #footer p {
    margin-left:10px;
  }
  #footer p:last-child {
    margin-top:30px;
  }
  
 
 </style>
</head>
<body>
  <div id=member> <!--  1층 -->
  <%
   if(session.getAttribute("userid")==null) // 세션변수가 없는 경우 로그인 메뉴
   {
  %>
   <a href="../member/member.jsp">회원가입</a>
   <a href="../member/login.jsp">로그인</a>
   <a href="">찾아오시는길</a>
  <%
   }
  else   // 세션변수가 없는 경우 로그인 메뉴
  {
  %>
  <a href="../member/pwd_check.jsp"> 정보수정 </a>
  <a href="../member/logout.jsp"> 로그아웃 </a>
  <a href=""> 찾아오시는길 </a>
  <%
  }
  %>
  </div>
  <div id=header> <!--  2층 -->
    <div id=header> <!--  2층 -->
    <div id=logo>
    <a href=../main/index.jsp><img src=../img/logo.png width=250px height=60px></a></div>
    <div id=menu>
     <ul>
      <li>프로방스펜션</li>
      <li>객실안내</li>
      <li>부대시설</li>
      <li><a href="../gong/gong_list.jsp">커뮤니티</a></li>
      <li><a href="../reserve/reserve.jsp">예약하기</a></li>
     </ul>
    </div>
    
  </div>
   </div>
   