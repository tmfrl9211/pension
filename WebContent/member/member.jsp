<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ include file="../main/top.jsp" %>
 <style>
 #image {
   width:1200px;
   height:450px;
   margin:auto;
 }
 #section {
   width:1200px;
   height:700px;
   margin:auto;
 }
 #section input[type=text] { /* input의 type=text인것 */
   width:200px;
   height:30px;
   border:1px solid darkblue;
 }
 #section input[type=password] { /* input의 type=password인것 */
   width:200px;
   height:30px;
   border:1px solid darkblue;
 }
 #section input[type=submit] { /* input의 type=submit인것 */
   width:200px;
   height:40px;
   border:1px solid darkblue;
   background:darkblue;
   color:white;
 }
 #section td {
   width:170px;
   height:40px;
   font-size:16px;
   font-weight:900;
 }
 #section tr:last-child { /* tr태그중에 마지막 tr태그 */
   height:60px;
 }
</style>
<script>
 function check(form)
 {
	 if(form.userid.value=="")
	 {
        alert("아이디를 입력하세요");
        form.userid.focus();
        return false;
	 }
	 else if(form.name.value=="")
		  {
		     alert("이름을 입력하세요");
		     form.name.focus();
		     return false;
		  }
	      else if(form.pwd1.value=="")
	    	   {
	    	      alert("비밀번호를 입력하세요");
	    	      form.pwd1.focus();
	    	      return false;
	    	   }
	           else if(form.pwd1.value != form.pwd2.value)
	        	    {
	        	       alert("비밀번호가 틀립니다");
	        	       form.pwd1.value="";
	        	       form.pwd2.value="";
	        	       form.pwd1.focus();
	        	       return false;
	        	    }
	                else if(form.email.value=="")
	                	 {
	                	    alert("이메일을 입력하세요");
	                	    form.email.focus();
	                	    return false;
	                	 }
	                     else
	                    	return true;
 }
</script>
<div id=image> <img src=../img/main3.PNG width=1200px height=400px> </div>
<div id=section>
 <form method=post action=member_ok.jsp onsubmit="return check(this)">
  <table align=center>
   <tr>
    <td> 아이디 </td>
    <td> <input type=text name=userid> </td>
   </tr>
   <tr>
    <td> 이름 </td>
    <td> <input type=text name=name> </td>
   </tr>
   <tr>
    <td> 비밀번호 </td>
    <td> <input type=text name=pwd1> </td>
   </tr>
   <tr>
    <td> 비밀번호확인 </td>
    <td> <input type=text name=pwd2> </td>
   </tr>
   <tr>
    <td> 이메일 </td>
    <td> <input type=text name=email> </td>
   </tr>
   <tr>
    <td colspan=2 align=right> <input type=submit value=회원가입> </td>
   </tr>
  </table>
 </form>
</div>

    <%@ include file="../main/bottom.jsp" %>
