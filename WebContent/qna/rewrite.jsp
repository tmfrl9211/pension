<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="../main/top.jsp" %>
<%
  // ref, depth, seq라는 값이 넘어온다.
  String ref=request.getParameter("ref");
  // depth는 직접 밑에 출력
  String seq=request.getParameter("seq");
  String Page=request.getParameter("page");
%>    
<jsp:include page="comm_menu.jsp"></jsp:include>
  <!-- 이름, 제목, 내용, 조회수, 작성일, 나이, 성별 -->
 <div id=right> 
   <!--  질문 글 쓰기 -->
 <h3> 답글달기 </h3>
 <form method=post action=rewrite_ok.jsp>
  <input type=hidden name=ref value=<%=ref%>>
  <input type=hidden name=page value=<%=Page%>>
  <input type=hidden name=depth value=<%=request.getParameter("depth")%>>
  <input type=hidden name=seq value=<%=seq%>>
   제목 <input type=text name=title size=50> <p>
   내용 <textarea cols=50 rows=6 name=content></textarea> <p>
   작성자 <input type=text name=name size=8> <p>
    
      비밀번호 <input type=password name=pwd> <p>
      <input type=submit value=글작성>
     </form>
</div>     
 <%@ include file="../main/bottom.jsp" %>
