<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//�Է¾���� ���� ��������
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");
String name=request.getParameter("name");
String email=request.getParameter("email");

// ���̵�, ��й�ȣ�� �������� �˻��ϴ� ������ �ۼ�
String sql="select * from member where userid='"+userid+"'";
sql=sql+" and name='"+name+"' and email='"+email+"'";

ResultSet rs=stmt.executeQuery(sql);

if(rs.next()) //���ڵ尡 ������ true, ������ false
{ 
	out.println(rs.getString("pwd"));	
  }
else
{
	%>
	<script>
	 alert("�Է��Ͻ� ������ ��ġ�ϴ� ȸ�������� �������� �ʽ��ϴ�.");
	 history.back();
	</script>
	<%
}
%>