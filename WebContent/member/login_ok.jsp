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
String pwd=request.getParameter("pwd");

// ���̵�, ��й�ȣ�� �������� �˻��ϴ� ������ �ۼ�
String sql="select * from member where userid='"+userid+"'";
sql=sql+" and pwd='"+pwd+"'";

ResultSet rs=stmt.executeQuery(sql);

if(rs.next()) //���ڵ尡 ������ true, ������ false
{ // �α��ο� �����ϸ� ���Ǻ����� �����..
	//int a=100;
    session.setAttribute("userid",rs.getString("userid"));
    session.setAttribute("name",rs.getString("name"));
        // ���Ǻ�������� �޼ҵ� (������,��)
        
    response.sendRedirect("../main/index.jsp");
  }
else
	response.sendRedirect("login.jsp");
%>