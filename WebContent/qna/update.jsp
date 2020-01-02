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
  String Page=request.getParameter("page");
  // 쿼리 작성
  String sql="select * from qna where id="+id;
  // ResultSet에 가져오기
  ResultSet rs=stmt.executeQuery(sql);
  rs.next(); // 무조건!!!!!
%>  
 
<%@ include file="../main/top.jsp" %>  
 
   <!--  질문 글 쓰기 -->
<jsp:include page="comm_menu.jsp"></jsp:include>
  <!-- 이름, 제목, 내용, 조회수, 작성일, 나이, 성별 -->
 <div id=right> 
 <h3> 질문 하기</h3>
 <form method=post action=update_ok.jsp> 
  <input type=hidden name=id value=<%=id%>>
  <input type=hidden name=page value=<%=Page%>>
   제목 <input type=text name=title size=50 value="<%=rs.getString("title")%>"> <p>
   내용 <textarea cols=50 rows=6 name=content><%=rs.getString("content")%></textarea> <p>
   작성자 <input type=text name=name size=8 value="<%=rs.getString("name")%>"> <p>
    비밀번호 <input type=password name=pwd> <p>
      <input type=submit value=수정>
     </form>
 </div>
<%@ include file="../main/bottom.jsp" %>
<%
stmt.close();
conn.close();
%>
