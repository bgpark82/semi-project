<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- paypal -->
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
</head>
<body>
	<%@ include file="form/header.jsp"%>



	<br>
	<h1 style="text-align: center;">결제 정보</h1>
	<br>
	<hr>
	<div class="container" style="margin:0 auto; width: 500px;">
		<h3>
			<span>${userDto.u_name }</span><small>님의 결제정보창입니다.</small>
		</h3>
		<div class="panel panel-default" style="width: 400px">
			<div class="panel-body">
				<table class="table ">
					<thead>
						<tr>
							<th width="40%"></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>이름</td>
							<td><span>${userDto.u_name }</span></td>
						</tr>
						<tr>
							<td>금액</td>
							<td><span>${scheduleDto.s_price }</span></td>
						</tr>
						<tr>
							<td>인원수</td>
							<td><span>${scheduleDto.s_people }</span></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><span>${userDto.u_phone }</span></td>
						</tr>
						<tr>
							<td>예약날짜</td>
							<td><span>${scheduleDto.s_date }</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="container" style="float: center">

			<div id="paypal-button-container"></div>

			<div id="confirm" class="hidden">
				<div>Ship to:</div>
				<div>
					<span id="recipient"></span>, <span id="line1"></span>, <span
						id="city"></span>
				</div>
				<div>
					<span id="state"></span>, <span id="zip"></span>, <span
						id="country"></span>
				</div>

				<button id="confirmButton">Complete Payment</button>
			</div>

			<div id="thanks" class="hidden">
				Thanks, <span id="thanksname"></span>
			</div>
		</div>

		<button class="btn btn-default" onclick="location.href='ScheduleController?command=route_payment_confirmed'" style="float: right">결제 완료</button>
	</div>



	<script>
		paypal.Button
				.render(
						{

							env : 'sandbox', // sandbox | production

							client : {
								sandbox : 'AUb8TBTh13LfZmOGIlw2logfFahD1cOFyX2Tw85fqdBCOpDeDGfwnR2y-LXfZAkb-BiW3mpzc8a7aWpe',
								production : '<insert production client id>'
							},

							payment : function(data, actions) {
								return actions.payment.create({
									payment : {
										transactions : [ {
											amount : {
												total : '0.01',
												currency : 'USD'
											}
										} ]
									}
								});
							},

							// Wait for the payment to be authorized by the customer

							onAuthorize : function(data, actions) {

								// Get the payment details

								return actions.payment
										.get()
										.then(
												function(data) {

													// Display the payment details and a confirmation button

													var shipping = data.payer.payer_info.shipping_address;

													document
															.querySelector('#recipient').innerText = shipping.recipient_name;
													document
															.querySelector('#line1').innerText = shipping.line1;
													document
															.querySelector('#city').innerText = shipping.city;
													document
															.querySelector('#state').innerText = shipping.state;
													document
															.querySelector('#zip').innerText = shipping.postal_code;
													document
															.querySelector('#country').innerText = shipping.country_code;

													document
															.querySelector('#paypal-button-container').style.display = 'none';
													document
															.querySelector('#confirm').style.display = 'block';

													// Listen for click on confirm button

													document
															.querySelector(
																	'#confirmButton')
															.addEventListener(
																	'click',
																	function() {

																		// Disable the button and show a loading message

																		document
																				.querySelector('#confirm').innerText = 'Loading...';
																		document
																				.querySelector('#confirm').disabled = true;

																		// Execute the payment

																		return actions.payment
																				.execute()
																				.then(
																						function() {

																							// Show a thank-you note

																							document
																									.querySelector('#thanksname').innerText = shipping.recipient_name;

																							document
																									.querySelector('#confirm').style.display = 'none';
																							document
																									.querySelector('#thanks').style.display = 'block';
																						});
																	});
												});
							}

						}, '#paypal-button-container');
	</script>


	<%@ include file="form/footer.jsp"%>

</body>
</html>