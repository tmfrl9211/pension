<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>    
<%
  // id_search.jsp�� ���̵� �̸��� �̸����� ������ ã�´�..
  
  // DB����
   String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
   String bb="root";
   String cc="1234";
   Connection conn = DriverManager.getConnection(aa,bb,cc); 
   Statement stmt=conn.createStatement();
  // �̸��� �̸����� request
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   String email=request.getParameter("email");
  
  // member ���̺� �˻�(�̸�,�̸���) �ϴ� ����
   String sql="select * from member where name='"+name+"' and ";
   sql=sql+" email='"+email+"'";
   ResultSet rs=stmt.executeQuery(sql);
   
  // �����Ѵٸ�, �������� �ʴ´�
   if(rs.next()) // ���ڵ带 �������� �̵� => true,false : ���ڵ�����
   { 
  // �����Ұ�� => ���̵� �����ִ� ������ �̵� => AJAX�� �ٲܿ���
       out.println("<b style='color:blue'>"+rs.getString("userid")+"</b>"); 
   }
    else
   {
  // �ƴϸ� ���â��� �� search.jsp�� �̵� 
      out.println("<b style='color:red'> ������ ����ġ </b>");
   }
%>    



