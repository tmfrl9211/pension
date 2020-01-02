<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//입력양식의 값을 가져오기
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");
String name=request.getParameter("name");
String email=request.getParameter("email");

// 아이디, 비밀번호를 조건으로 검색하는 쿼리문 작성
String sql="select * from member where userid='"+userid+"'";
sql=sql+" and name='"+name+"' and email='"+email+"'";

ResultSet rs=stmt.executeQuery(sql);

if(rs.next()) //레코드가 있으면 true, 없으면 false
{ 
	out.println(rs.getString("pwd"));	
  }
else
{
	%>
	<script>
	 alert("입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
	 history.back();
	</script>
	<%
}
%>