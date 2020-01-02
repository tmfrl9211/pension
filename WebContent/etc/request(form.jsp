<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   request.setCharacterEncoding("utf-8");
   // form에 입력된 값을 가져오기
   
   out.print(request.getParameter("name")+"<p>"); // 폼에 name가 일치하는폼에 입력값
   out.print(request.getParameter("juso")+"<p>");
   //out.print(request.getParameter("hobby"));
   // getParameter("폼이름") => 폼이름이 복수라도 1개만 가져온다.

   String[] hobby=request.getParameterValues("hobby"); // 폼이름이 복수일때 선택된 모든것을 가져온다.
   //out.print(hobby.length); // 배열길이
   for(int i=0; i<hobby.length; i++)
   {
  	 out.print(hobby[i]+" ");
   }
   out.print("<p>");
    //getParameterValues()는 리턴값이 배열 => 복수개의 값을 배열로 전달
       		  
   Enumeration penum=request.getParameterNames();
     while(penum.hasMoreElements()) // 존재true,없으면 false
     {
    	 out.print(penum.nextElement().toString()+" ");
     }
     /* penum.hasMoreElements(); 
     out.print(penum.nextElement().toString());
     penum.hasMoreElements();
     out.print(penum.nextElement().toString());
     penum.hasMoreElements();
     out.print(penum.nextElement().toString());
     penum.hasMoreElements();
     out.print(penum.nextElement().toString()); */
      // form에서 전송된 name을 가져온다..
     //request.getParameterMap();
   %>
</body>
</html>