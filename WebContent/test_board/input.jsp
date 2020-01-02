<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>  
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<script>
 function check(form)
 {
	 var sung=0;
	 for(i=0;i<=1;i++)
	   if(form.sung[i].checked)
	   sung=1;

	 var food=0;
	 for(i=0;i<=6;i++)
	   if(form.food[i].checked)
	   food=1;

	 if(form.name.value=="")
	 {
        alert("이름을 입력하세요");
        form.name.focus();
        return false;
	 }
	 else if(form.title.value=="")
		  {
		     alert("제목을 입력하세요");
		     form.title.focus();
		     return false;
		  }
	      else if(form.content.value=="")
	    	   {
	    	      alert("내용을 입력하세요");
	    	      form.content.focus();
	    	      return false;
	    	   }
	           else if(form.email.value=="")
	        	    {
	        	       alert("이메일을 입력하세요");
	        	       form.email.focus();
	        	       return false;
	        	    }
	                else if(sung==0)
	                	 {
	                	    alert("성별을 선택하세요");
	                	    return false;
	                	 }
	                else if(food==0)
               	 {
               	    alert("음식을 선택하세요");
               	    return false;
               	 }
	                else if(form.juso.selectedIndex==0)
               	 {
               	    alert("주소를 선택하세요");
               	    return false;
               	 }
	                     else
	                    	return true;
 }
</script>
<div id=section>
 <form method=post action=input_ok.jsp onsubmit="return check(this)">
  <table align=center>
   <tr>
    <td> 이름 </td>
    <td> <input type=text name=name> </td>
   </tr>
   <tr>
    <td> 제목 </td>
    <td> <input type=text name=title> </td>
   </tr>
   <tr>
    <td> 내용 </td>
    <td> <input type=text name=content> </td>
   </tr>
   <tr>
    <td> 이메일 </td>
    <td> <input type=text name=email> </td>
   </tr>
   <tr>
    <td> 성별  </td>
    <td>  <input type=radio name=sung value=0> 남자
       <input type=radio name=sung value=1> 여자 </td>
   </tr>
   <tr>
    <td> 음식 </td>
    <td> 
    <input type=checkbox name=food value=0>양꼬치<br>
    <input type=checkbox name=food value=1>훠궈<br>
    <input type=checkbox name=food value=2>꿔바로우<br>
    <input type=checkbox name=food value=3>지삼선<br>
    <input type=checkbox name=food value=4>깐궈볶음<br>
    <input type=checkbox name=food value=5>샤오룽바오<br>
    <input type=checkbox name=food value=6>마라탕<br> 
   </td>
   </tr>
   <tr>
    <td> 주소 </td>
    <td> 
    <select name=juso>
   <option>선택</option>
   <option value=1>서울시</option>
   <option value=2>경기도</option>
   <option value=3>강원도</option>
   <option value=4>전라도</option>
   <option value=5>경상도</option>
   <option value=6>제주도</option>
  </select> 
  </td>
   </tr>
   <tr>
    <td colspan=2 align=right> <input type=submit value=회원가입> </td>
   </tr>
  </table>
 </form>
</div>
</body>
</html>