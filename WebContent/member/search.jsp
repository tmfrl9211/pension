<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="../main/top.jsp" %>
<style>

</style>

<script>
function id_search()
{
	 name=encodeURIComponent(document.id.name.value);  // id_search.jsp에 보낼 이름
	 email=encodeURIComponent(document.id.email.value); // 이메일
	 url="id_search.jsp?name="+name+"&email="+email;
	 xml.open("get",url); // open("전송방식",주소(url))
	 xml.send(); // 호출
}
xml.onreadystatechange=function() // readyState : 0~4까지의 값이 발생
{
	 if(xml.readyState==4) // 수신완료
		 searchid.innerHTML=xml.responseText.trim();
}                         // xml.responseText => id_search.jsp에서 
                          //                     out.print() 값
function pwd_search()
{
	id=encodeURIComponent(document.pwd.id.value);
	name=encodeURIComponent(document.pwd.name.value);
	email=encodeURIComponent(document.pwd.email.value);
	url="pwd_search.jsp?name="+name+"&email="+email+"&id="+id;
	xml.open("get",url);
	xml.send();
	}
xml.onreadystatechange=function() // readyState : 0~4까지의 값이 발생
{
	 if(xml.readyState==4) // 수신완료
		 searchid.innerHTML=xml.responseText.trim();
}                         // xml.responseText => id_search.jsp에서 
                          //                     out.print() 값
</script>
<div id=image> <img src=../img/main3.PNG width=1200px height=400px> </div>
<div id=section> <!--  아이디와 비밀번호를 입력 폼 -->
   <table align=center width=300>
     <caption> <h3>아이디 ＊ 비밀번호 찾기 </h3> </caption>
    
     <tr>
       <td colspan=2> 아이디 찾기 <span id=searchid></span></td>
     </tr>
     <tr>
       <td> 이름 </td>
       <td> <input type=text name=name> </td>
     </tr>
     <tr>
       <td> 이메일 </td>
       <td> <input type=text name=email> </td>
     </tr>
     <tr>
       <td colspan=2> <input type=button onclick=id_search() value=아이디찾기> </td>
     </tr>
    </form>
     <!-- 비밀번호찾기 -->
    
     <tr>
       <td colspan=2> 비밀번호 찾기 <span id=searchpwd></span> </td>
     </tr>
     <tr>
       <td> 아이디 </td>
       <td> <input type=text name=userid> </td>
     </tr>
     <tr>
       <td> 이름 </td>
       <td> <input type=text name=name> </td>
     </tr>
     <tr>
       <td> 이메일 </td>
       <td> <input type=text name=email> </td>
     </tr>
     <tr>
       <td colspan=2> <input type=button onclick=pwd_search() value=비밀번호찾기> </td>
     </tr>
   
   </table>   
 </div> <!-- 사각형을 만들 div태그 종료 -->  
</div>
<%@ include file="../main/bottom.jsp" %>