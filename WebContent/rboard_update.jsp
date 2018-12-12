<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
   <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/SemiProject/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
             
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          
          $("#frm").submit();
      });    
});
 
 
 
</script>


<meta charset="UTF-8">
<title>리뷰게시판_글 수정</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="form/header.jsp" %>

   <h1>게시글 보기</h1>
   <form action="RBoardController" method="post" id="frm">
      <input type="hidden" name="command" value="update"/>
      <input type="hidden" name="r_no" value="${dto.r_no }"/>   
      <div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>내가 쓴 리뷰 수정</b><small> 자신이 쓴 리뷰를 수정할 수 있습니다.</small>
			</h1>
		</div>
	</div>
	<div class="row">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th colspan="3" style="background-color:#eeeeee; text-align:center;">리뷰게시판 글보기</th>
		</tr>
	</thead>
	<tbody>
         <tr>
            <th>작성자</th>
            <td>${dto.r_writer }</td>
         </tr>
         <tr>
            <th>여행지역</th>
            <td>
<select id="r_area" name="r_area" class="form-control">
				<option value="${dto.r_area }">${dto.r_area }</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="광주">광주</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="제주도">제주도</option>
			</select>            
			</td>
         </tr>
         <tr>
            <th>제   목</th>
            <td>
            <input class="form-control" type="text" name="r_title" value="${dto.r_title }"/>
            </td>
         </tr>
         <tr>
            <th>내   용</th>
            <td style="text-align:left;">
            <textarea rows="10" cols="60" name="r_content" id="ir1">${dto.r_content }</textarea>
            </td>
         </tr>
         </tbody>
         </table>
         </div>
         <hr>
            <input type="button" class="btn btn-default pull-right" value="취소" onclick="location.href='RBoardController?command=boardlist&u_no=${userDto.u_no}'"/>
            <input type="button" class="btn btn-default pull-right" value="수정" id="save">

       </div>
   </form>
<%@ include file="form/footer.jsp" %>
</body>
</html>