<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function idChk() {
	var doc = document.getElementsByName("d_id")[0];
	if(doc.value.trim()==""||doc.value==null){
		alert("아이디를 입력하세요.");
	
	}else{
		var target = "DriverController?command=idchk&id=" + doc.value.trim();
		open(target,"","width=500,height=500");
	}
}

function idChkConfirm() {
	var chk = document.getElementsByName("d_id")[0].title;
	if(chk=="n"){
		alert("아이디 중복체크를 해주세요");
		document.getElementsByName("d_id")[0].focus();
	}
}

</script>
</head>
<body>

<%@ include file="form/header.jsp" %>

<div class=container >
   <br><h1 style="text-align: center;">운 전 자  회 원 가 입</h1><hr>
</div>
   <div class=container align="center">
   <div class="jumbotron" style="width: 800px; " >
      
      <form class="form-horizontal" action="DriverRegistController" method="post" enctype="multipart/form-data">
		<div class="form-group">
            <div class="col-sm-1"></div>
            <label class="col-sm-2 control-label">프로필</label>
            <div class="col-sm-5">
                <span>
					이미지를 업로드하세요.<input type="file" name="driverProfile" >
				</span>
             </div>
          </div>
                   
        <div class="form-group">
           <div class="col-sm-1"></div>
              <label class="col-sm-2 control-label">아이디</label>           
            <div class="col-sm-5">
                <input class="form-control" type="text" name="d_id" title="n" required="required">
             </div>
             <div class="col-sm-2" >
                <input class="btn btn-default" type="button" value="중복체크" onclick="idChk();"/>
             </div>
          </div>
          
          <div class="form-group">
             <div class="col-sm-1"></div>
               <label class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="d_pw"  placeholder="비밀번호 입력" required="required">
             </div>
          </div>
          
        <!--   <div class="form-group">
               <label class="col-sm-3 control-label">비밀번호 확인</label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="d_check" placeholder="비밀번호 확인" required="required">
         </div>   
         <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
            <a id="checkD" style="font-size: 15px" >비밀번호가 일치하지 않습니다.</a>
             </div>
          </div> -->
          
          <div class="form-group">
             <div class="col-sm-1"></div>
               <label class="col-sm-2 control-label">이름</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="d_name" onclick="idChkConfirm();" required="required">
             </div>
             
          </div>
          
      <div class="form-group">
             <div class="col-sm-1"></div>
               <label class="col-sm-2 control-label">생년월일</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="d_birth" onclick="idChkConfirm();" placeholder="ex) 940521" required="required">
             </div>
             
             <div class="col-sm-3"></div>
          </div>


		<div class="form-group">
             <div class="col-sm-1"></div>
               <label class="col-sm-2 control-label">성별</label>
            <div class="col-sm-5" style="margin-top: 6px;">
               <input type ="radio"  name="d_gender" value="M" onclick="idChkConfirm();" required="required" style="margin-left: 30px;"> 남성
            <input type ="radio"  name="d_gender" value="W" onclick="idChkConfirm();" required="required"> 여성
            
             </div>
          </div>
      
	<div class="form-group">
		<div class="col-sm-1"></div>
		<label class="col-sm-2 control-label">성별</label>
		<div class="col-sm-5" style="margin-top: 6px;">
      		<select id="local" name="d_region" class="form-control">
				<option >지역을 선택해주세요</option>
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
             </div>
          </div>
      
      

          
          <div class="form-group">
            <div class="col-sm-1"></div>
            <label class="col-sm-2 control-label">휴대전화</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="d_phone" onclick="idChkConfirm();" placeholder="'-'은 제외하고 입력해주세요." required="required">
             </div>
          </div>
          
          <div class="form-group">
             <div class="col-sm-1"></div>
                <label class="col-sm-2 control-label">이메일</label>
             <div class="col-sm-5">
                <input class="form-control" type="email" name="d_email" onclick="idChkConfirm();" placeholder="example@naver.com" required="required"/>
             </div>   
          </div>
          
           <div class="form-group">
             <div class="col-sm-1"></div>
                <label class="col-sm-2 control-label">면허 번호</label>
             <div class="col-sm-5">
                <input class="form-control" type="text" name="d_license" onclick="idChkConfirm();" placeholder="면허 번호를 입력해주세요" required="required"/>
             </div>   
          </div>
          
          <div class="form-group">
             <div class="col-sm-1"></div>
                <label class="col-sm-2 control-label">차량 번호</label>
             <div class="col-sm-5">
                <input class="form-control" type="text" name="d_carnum" onclick="idChkConfirm();" placeholder="차량 번호를 입력해주세요" required="required"/>
             </div>   
          </div>
          
          <div class="form-group" style="margin-top: 30px;">
          
             <div>개인정보 수집 및 이용에 관한 동의
             <input type="checkbox" style="margin-left: 5px;margin-bottom: 15px;"/>
             </div>
             <textarea style=" overflow-x: hidden; width: 440px; height: 130px; resize: none;" readonly="readonly">정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 택시로 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 택시로가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
택시로 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
네이버 위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘네이버 위치정보 이용약관’에서 규정하고 있습니다.

2. 수집한 개인정보의 이용
택시로 및 택시로 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 파기
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 네이버페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다.

전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률 
계약 또는 청약철회 등에 관한 기록: 5년 보관 
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자금융거래법 
전자금융에 관한 기록: 5년 보관
- 통신비밀보호법 
로그인 기록: 3개월</textarea>        
          
          </div>
          <br>
          
          <div class="container">
          <div class="form-group" >
             <div class="col-sm-6">
                <input class="btn btn-primary btn-block" type="submit" value="회원가입">
             </div>
             
             <div class="col-sm-6">
                <button class="btn btn-default btn-block" type="button" onclick="location.href='driver_registform.jsp'">가입취소</button>
             </div>
          </div>
          </div>

          
      </form>
   </div>
</div>







<!-- 
<h1>회원가입</h1>

	<form action="DriverController" method="post">
		<input type="hidden" name="command" value="registdriver" />
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="d_id" title="n" required="required" />
					<input type="button" value="중복체크"	onclick="idChk();"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="d_pw" onclick="idChkConfirm();"
					required="required" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="d_name" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="d_birth" onclick="idChkConfirm();" placeholder="890522" required="required" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					남자<input type="radio"	name="d_gender" value="M" onclick="idChkConfirm();" required="required" />
					여자<input type="radio"	name="d_gender" value="W" onclick="idChkConfirm();" required="required" />
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="d_phone" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="d_email" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>면허번호</th>
				<td><input type="text" name="d_license" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="d_carnum" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="가입" />
				<input type="button" value="취소" onclick="location.href='index.jsp'" />
			</td>
			</tr>
		</table>
	</form> -->
<%@ include file="form/footer.jsp" %>
</body>
</html>