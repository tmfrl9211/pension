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
  
  String sql="select * from test_board";
  ResultSet rs=stmt.executeQuery(sql);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
table {
border:1px solid black;
}
#first {
color:blue;
font-weight:900;
}
</style>
</head>
<body>
<div id=gong aling=center> 게시판 </div>
       <table cellspacing=0 width=800 align=center>
         <caption style="text-align:right">
                <a href="input.jsp"> 글쓰기 </a> 
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
           <td align=left> <a href="content.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a>  </td>
           <td> <%=rs.getString("name") %>  </td>
           <td> <%=rs.getString("writeday") %>  </td>
           <td> <%=rs.getInt("rnum") %>  </td>
         </tr>
       <%
        }
       %>  
       </table>
    </div>
</body>
</html>