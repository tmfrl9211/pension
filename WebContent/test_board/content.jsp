<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<% // content.jsp
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  // id값 읽어오기
  String id=request.getParameter("id");
  
  String sql="update test_board set rnum=rnum+1 where id="+id;
  stmt.executeUpdate(sql);
  
  // 출력할 하나의 레코드를 읽어오는 쿼리 작성
  sql="select * from test_board where id="+id;
  // ResultSet으로 가져오기
  ResultSet rs=stmt.executeQuery(sql);
  rs.next(); // 첫번재 레코드로 이동
%>  
<style>
#table{
border:1px solid black;
}
#left{
font-weight:900;
}
</style>

<div id=gesi>
 <div id=gong> 게시판 </div>
 <table id=table align=center>
   <tr>
    <td id=left> 이름 </td>
    <td> <%=rs.getString("name") %> </td>
   </tr>
   <tr>
    <td id=left> 제목 </td>
    <td> <%=rs.getString("title") %> </td>
   </tr>
   <tr>
    <td id=left> 내용 </td>
    <td> <%=rs.getString("content") %> </td>
   </tr>
   <tr>
    <td id=left> 이메일 </td>
    <td> <%=rs.getString("email") %> </td>
   </tr>
   <tr>
    <td id=left> 성별  </td>
    <td>  <%
    String sung="";
    switch(rs.getInt("sung"))
    {
    case 0: sung="남자"; break;
    case 1: sung="여자"; break;
    }
    %> <%=sung %></td>
   </tr>
   <tr>
    <td id=left> 음식 </td>
    <td> 
    <%
    String[] foo=rs.getString("food").split(",");
    String food="";
    for(int i=0;i<foo.length;i++)
    	switch(foo[i])
    	{
    	case "0": food=food+"양꼬치"; break;
    	case "1": food=food+" 훠궈"; break;
    	case "2": food=food+" 꿔바로우"; break;
    	case "3": food=food+" 지삼선"; break;
    	case "4": food=food+" 깐궈볶음"; break;
    	case "5": food=food+" 샤오룽바오"; break;
    	case "6": food=food+" 마라탕"; break;
    	}
    %>
    <%=food %>
   </td>
   </tr>
   <tr>
    <td id=left> 주소 </td>
    <td>  
  <%
   String juso="";
   switch(rs.getInt("juso"))
   {
   case 0: juso="서울시"; break;
   case 1: juso="경기도"; break;
   case 2: juso="강원도"; break;
   case 3: juso="전라도"; break;
   case 4: juso="경상도"; break;
   case 5: juso="제주도"; break;
   }
  %>
  <%=juso %>
  </td>
   </tr>
    <tr>
        <td colspan=6 align=center>
        <a href="update.jsp?id=<%=id%>"> 수정</a>
         <a href="javascript:del()">삭제</a>
         <a href="list.jsp">목록</a>
        </td>
       </tr>
  </table>
</div>

  <div id=del_form>
   <form>
   삭제하시겠습니까? <p><br>
   <a href="delete.jsp?id=<%=id%>">확인</a>
   <a href="javascript:can()">취소</a>
    </form> 
  </div>
<style>
#del_form
{
position:absolute;
left:500px;
top:300px;
width:200px;
height:50px;
background:#eeeeee;
color:black;
visibility:hidden;
}
</style>
<script>
function del()
{
	document.all.del_form.style.visibility="visible";
	}
function can()
{
	document.all.del_form.style.visibility="hidden";
	}
</script>