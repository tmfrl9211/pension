<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>  
<%
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  String sql="select * from gongji";
  ResultSet rs=stmt.executeQuery(sql);
  %>
<%@ include file="../main/top.jsp" %>
<meta charset="utf-8">
 <style>
  #section {
    width:1200px;
    heigth:305px;
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
    margin-left:35px;
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
  #image {
  width:1200px;
  height:305px;
  margin:auto;
  }
 </style>
 <div id=image> <img src=../img/main2.PNG width=1200px height=305px> </div>
  <div id=section>
    <div id=left> <!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA)  -->
      <ul>
        <li> 로고2 </li>
        <li> <a href="../gong/gong_list.jsp">공지사항 </a></li>
        <li> <a href="../gesipan/list.jsp">게시판</a> </li>
        <li> 여행후기 </li>
        <li> QnA </li>
      </ul>
    </div> 
    <div id=right>
       <div id=gong> 공지사항 </div>
       <table cellspacing=0 width=800 align=center>
         <caption style="text-align:right">
         <%
         if(session.getAttribute("userid")!=null)
          if(session.getAttribute("userid").equals("admin"))
          {
         %>
             <a href="gong_write.jsp"> 글쓰기 </a> 
         <%
          }
         %>    
         </caption>
         <tr id=first align=center>
           <td> 번호 </td>
           <td> 제목 </td>
           <td> 글쓴이 </td>
           <td> 작성일 </td>
           <td> 조회수 </td>
         </tr>
       <%
        while(rs.next()) // rs.next에 의해 레코드 이동=> 끝까지
        {
       %>   
         <tr id=second align=center>
           <td> <%=rs.getString("id") %> </td>
           <td align=left> <a href="gong_content.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a>  </td>
           <td> 펜션지기  </td>
           <td> <%=rs.getString("writeday") %>  </td>
           <td> <%=rs.getString("rnum") %>  </td>
            <%
             if(session.getAttribute("userid")!=null)
               if(session.getAttribute("userid").equals("seulgi"))
               {
            %>
              <td> <a href="delete.jsp?id=<%=rs.getString("id")%>"> 삭제 </a> </td>
              <%
               }
              %>
         </tr>
       <%
        }
        
       %>  
       </table>
    </div>
  </div>
  </body>
<%@ include file="../main/bottom.jsp" %> 