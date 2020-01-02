<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

// gong_content.jsp => 1개의 레코드만 가져와서 전부 보여준다

// 가져올 레코드의 id값 가져오기
String id=request.getParameter("id");
// 조회수 추가
String sql="update gongji set rnum=rnum+1 where id="+id;
stmt.executeUpdate(sql);
// 쿼리 작성
sql="select * from gongji where id='"+id+"'";
//ResultSet에 해당 레코드 가져오기
ResultSet rs=stmt.executeQuery(sql);
// 첫번째 레코드 접근
rs.next(); 
%>
<%@ include file="../main/top.jsp" %>
<meta charset="utf-8">
<style>
#image {
  width:1200px;
  height:305px;
  margin:auto;
  }
</style>
<script>
  function dat_udpate(n,c,d) // 이름, 내용, id(gong_dat의 id)
  {
	  // 댓글입력폼을 수정폼으로 변경
	  // 이름, 내용, gong_dat의 id값을 value에 전달
	  document.pkc.name.value=n;
	  document.pkc.content.value=c;
	  document.pkc.g_id.value=d;
	  document.pkc.action="dat_update_ok.jsp";
	  document.pkc.sub.value="수정";
  }
  
  var xml=new XMLHttpRequest();
  function del(id)
  {
	  xml.open("get","dat_delete.jsp?id="+id);
	  xml.send();
  }
  xml.onreadystatechange=function()
  {
	  if(xml.readyState==4)
		  {
		     if(xml.responseText.trim()=="ok")
		    	 location.reload();       // f5나 마찬가지(=새로고침)
		  }
  }
</script>
 <div id=section>
    <div id=left> <!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA)  -->
      <ul>
        <li> 로고2 </li>
        <li> <a href="../gong/gong_list.jsp"> 공지사항 </a></li>
        <li> <a href="../gesipan/list.jsp"> 게시판 </a> </li>
        <li> 여행후기 </li>
        <li> QnA </li>
      </ul>
    </div> 
    <div id=right> <!-- 공지사항 내용보는 부분 -->
     <table width=500 align=center>
      <caption> <h3> 공지사항 보기 </h3></caption>
      <tr>
        <td> 제 목 </td>
        <td colspan=5> <%=rs.getString("title") %> </td>
      </tr>
      <tr>
        <td> 작성자 </td>
        <td> <b>관리자</b> </td>
        <td> 작성일 </td>
        <td> <%=rs.getString("writeday") %> </td>
        <td> 조회수 </td>
        <td> <%=rs.getString("rnum") %> </td> 
      </tr>
      <tr height=200>
        <td> 내용 </td>
        <td colspan=5> <%=rs.getString("content").replace("\r\n","<br>")%></td>
      </tr>
      <tr align=center>
        <td colspan=6> <a href="gong_list.jsp"> 목록가기 </a> </td>
      </tr>
     </table>
     <p>
     <table width=500 align=center>
       <%
       // 댓글테이블에서 불러오기 (현재레코드의 댓글만)
       sql="select * from gong_dat where g_id="+id+" order by id desc";
       rs=stmt.executeQuery(sql);
       
       while(rs.next())  // 댓글 레코드가 존재하는 만큼 출력
       {
    	   String n=rs.getString("name");
    	   String c=rs.getString("content");
    	   String d=rs.getString("id");// gong_dat 테이블의 id
       %>
       <tr height=40> <!-- 댓글 출력폼 -->
        <td width=100>
         <a href="javascript:dat_update('<%=n%>','<%=c%>','<%=d%>')"> <%=rs.getString("name")%> </a> </td>
        <td> <%=rs.getString("content")%> </td>
        <td width=100> 
        <a href="javascript:del(<%=d%>)"><%=rs.getString("writeday")%> </a></td>
       </tr>
       <%
       }
       %>
       <tr>
        <td colspan=3> <!-- 댓글 입력폼 -->
         <form namc=pkc method=post action=dat_input_ok.jsp>
          <input type=hidden name=g_id value=<%=id%>>
          <input type=text name=name placeholder=" 이 름 " size=6>
          <textarea cols=38 rows=2 name=content placeholder="내용입력"></textarea>
          <input type=submit value=댓글>
         </form>
        </td>
       </tr>
     </table> 
    </div>
  </div>
   <%@ include file="../main/bottom.jsp" %>