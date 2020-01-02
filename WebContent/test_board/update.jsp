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
  
  //쿼리작성
  String sql="select * from test_board where id="+id;
  // ResultSet에 가져오기
  ResultSet rs=stmt.executeQuery(sql);
  rs.next(); // 무조건
%>  
<script>
function check()
{
	n=<%=rs.getInt("sung")%>;
	document.pkc.sung[n].checked=true;
	
	var ff="<%=rs.getString("food")%>";
	 var foo=ff.split(",");
	 for(i=0;i<foo.length-1;i++)
		 document.pkc.food[foo[i]].checked=true;
	 
	 document.pkc.juso.selectedIndex=<%=rs.getString("juso")%>;
	}
 
</script>
<body onload=check()>
<div id=section>
 <form name=pkc method=post action=update_ok.jsp>
 <input type=hidden name=id value=<%=id %>> <!--update_ok.jsp에 id값을 보내주기 위해 -->
  <table align=center>
   <tr>
    <td> 이름 </td>
    <td><%=rs.getString("name") %> </td>
   </tr>
   <tr>
    <td> 제목 </td>
    <td> <input type=text name=title value="<%=rs.getString("title") %>"> </td>
   </tr>
   <tr>
    <td> 내용 </td>
    <td> <input type=text name=content value="<%=rs.getString("content") %>"> </td>
   </tr>
   <tr>
    <td> 이메일 </td>
    <td> <input type=text name=email value="<%=rs.getString("email") %>"> </td>
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
    <td colspan=2 align=right> <input type=submit value=수정하기> </td>
   </tr>
  </table>
 </form>
</div>
</body>