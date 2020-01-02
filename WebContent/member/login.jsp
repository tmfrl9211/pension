<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="../main/top.jsp" %>
<style>
  #image {
  width:1200px;
  hegiht:400px;
  margin:auto;
  }
   #section {
    width:1200px;
    height:450px;
    margin:auto;
    margin-top:25px;
   }
   #section div {
    text-align:center;
   }
   #section div:nth-child(1) {  /* 로그인 글자 */
   /* id가 section 태그내의 div태그내의 첫번째 div태그*/
     font-size:30px;
     margin-top:20px;
   }
   #section div:nth-child(2) { 
     width:270px;
     height:30px;
     border-top:1px solid black;
     margin:auto;
   }
   #section div:nth-child(3) { 
     font-size:12px;
     text-align:left;
     margin-left:47px;
   }
   #section div:nth-child(5) {
     font-size:12px;
     text-align:left;
     margin-left:47px;
   }
   #section div:nth-child(6) span {
    font-size:12px;
    color:red;
   }
   #section div:nth-child(8) {  /* 회원로그인 안내 */
     font-size:12px;
     text-align:left;
     margin-left:15px;
     width:350px;
     height:80px;
   }
   #section div:nth-child(10) {
     font-size:12px;
     margin-top:30px;
   }
   #section input[type=text] { /* input태그중에 type=text인거 */
     width:270px;
     height:27px;
   }
   #section input[type=password] { /* input태그중에 type=password인거 */
     width:270px;
     height:27px;
   }
   #section input[type=submit] { /* input태그중에 type=submit인거 */
     width:274px;
     height:31px;
     background:blue;
     border:1px solid blue;
     color:white;
   }
   #section input[type=button] { /* input태그중에 type=button인거 */
     width:150px;
     height:31px;
   }
   #section #b1 {
     background:black;
     border:1px solid black;
     color:white;
   }
   #section #b2 {
     background:white;
     border:1px solid black;
     color:black;
   }
   #section #form {
     width:370px;
     height:420px;
     border:1px solid #cccccc;
     margin:auto;
   }
</style>
<script>
 function search()
 {
	 location="search.jsp"; //location은 브라우저의 주소입력칸과 마찬가지
 }
 function member()
 {
	 location="member.jsp";
 }
</script>
<div id=image> <img src=../img/main3.PNG width=1200px height=400px> </div>
<div id=section> <!--  아이디와 비밀번호를 입력 폼 -->
 <div id=form> <!-- 사각형을 만들 div태그 시작 -->  
  <form method=post action=login_ok.jsp>
    <div> 로그인 </div>
    <div> </div>
    <div> 회원아이디 </div>
    <div> <input type=text name=userid> </div>
    <div> 비밀번호 </div>
    <div> 
    <input type=password name=pwd> <br>
    <% 
    if(request.getParameter("err")!=null)
    {
    %>
    <span id=error> 아이디 혹은 비밀번호가 맞지 않습니다.</span>
    <%
    }
    %>
    </div>
    <div> <input type=submit value=로그인> </div>
    <div> <p>
      회원로그인 안내 <p>

      회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오.
    아직 회원이 아니시라면 회원으로 가입 후 이용해 주십시오. 
    </div>
    <div>
      <input type=button id=b1 value="아이디 비밀번호 찾기" onclick=search()>
      <!-- 찾기버튼 클릭하면 search.jsp문서로 이동 -->
      <input type=button id=b2 value="회원 가입" onclick=member()>
    </div>
    <div>
     메인으로 돌아가기
    </div>
  </form>
 </div> <!-- 사각형을 만들 div태그 종료 -->  
</div>
<%@ include file="../main/bottom.jsp" %>