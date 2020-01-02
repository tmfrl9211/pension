<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
  // DB 연결및 쿼리를 사용할수 있는환경
  // Connection , Statement 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  // 수정하고자 하는 레코드의 id값 가져오기
  String id=request.getParameter("id");
  
  //쿼리작성
  String sql="select * from gesipan where id="+id;
  // ResultSet에 가져오기
  ResultSet rs=stmt.executeQuery(sql);
  rs.next(); // 무조건
%>  
 
<%@ include file="../main/top.jsp" %>  
 <style>
  #section {
    width:1200px;
    heigth:600px;
    margin:auto;
  }
  #section #left { /* 왼쪽 메뉴 나오는 부분 */
    width:300px;
    height:600px;
    float:left;
  }
  #section #left li {
    width:220px;
    height:60px;
    list-style-type:none;
    border-bottom:1px solid #dddddd;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:14px;
  }
  #section #right { /* 공지사항 리스트 나오는 부분 */
    width:900px;
    height:600px;
    float:left;
  }
  #section #right #gong {
    height:60px;
    font-size:34px;
    margin-left:45px;
    margin-top:20px;
  }
  #section #right #first td {
    height:40px;
    border-top:2px solid black;
    border-bottom:1px solid black;
    font-size:14px;
  }
  #section #right #second td {
    height:30px;
    border-bottom:1px solid #dddddd;
    font-size:13px;
  }
  #section #right #second td a {
    text-decoration:none;
    color:black;
  }
 </style>
 <script>
  // 혈액형 4개의 radio중에 하나만 체크를 한다(db에 있는 내용 참고로)
  function blood_check()
  {
	  // DB에 있는 값 : 1은 A, 2는 B, 3은 O, 4는 AB (-1하면 blood배열과 같아짐)
	  // blood[n] => n: 0은 A, 1은 B, 2는 O, 3은 AB
	  n=<%=rs.getInt("blood")%>;
	  document.pkc.blood[n].checked=true;
	  
	// DB에 있는 태어난해 => 2005 => option태그의 순서로 바꾸어야됨
	/*
	   // 2020-태어난해 => index값하고 일치
	   ch=2020-<%=rs.getString("birth")%>;
	   document.pkc.birth.selectedIndex=ch;
	   */
	   document.pkc.birth.value=<%=rs.getString("birth")%>;
	   
	// checkbox
	   var hh="<%=rs.getString("hobby")%>"; 
		  var hob=hh.split(",");  // hh문자열을 ,기호로 나누어서 배열로 준다..
		  for(i=0;i<hob.length-1;i++)
			 document.pkc.hobby[hob[i]].checked=true;
	  
	  
  }
 </script>
 <body onload=blood_check()>
  <div id=section>
    <div id=left> <!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA)  -->
      <ul>
        <li> 로고2 </li>
        <li> <a href="../gong/gong_list.jsp"> 공지사항 </a></li>
        <li> <a href="../gesipan/list.jsp"> 게시판 </a> </li>
        <li> 여행후기 </li>
        <li> QnA </li>
      </ul>
    </div> 
    <div id=right>
      <div id=gong> 게시판 </div>
      <form name=pkc method=post action=update_ok.jsp>
      <input type=hidden name=id value=<%=id %>>
        <table width=800>
         <caption> <h3> 글쓰기 </h3></caption>
         <tr>
          <td> 제 목 </td>
          <td> <input type=text name=title value="<%=rs.getString("title")%>"> </td>
         </tr>
         <tr>
          <td> 작성자 </td>
          <td> <%=rs.getString("name")%> </td>
         </tr>
         <tr>
          <td> 비밀번호 </td>
          <td> <input type=password name=pwd> </td>
         </tr>
         <tr>
          <td> 내용 </td>
          <td> 
           <textarea cols=40 rows=6 name=content>
             <%=rs.getString("content")%>
           </textarea>  </td>
         </tr>
         <tr>
          <td> 혈액형 </td>
          <td> 
            <input type=radio name=blood value=0> A형
            <input type=radio name=blood value=1> B형
            <input type=radio name=blood value=2> O형
            <input type=radio name=blood value=3> AB형
          </td>
         </tr>
         <tr>
          <td> 취미 </td>
          <td> 
            <input type=checkbox name=hobby value=0> 낚시
            <input type=checkbox name=hobby value=1> 독서
            <input type=checkbox name=hobby value=2> 게임
            <input type=checkbox name=hobby value=3> 노래
            <input type=checkbox name=hobby value=4> 영화
            <input type=checkbox name=hobby value=5> 운동
          </td>
         </tr>
         <tr>
          <td> 태어난해 </td>
          <td> 
            <select name=birth>
             <option> 선 택 </option>
            <%
              for(int i=2019;i>=1900;i--)
              {
            %>
             <option value=<%=i %>> <%=i %> </option>
            <%
              }
            %>
            </select>
          </td>
         </tr>
         <tr>
          <td colspan=2 align=center> <input type=submit value=저장하기> </td>
         </tr>
        </table>
      </form>
    </div>
</body>
<%@ include file="../main/bottom.jsp" %>







