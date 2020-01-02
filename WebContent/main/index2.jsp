  <%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
 <style>
  #image {
    height:0px;
  }
 </style>
  <div id=move_img> <!-- 3층 -->
     <img src=../img/main_img.jpg width=1200 height=300>
  </div>
  <div id=insa> <!-- 4층 -->
     <div id=left>
       <p> Welcome,</p>
       <p>Damyang Provence</p>
       <p>Pension</p>
     </div>
     <div id=right>
      <p> <img src=../img/wel.jpg> </p>
      <p>저희 펜션은 유럽 테마여행을 중심으로 하는 메타 프로방스 안에 위치한 유럽형 펜션입니다.</p>
      <p>대숲 맑은 담양군의 주요 여행지와 함께 감성을 느낄 수 있는 프로방스 펜션에서 삶의 산소와 같은 휴식과 낭만을 즐기시길 바랍니다.</p>
      <p>언제나 저희 프로방스 펜션을 이용해주시는 여러분을 위해서 최선을 다해서 모시겠습니다.</p>
      <p> <span> Detail View </span> </p>
     </div>
  </div>
  <div id=link> <!-- 5층 -->
    <table border=0 width=1190 align=center cellspacing=0 cellpadding=0>
     <tr>
       <td rowspan=2 valign=top> <img src=../img/link1.png> </td>
       <td valign=top> <img src=../img/link2.png> </td>
     </tr>
     <tr>
       <td valign=bottom style="padding-left:13px;"> 
        <img src=../img/link3.png>  
        <img src=../img/link4.png style="margin-left:32px;">
        
       </td>
     </tr>
    </table>
  </div>
  <div id=post>
   <form method=post action=event_ok.jsp>
   <table id=aa width=290 height=290 align=center>
     <tr height=70 align=center> 
       <td> 여름맞이 이벤트 </td>
     </tr>
     <tr height=70 align=center>
       <td> 기간 : 2019년 6월 30일 ~ 2019년 8월 31일
     </tr>
     <tr height=70 align=center>
       <td> 내용 : 전 숙박고객에게 BBQ 제공
     </tr>
     <tr height=70 align=center>
       <td>
         <input type=button value=신청 onclick=change_form()>
         <input type=button value=닫기 onclick="post.style.display='none'">
       </td>
     </tr>
   </table>
   <table id=bb width=290 height=290 align=center>
     <tr height=70 align=center> 
       <td> 여름맞이 이벤트 </td>
     </tr>
     <tr height=70 align=center>
       <td> 이름  <input type=text name=name> </td>
     </tr>
     <tr height=70 align=center>
       <td> 전화번호  <input type=text name=phone> </td>
     </tr>
     <tr height=70 align=center>
       <td>
         <input type=submit value=저장>
       </td>
     </tr>
   </table>
   </form>
  </div>
  <script>
   function change_form()
   {
     document.all.aa.style.display="none";
     document.all.bb.style.display="inline-block";
   }
 </script>
  <style>
   #bb {
    display:none;
   }
   #post {
     position:absolute;
     left:300px;
     top:200px;
     background:#D6FFFF;
     border:2px solid blue;
     border-radius:20px;
   }
   #post tr:nth-child(1) {
     font-size:25px;
     font-family:궁서;
     font-weight:900;
     color:#0100FF;
   }
   #post tr:nth-child(2) {
     font-size:13px;
   }
   #post tr:nth-child(3) {
     font-size:13px;
   }
   #post input[type=button] {
     width:60px;
     height:25px;
     border:1px solid blue;
     background:#D6FFFF;
     border-radius:10px;
    }
  </style>
  <%@ include file="bottom.jsp" %>









