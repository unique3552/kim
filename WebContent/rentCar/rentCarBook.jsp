<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<style type="text/css">
section {
	margin-left: 0px;
	margin-top: -95px;
	width: 100%;
}

table.menu {
	height: 100px;
	margin: 20px auto;
	margin-left: 2%;
}

table.select{
	float: left;
	margin: 20px auto;
	margin-left: 2%;
}

.position {
	width: 1000px;
	
}

h3{
	margin: 0px;
}
.tb{
	width: 1000px;
}
.tb td{
	max-width: 220px;
}

th {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	min-width: 150px;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
	background-color: #e6e6e6;
}

td {
	text-align: center;
	padding: 10px 20px 10px 20px;
}

.left {
	text-align: left;
	text-indent: 5px;
}

.right {
	text-align: right;
}

select {
	width: 100px;
}
.agreeWrap {
	background-color: white;
	height: 280px;
	overflow-y: scroll;
	margin: 20px 0;
}

.inputHeight {
	height: 30px;
}

.noBMargin{
	margin-top: 95px;
	margin-bottom: 0px;
}
.noTMargin{
	margin-top: 0%;
}

.button {
	text-align: center;
}
.formInfo{
	background-color: white;
	width: 1020px;
	border-radius: 3px;
	padding: 10px;
}

</style>
<script>
	$(function() {
		var aCheck = false;
		var cCheck = false;
		var eCheck = false;
		
		$("#aFlight").val("미정");
		$("#dFlight").val("미정");
		
		$("#agree").change(function() {
			if (this.checked) {
				aCheck = true;
			} else {
				aCheck = false;
			}
		});
		
		$("#aFlight_input").change(function() {
			var aFlight = $(this).val();
			if (aFlight != "") {
				$("#aFlight").val(aFlight);
			} else {
				$("#aFlight").val("미정");
			}
		});
		
		$("#dFlight_input").change(function() {
			var dFlight = $(this).val();
			if (dFlight != "") {
				$("#dFlight").val(dFlight);
			} else {
				$("#dFlight").val("미정");
			}
		});
		
		$(".noc_radio").change(function() {	
			var nocChecked = $(':radio[name="noc"]:checked').val();
			
			if (nocChecked == "noc") {
				$(".price").html("￦8,000");
				$("#won").val("8000");
			} else if (nocChecked == "nocfull") {
				$(".price").html("￦15,000");
				$("#won").val("15000");
			}
		});
		
		$("#cancel").change(function() {
			if (this.checked) {
				cCheck = true;
			} else {
				cCheck = false;
			}
		});
		
		
		
		$("#cash_receipt").change(function() {
			if ($(this).val() == "no") {
				$("#cr_input").html("");
			} else if ($(this).val() == "1") {
				$("#cr_input").html('개인소득공제용 : 휴대전화번호 <input type="text" class="essential" name="cr_input"> ("-"생략)');
			} else if ($(this).val() == "2") {
				$("#cr_input").html('사업자지출증빙용 : 사업자등록번호 <input type="text" class="essential" name="cr_input"> ("-"생략)');
			}
		});
		
		$("#frm").on("click", "#book", function() {
			$(".essential").change(function() {
				eCheck = false;
				var essential = $(this).val();
				if (essential == "") {
					eCheck = false;
				} else {
					eCheck = true;
				}
			});				
			
			if (aCheck == false) {
				alert("여행 약관에 체크 해 주세요.");
			} else if (cCheck == false) {
				alert("취소규정 동의 버튼에 체크 해 주세요.")
			} else if (eCheck == false)  {
				alert("필수 항목을 모두 입력 해 주세요.");
			} else {
				document.frm.submit();
			}
		});
		
		$(".essential").change(function() {
			if ($(this).val() != "") {
				eCheck = true;
			} else {
				eCheck = false;
			}
		});
		
		$("#book_cancel").click(function() {
			location.href="./rentCarList.rentCar";
		});
		
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > <a href="./rentCarList.rentCar">렌트카</a> > 렌트카 예약
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">예약 정보 입력</p>
		</div>
		</div>
		
		<form action="./rentCarBookSuccess.rentCar" name="frm" id="frm" method="post">
		<div class="formInfo position">
		<div class="position">
			<div class="position titleBox">
					<h3>여행 약관</h3>
			</div>
			<div class="agreeWrap">
				<h3>제1조(목적)</h3>
				<p>이 약관은 (주)여행박사(이하 당사라 한다.)와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을
					목적으로 합니다.</p>

				<h3>제2조(당사와 여행자 의무)</h3>
				<ul>
					<li>① 당사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내,운송,숙박 등
						여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.</li>
					<li>② 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행업자의 여행질서 유지에 적극
						협조하여야 합니다.</li>
				</ul>

				<h3>제3조(용어의 정의)</h3>
				<p>여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.</p>
				<ul>
					<li>1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용 <br>
						(이하 '여행서비스'라 함), 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행.
					</li>
					<li>2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송,숙식,관광 등 여행에
						관한 전반적인 계획을 수립하여 실시하는 여행.</li>
					<li>3 해외여행 수속대행(이하 수속대형계약이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로
						약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 수속 대행업무라함)를 대행하는 것.
						<ul>
							<li>1) 여권, 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속</li>
							<li>2) 출입국 수속서류 작성 및 기타 관련업무</li>
						</ul>
					</li>
				</ul>

				<h3>제4조(계약의 구성)</h3>
				<ul>
					<li>① 여행계약은 여행계약서(붙임)와 여행약관,여행일정표(또는 여행 설명서)를 계약내용으로 합니다.</li>
					<li>② 여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용,교통수단,쇼핑횟수,숙박장소,식사 등
						여행실시일정 및 여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.</li>
				</ul>

				<h3>제5조(특약)</h3>
				<p>당사와 여행자는 관계법규에 위반되지 않는 범위내에서 서면 또는 인터넷 홈페이지상의 고지로 특약을 맺을 수
					있습니다. 이 경우 표준약관과 다름을 당사는 여행자에게 설명해야 합니다.</p>

				<h3>제6조(계약서 및 약관 등 교부)</h3>
				<p>당사는 여행자와 여행계약을 체결한 경우 계약서와 여행약관, 여행일정표(또는 여행설명서)를 각 1부씩여행자에게
					교부하여야 합니다.</p>

				<h3>제7조(계약서 및 약관 등 교부 간주)</h3>
				<p>당사와 여행자는 다음 각 호의 경우 여행계약서와 여행약관 및 여행일정표(또는 여행설명서)가 교부된 것으로
					간주합니다.</p>
				<ul>
					<li>1. 여행자가 인터넷 등 전자정보망으로 제공된 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에
						동의하고 여행계약의 체결을 신청한데 대해 당사가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를
						통지한 경우</li>
					<li>2. 당사가 팩시밀리 등 기계적 장치를 이용하여 제공한 여행계약서, 약관 및 여행일정표(또는
						여행설명서)의 내용에 대하여 여행자가 동의하고 여행계약의 체결을 신청하는 서면을 송부한데 대해 당사자가 전자정보망 내지
						기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우</li>
				</ul>

				<h3>제8조(당사의 책임)</h3>
				<p>당사는 여행 출발시부터 도착시까지 당사 또는 그 고용인, 현지 여행업자 또는 그 고용인 등(이하 사용인이라
					함)이 제 2조 제 1항에서 규정한 여행업자 임무와 관련하여 여행자에게 고의 또는 과실로 손해를 가한 경우 책임을
					집니다.</p>

				<h3>제9조(최저행사인원 미 충족시 계약해제)</h3>
				<ul>
					<li>① 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게
						통지하여야 합니다.</li>
					<li>② 당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급 받은
						계약금 환급 외에 다음 각 목의 1의 금액을 여행자에게 배상하여야 합니다.
						<ul>
							<li>가. 여행출발 1일전까지 통지시 : 여행요금의 30%</li>
							<li>나. 여행출발 당일 통지시 : 여행요금의 50%</li>
						</ul>
					</li>
				</ul>

				<h3>제10조(계약체결 거절)</h3>
				<p>당사는 여행자에게 다음 각 호의 1에 해당하는 사유가 있을 경우에는 여행자와의 계약체결을 거절할 수 있습니다.</p>
				<ul>
					<li>1. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 지장이 있다고 인정될 때</li>
					<li>2. 질병 기타 사유로 여행이 어렵다고 인정될 때</li>
					<li>3. 계약서에 명시한 최대행사인원이 초과되었을 때</li>
				</ul>

				<h3>제11조(여행요금)</h3>
				<ul>
					<li>① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 희망여행은 당사자간 합의에 따릅니다.
						<ul>
							<li>1. 항공기, 선박, 철도 등 이용운송기관의 운임(보통운임기준)</li>
							<li>2. 공항, 역, 부두와 호텔사이 등 송영버스요금</li>
							<li>3. 숙박요금 및 식사요금</li>
							<li>4. 안내자경비</li>
							<li>5. 여행 중 필요한 각종세금</li>
							<li>6. 국내외 공항, 항만세</li>
							<li>7. 관광진흥개발기금</li>
							<li>8. 일정표내 관광지 입장료</li>
							<li>9. 기타 개별계약에 따른 비용</li>
						</ul>
					</li>
					<li>② 여행자는 계약 체결 시 계약금(여행요금 중 10%이하 금액)을 당사에
						지급하여야 하며, 계약금은 여행요금 또는 손해배상액의 전부 또는 일부로 취급합니다.</li>
					<li>③ 여행자는 제1항의 여행요금 중 계약금을 제외한 잔금을 여행출발 7일 전까지 당사에 지급하여야 합니다.</li>
					<li>④ 여행자는 제1항의 여행요금을 당사가 지정한 방법 (지로구좌, 무통장입금 등)으로 지급하여야 합니다.</li>
					<li>⑤ 희망여행요금에 여행자 보험료가 포함되는 경우, 당사는 보험회사명, 보상내용 등을 여행자에게 설명하여야
						합니다.</li>
				</ul>

				<h3>제12조(여행요금의 변경)</h3>
				<ul>
					<li>① 국외여행을 실시함에 있어서 이용운송,숙박기관에 지급하여야 할 요금이 계약체결시보다 5%이상 증감하거나
						여행요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는그 증감된 금액 범위 내에서
						여행요금의 증감을 상대방에게 청구할 수 있습니다.</li>
					<li>② 여행업자는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행출발일 15일전에 여행자에게
						통지하여야 합니다.</li>
				</ul>

				<h3>제13조(여행조건의 변경요건 및 요금 등의 정산)</h3>
				<ul>
					<li>① 위 제1조 내지 제12조의 여행조건은 다음 각 호의 1의 경우에 한하여 변경될 수 있습니다.
						<ul>
							<li>1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한
								경우</li>
							<li>2. 천재지변, 전란, 정부의 명령, 운송,숙박기관 등의 파업,휴업 등으로 여행의 목적을 달성할 수
								없는 경우</li>
						</ul>
					</li>
					<li>② 제1항의 여행조건 변경 및 제12조의 여행요금 변경으로 인하여 제11조제1항의
						여행요금에 증감이 생기는 경우에는 여행출발 전 변경 분은 여행출발 이전에, 여행 중 변경 분은 여행종료 후 10일
						이내에 각각 정산(환급)하여야 합니다.</li>
					<li>③ 제1항의 규정에 의하지 아니하고 여행조건이 변경되거나 제14조 또는 제15조의 규정에 의한 계약의
						해제,해지로 인하여 손해배상액이 발생한 경우에는 여행출발 전 발생 분은 여행출발이전에, 여행 중 발생 분은 여행종료 후
						10일 이내에 각각 정산(환급)하여야 합니다.</li>
					<li>④ 여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등 여행요금에 포함된 서비스를 제공받지 못한
						경우 당사에게 그에 상응하는 요금의 환급을 청구할 수 없습니다. 단, 여행이 중도에 종료된 경우에는 제16조에 준하여
						처리합니다.</li>
				</ul>

				<h3>제14조(손해배상)</h3>
				<ul>
					<li>① 당사는 현지여행업자 등의 고의 또는 과실로 여행자에게 손해를 가한 경우 당사는 여행자에게 손해를
						배상하여야 합니다.</li>
					<li>② 당사의 귀책사유로 여행자의 국외여행에 필요한 여권, 사증, 재입국 허가 또는 각종 증명서 등을
						취득하지 못하여 여행자의 여행일정에 차질이 생긴 경우 당사는 여행자로부터 절차대행을 위하여 받은 금액 전부 및 그
						금액의 100%상당액을 여행자에게 배상하여야 합니다.</li>
					<li>③ 당사는 항공기, 기차, 선박 등 교통기관의 연발착 또는 교통체증 등으로 인하여 여행자가 입은 손해를
						배상하여야 합니다. 단, 당사가 고의 또는 과실이 없음을 입증한 때에는 그러하지 아니합니다.</li>
					<li>④ 당사는 자기나 그 사용인이 여행자의 수하물 수령, 인도, 보관 등에 관하여 주의를 해태(懈怠)하지
						아니하였음을 증명하지 아니하면 여행자의 수하물 멸실, 훼손 또는 연착으로 인한 손해를 배상할 책임을 면하지 못합니다.
					</li>
				</ul>

				<h3>제15조(여행출발 전 계약해제)</h3>
				<ul>
					<li>① 당사 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은
						'소비자피해보상규정'(재정경제부고시)에 따라 배상합니다.
						<dl>
							<dt>1. 여행자의 여행계약 해제 요청이 있는 경우 (고객 취소요청 시)</dt>
							<dd>- 여행출발일 30일전까지 통보시 : 계약금 환급</dd>
							<dd>- 여행출발일 20일전까지 요청 시(29~20) : 상품가격의 10% 배상</dd>
							<dd>- 여행출발일 10일전까지 요청 시(19~10) : 상품가격의 15% 배상</dd>
							<dd>- 여행출발일 8일 전까지 요청 시(9~8) : 상품가격의 20% 배상</dd>
							<dd>- 여행출발일 1일 전까지 요청 시(7~1) : 상품가격의 30% 배상</dd>
							<dd>- 여행출발 당일 취소 요청 시 : 상품가격 50% 배상</dd>
						</dl>
						<dl>
							<dt>2. 당사의 귀책사유로 당사가 취소하는 경우</dt>
							<dd>- 여행출발일 30일전까지 통보시 : 계약금 환급</dd>
							<dd>- 여행출발일 20일전까지 요청 시(29~20) : 상품가격의 10% 배상</dd>
							<dd>- 여행출발일 10일전까지 통보 시(19~10) : 상품가격의 15% 배상</dd>
							<dd>- 여행출발일 8일 전까지 통보 시(9~8) : 상품가격의 20% 배상</dd>
							<dd>- 여행출발일 1일 전까지 통보 시(7~1) : 상품가격의 30% 배상</dd>
							<dd>- 여행출발 당일 취소 통보시 : 상품가격의 50% 배상</dd>
							<dd>단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제9조(최저행사인원
								미충족시 계약해제)의 조항에 의거하여 당사가 여행자에게 배상한다.</dd>
						</dl>
					</li>

					<li>② 당사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는
						경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 여행계약을 해제할 수 있습니다.
						<dl>
							<dt>1. 당사가 해제할 수 있는 경우</dt>
							<dd>가. 제13조제1항제1호 및 제2호사유의 경우</dd>
							<dd>나. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때</dd>
							<dd>다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우</dd>
							<dd>라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우</dd>
						</dl>

						<dl>
							<dt>2. 여행자가 해제할 수 있는 경우</dt>
							<dd>가. 제13조제1항제1호 및 제2호의 사유가 있는 경우</dd>
							<dd>나. 여행자의 3촌 이내 친족이 사망한 경우</dd>
							<dd>다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우</dd>
							<dd>라. 배우자 또는 직계존비속이 신체이상으로 3일 이상 병원(의원)에 입원하여 여행 출발 전까지 퇴원이
								곤란한 경우 그 배우자 또는 보호자 1인</dd>
							<dd>마. 당사의 귀책사유로 계약서 또는 여행일정표(여행설명서)에 기재된 여행일정대로의 여행실시가
								불가능해진 경우</dd>
							<dd>바. 제12조 제1항의 규정에 의한 여행요금의 증액으로 인하여 여행 계속이 어렵다고 인정될 경우</dd>
						</dl>

					</li>
				</ul>

				<h3>제16조(여행출발 후 계약해지)</h3>
				<ul>
					<li>① 당사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 이 여행계약을 해지할 수 있습니다. <br>
						단, 이로 인하여 상대방이 입은 손해를 배상하여야 합니다.
					</li>
					<li>② 제1항의 규정에 의하여 계약이 해지된 경우 당사는 여행자가 귀국하는데 필요한 사항을 협조하여야 하며,
						이에 필요한 비용으로서 당사의 귀책사유에 의하지 아니한 것은 여행자가 부담합니다.</li>
				</ul>

				<h3>제17조(여행의 시작과 종료)</h3>
				<p>여행의 시작은 탑승수속(선박인 경우 승선수속)을 마친 시점으로 하며, 여행의 종료는 여행자가 입국장 보세구역을
					벗어나는 시점으로 합니다. 단, 계약내용상 국내이동이 있을 경우에는 최초 출발지에서 이용하는 운송수단의 출발시각과
					도착시각으로 합니다.</p>

				<h3>제18조(설명의무)</h3>
				<p>당사는 계약서에 정하여져 있는 중요한 내용 및 그 변경사항을 여행자가 이해할 수 있도록 설명하여야 합니다.</p>

				<h3>제19조(보험가입 등)</h3>
				<p>당사는 이 여행과 관련하여 여행자에게 손해가 발생한 경우 여행자에게 보험금을 지급하기 위한 보험 또는 공제에
					가입하거나 영업보증금을 예치하여야 합니다.</p>

				<h3>제20조(기타사항)</h3>
				<ul>
					<li>① 이 계약에 명시되지 아니한 사항 또는 이 계약의 해석에 관하여 다툼이 있는 경우에는 당사 또는
						여행자가 합의하여 결정하되, 합의가 이루어지지 아니한 경우에는 관계법령 및 일반관례에 따릅니다.</li>
					<li>② 특수지역에의 여행으로서 정당한 사유가 있는 경우에는 당사의 여행약관의 내용과 달리 정할 수 있습니다.
					</li>
				</ul>
			</div>
			<div><input type="checkbox" id="agree"><label>전체 약관 내용을 확인하였으며, 약관 내용에 동의합니다.</label></div>
		</div>
		
			<div class="position">
				<div class="position titleBox">
					<h3>예약 정보</h3>
				</div>
				<table class="tb">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<th>픽업점포</th>
						<td class="left">
							${requestScope.location.nation} ${requestScope.location.region} 지점
							<input type="hidden" name="rentCarNum" value="${requestScope.num}">
						</td>
						<th>반납점포</th>
						<td class="left">${requestScope.location.nation} ${requestScope.location.region} 지점</td>
					</tr>				
					<tr>
						<th>픽업날짜</th>
						<td>
							${requestScope.pDate}
							<input type="hidden" name="pDate" value="${requestScope.pDate}">
						</td>
						<th>반납날짜</th>
						<td>
							${requestScope.rDate}
							<input type="hidden" name="rDate" value="${requestScope.rDate}">
						</td>
					</tr>
					<tr>
						<th>교통편명</th>
						<td colspan="3">
							<div class="left">
								<label>출발</label><input class="inputHeight" type="text" id="aFlight_input">
								<label>ex)OZ172 (미정시 공란)</label>
								<input type="hidden" name="aFlight" id="aFlight">							
								<span style="margin-left:10px;margin-right:10px;">/</span>							
								<label>귀국</label><input class="inputHeight" type="text" id="dFlight_input">
								<label>ex)OZ171 (미정시 공란)</label>
								<input type="hidden" name="dFlight" id="dFlight">	
							</div>
							<ul class="left" style="padding:8px 0 8px 12px;">
								<li>※편명 미입력시 차량준비, 송영 등에 차질이 생길 수 있습니다. 반드시 정확한 편명 입력 부탁드립니다.</li>
								<li style="color:red;">※송영 서비스는 당일 항공 도착 손님만 유효합니다. 당일 도착이 아닐 경우 해당점포에서 직접 수령.</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>선택차량</th>
						<td>${requestScope.rentCar.name}</td>
						<th>내비게이션</th>
						<td>
							<div class="left">								
								<label><input type="radio" value="kor" class="i_radio" name="navigation" checked="checked">한국어</label>								
								<label><input type="radio" value="eng" class="i_radio" name="navigation">영어</label>								
								<label><input type="radio" value="no" class="i_radio" name="navigation">상관없음</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>영업손실보장(NOC) 커버</th>
						<td colspan="3">
							<div class="left">						
								<label style="display:none;"><input type="radio" value="3" name="NOC" class="i_radio" disabled="disabled">풀커버</label>
								<label><input type="radio" value="noc" name="noc" class="noc_radio">NOC 신청 (24시간 8,000원/타이어,휠 불포함)</label>						
								<label><input type="radio" value="nocfull" name="noc" class="noc_radio" checked="checked">풀커버 신청 (24시간 15,000원)</label>						
							</div>
							<p class="left" style="padding:8px 0 8px 12px;">						
								※ 차량 렌트비에는 <span class="font-red">기본 보험료(대인,대물,자손,탑승자 피해)가 포함</span>되어 있습니다.<br>
								대인 : 무제한 / 대물 : 무제한 (1사고당) / 자손 : 전액 / 탑승자 피해 : 1명당 3,000만 엔까지 (운전자과실 관계없이 보장)<br>
								사고가 날 경우 위 보장내용 외에도 NOC(영업손실액) 부분이 발생하며 한화 20만 원~30만 원까지 나올 수 있습니다.<br> (영업손실보장 커버 신청시 해당 금액도 면책됩니다.)<br>
								<span style="color: red;">사고에 대한 책임은 사고 당사자에게 있으며 어라운드무비는 예약대행사로서 사고 후 후유 장애에 대해 일체에 대한 책임지지 않습니다.</span>					
							</p>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: top;" scope="row">기타 요청사항</th>
						<td colspan="3">
							<p><textarea style="width:100%; height:100px;" rows="3" name="require"></textarea></p>
						</td>
					</tr>
				</table>
			</div>
		
			<div class="position">
				<div class="position titleBox">
					<h3>결제 정보</h3>
				</div>
				<table>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tr>
						<th>결제방법</th>
						<td>
							<div class="left">
								<label><input type="radio" checked="checked">현지결제 (*예약 후 24시간 내 아래 원화결제금액을 계좌이체 후 차량이 확정되면 현지에서 차량 인수시 렌트요금 결제(현지통화/카드) </label>	
							</div>
						</td>					
					</tr>				
					<tr>
						<th>취급수수료</th>
						<td class="left">￦ 20,000 (현재 무료 이벤트 적용 중. 단, 변동사항이 발생하거나 취소시 20,000원이 공제됩니다)</td>					
					</tr>				
					<tr>
						<th>영업손실보장커퍼</th>
						<td class="left"><span class="price">￦15,000</span></td>
					</tr>
					<tr>
						<th scope="row">원화결제금액</th>
						<td class="left">
							<span style="color: red;" class="price">￦15,000</span>
							<input type="hidden" name="won" id="won" value="15000">
						</td>
					</tr>
					<tr>
						<th>*전용계좌발급</th>
						<td class="left">
							<div style="margin-left:2px;">은행선택
								<select name="bank" class="inputHeight essential" style="width: 150px; visibility: visible;">
									<option value="" selected="selected">선택</option>
									<option value="ibk">기업은행</option>
									<option value="kb">국민은행</option>
									<option value="keb">외환은행</option>
									<option value="suhyup">수협은행</option>
									<option value="nonghyup">농협중앙회</option>
									<option value="shinhan">신한은행</option>
									<option value="woori">우리은행</option>
								</select>
								 입금자명 <input type="text" name="dname" class="inputHeight essential" style="width:150px;">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">* 현금영수증</th>
							<td class="left">
								<div style="margin-left:2px;">
									<select id="cash_receipt" name="cash_receipt" class="inputHeight" style="visibility: visible; width: 160px;">
										<option value="no" selected="selected">미발행</option>
										<option value="1">발행 - 개인소득공제용</option>
										<option value="2">발행 - 사업자지출증빙용</option>
									</select>
									<span id="cr_input">
										
									</span>
								</div>
							</td>
						</tr>
					<tr>
					<tr>
						<td colspan="2" style="border-width:1px 0 1px 0;">
							<ul style="padding:12px 15px 12px 25px; margin-top:10px;font-size:11px">
								<li style="color:red;">예약 접수 후 안내되는 전용 계좌로 24시간 이내에 상기 원화결제금액을 결제하여야만 예약이 진행됩니다. (미 입금 시 자동 취소)&nbsp;예약이 불가능할 때에는 전액 환불 됩니다.</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>렌트요금<br>(현지 통화결제)</th>
						<td>
							<div>
								<table>
									<colgroup>
									    <col width="*">
									    <col width="24%">
									    <col width="24%">
									    <col width="24%">
									</colgroup>
									<tbody>
								        <tr>
								            <td scope="col">차량명</td>
								            <td scope="col">차량렌트비</td>
								            <td scope="col">기타요금</td>
								            <td scope="col">합  계</td>
								        </tr>
								    </tbody>
								    <tbody>
								        <tr>
								        	<td>
								        		${requestScope.rentCar.name}
								        	</td>
									    	<td>
									    		${requestScope.rentCar.price}
									    	</td>
								            <td>0</td>
								            <td>
								            	<strong>${requestScope.rentCar.price * requestScope.diff}</strong>
								            	<input type="hidden" name="diff" value="${requestScope.diff}">
								            </td>
								        </tr>
								        <tr>
											<td colspan="5" style="border-width:1px 0 0 0; text-align:left">* 현재 표시되는 요금은 예상요금이며, 확정시 요금이 변동 될 수 있습니다. 예약이 확정 된 후 금액을 반드시 확인해 주세요.
										</td>
									 </tr>
								    </tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: top;">취소규정안내</th>
						<td class="left">
							<ul>
								<li style="margin-bottom:4px; color: red">결제 완료 후 예약 진행 중 변경사항이 발생한 경우 취급수수료가 다시 부과됩니다.</li>
								<li style="margin-bottom:4px; color: red">희망하신 차량 지정이 부득이 할 경우 동급 클래스 지정으로 예약됩니다. 이 사유로 변경/취소시 취급 수수료가 다시 발생합니다.</li>
								
								<li style="margin-bottom:4px;">영업손실보장 커버 및 차량 보험은 1회성이며, 사고가 나지 않더라도 환급되지 않습니다.</li>
								<li style="margin-bottom:4px; color: red">예약 취소시 최소 3일전까지 말씀해주셔야하며, 차량 픽업 3일 전 부터 당일까지 취소 건은 NOC 커버 환불이 되지 않습니다. (주말 제외)</li>
								
								<li style="margin-bottom:4px; color: red">예약 취소는 영업일 17:30 이전 취소접수를 당일 취소로 판단하며 그 이후 시간의 취소, 토, 일, 공휴일 취소는 익영업일 취소로 간주됩니다.</li>
								<li style="margin-bottom:4px;">렌터카 이용 도중에 미리 반납하셔도 차액만큼 환불되지 않습니다.</li>
								<li style="margin-bottom:4px; color: red">국제운전 면허증 미지참으로 인한 취소는 고객님 과실로 차량금액 100%가 수수료로 부과됩니다.</li>
								<li style="margin-bottom:4px;"><span style="color: red">픽업일 당일 취소시</span><strong>이미 결제한 금액과 현지에서 지불할 렌터카 금액의 전액이 취소수수료로 부과</strong>되며, 픽업일 1일전 취소시 <strong>차량금액의 50%</strong>가 취소수수료로 부과됩니다.</li>
								<li style="margin-bottom:4px;">고객이 지정한 픽업/반납 시간이 선택하신 점포의 영업시간에서 벗어나는 경우, 해당 점포 영업시간 내로 임의 변경되며, 이로 인한 변경/취소시 취급 수수료가 발생합니다.</li>
								<li>취소수수료 안내<br>
									<table style="width:300px;">
									<tbody><tr>
										<td style="font-size:11px;">픽업일 2일전 취소</td>
										<td style="font-size:11px;">차량금액의 30%</td>
									</tr>
									<tr>
										<td style="font-size:11px;">픽업일 1일전 취소</td>
										<td style="font-size:11px;">차량금액의 50%</td>
									</tr>
									<tr>
										<td style="font-size:11px;">픽업일 당일 취소</td>
										<td style="font-size:11px;">차량금액의 100%</td>
									</tr>
									</tbody></table>
								</li>
							</ul>
						</td>
					</tr>
				</table>
				<div>
					<label style="cursor:pointer;"><input type="checkbox" id="cancel"> 상기 취소규정을 확인하였으며, 이에 동의합니다.</label>
				</div>
				</div>
				</div>
				<div class="position button">
					<input type="button" class="btn btn-warning" id="book" value="예약완료">
					<input type="button" class="btn btn-default" id="book_cancel" value="예약취소">
				</div>
		</form>
			
		
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>