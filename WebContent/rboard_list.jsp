<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
   <% response.setContentType("text/html; charset=UTF-8"); %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.taxi.user.dto.UserDto" %>
<%@ page import="com.taxi.board.dto.RBoardDto" %> <!-- 해당 페이지 전체에 com.my.dto.MyBoardDto가 적용 -->
<%@ page import="com.taxi.board.dao.RBoardDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/1-col-portfolio.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta charset="UTF-8">
<title>리뷰 게시판</title>

<style type="text/css">
.card{
   padding: 32px 10px 0 10px;
}

.frontpage_square{
   position:relative;
   overflow:hidden;
   padding-bottom:90%;
}

.frontpage_square img{
   position:absolute;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    overflow: hidden;
}

.frontpage_square:hover img{
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}

.text {
  color: #f2f2f2;
  font-size: 13px;
  padding: 8px 8px;
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: right;
}

</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    $("span.glyphicon").on({   
        click: function(){
            $(this).css("color", "#C9233B");
        }
    });
    
    $("#condition").change(function(){      
       var condition = $("#condition option:selected").val();
       var u_no = $(".uno").attr("id");
       //alert(u_no);      
       location.href="RBoardController?command=rboard_search&condition="+condition+"&u_no="+u_no;
       
    });
});


function like_func(chk){
   var r_no = $(chk).parent().parent().siblings().eq(0).attr("id");
   var u_no = $(chk).parent().parent().attr("id");

   $.ajax({
      url:"LikeController?r_no="+r_no+"&u_no="+u_no,
      type: "GET",
      dataType: "json",
      success:function(data){
         var like_img = "";
         var msg = "";
         msg += data.msg;
         //alert(msg);
         
         if(data.like_check == 0){
            like_img = "./images/dislike0.png";
         }else{
            like_img = "./images/like0.png";
         }
         
         //alert($(chk).prop("tagName"));
         
         $(chk).attr('src', like_img);
         $(chk).next().html(data.r_recommend);
         
      },
      error:function(){
         alert("에러");
      }
      
   })
   
};

function login_need(){
   alert("로그인을 먼저 해주세요.");
};


</script>

</head>

<body>
<%@ include file="form/header.jsp" %>

    <div class="container">

   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">
            <b>리뷰 게시판 </b><small> 여행자들의 솔직한 여행후기!</small></h1>
            <aside class="uno" style="float:left;" id="${param.u_no }">
               <select class="form-control" id="condition" name="condition">
                  <option value="all"<c:if test="${Name eq 'all'}">selected</c:if>>전체리뷰(최신순)</option>
                  <option value="hit" <c:if test="${param.condition=='hit'}">selected</c:if>>조회순</option>
                  <option value="recommend"<c:if test="${param.condition=='recommend'}">selected</c:if>>추천순</option>
               </select>
            </aside>
            <aside style="float:right; display: inline; width: 270px;">
            <form  action="RBoardController" name="post" style="padding-right: 28px;">
               <input type="hidden" name="command" value="rboard_search"/>
               <div class="col-xs-12" style="padding: 0;">
                  <div class="col-xs-10" style=" padding: 0;"><input class="form-control" type="text" id="word" placeholder="검색할 내용을 입력하세요."/></div>
                  <div class="col-xs-2" style=" padding: 0 0 0 10px;"><input type="submit" value="검색" class="btn btn-default"/></div>
               </div>
            </form>
            </aside>
      </div>

   </div>



    
    <div class="row" >
    
   <c:choose>
      <c:when test="${empty list }">
            <tr>
               <td colspan="6">=====작성된 글이 없습니다=====</td>
            </tr>
      </c:when>
      <c:otherwise>
      <c:forEach items="${list }" var="dto">

         <article class="card col-12 col-md-4 col-lg-3">
         <header style="margin-bottom: 5px">
         <strong><img class="img-circle" src="img/cs.png" width="34px" height="34px"><span> ${dto.r_writer }</span></strong> 
         </header>
          <figure>
            <div class="frontpage_square img-rounded" onclick="location.href='RBoardController?command=selectone&r_no=${dto.r_no }&u_id=${param.u_no }'"  style="cursor: pointer" >              
               <c:set var="content" value="${dto.r_content }" />
<%
            Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
            String content = (String)pageContext.getAttribute("content");
            Matcher match = pattern.matcher(content);
            String imgTag = null;
             
            if(match.find()){ // 이미지 태그를 찾았다면,,
                imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
            }
%>
            
            <%=imgTag %>
               <div class="text">조회수 ${dto.r_hit }</div>
            </div>
             
             <aside style="margin-top: 5px">
             <div>
                <div id="${dto.r_no }" class="col-xs-6" style="padding: 0">${dto.r_area }</div>
                
                <c:choose>
               <c:when test="${param.u_no ne null }">
               <div id="${param.u_no }" name="u_no" class="col-xs-6" style="padding: 0 8px 0 0; " align="right">
                  <div>
                  <img onclick="like_func(this);"style="cursor: pointer;" height="18px" src="./images/dislike0.png">
                 <span>
                  ${dto.r_recommend }
                  </span>
                  </div>
               </div>
               </c:when>
               <c:otherwise>
                  <img onclick="login_need();" height="18px" src="./images/dislike0.png">

                  <div>${dto.r_recommend }</div>
               </c:otherwise>
            </c:choose>
                </div>
             
             <div class="story-entry_content_title">
                <strong>
                   ${dto.r_title }
                </strong>   
             </div>
          </aside>       
      
          </figure>
         </article>
         
      </c:forEach>
   </c:otherwise>
</c:choose>
   
   </div>
   <hr/>
   <input type="button" value="리뷰작성" class="btn btn-default pull-right" onclick="location.href='RBoardController?command=writeform&u_id=${userDto.u_id}'"/>
   <br><br><br><br>
</div>
   
<%@ include file="form/footer.jsp" %>
</body>
</html>