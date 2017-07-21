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
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<style type="text/css">
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

th {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
}

td {
	/* text-align: center; */
	padding: 10px 20px 10px 20px;
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
.btn{
	width: 150px;
	margin: 0 auto;
}

.button {
	text-align: center;
}

#innerTable{
	border-collapse: collapse;
	border-bottom: gray 1px solid;
	border-top: gray 1px solid;
	width: 500px;
	margin: 0 auto;
}
.indent {
	text-indent: 20px;
}

#innerTable tr:first-child{
	background-color: #f2f2f2
}

#bar{
	height: 30px;
	padding: 5px 20px;
	background-color: rgb(0,174,240);
	border-radius: 5px;
	width: 80px;
	float:left;
}

.inBar{
	margin : 0;
	color: white;
}

.info{
	height: 30px;
}

.input{
	border-bottom: 2px solid #e6e6e6;
	
}

.input > td{
	text-align: left;
}

.plane{
	width: 25px;
	height: 25px;
}

h4{
	font-weight: bold;
}

h5{
	margin: 0;
	font-weight: bold;
}

.left{
	height: 30px;
	padding: 8px;
	float:left;
}

.fInfo{
	color: rgb(0,174,240);
	font-weight: bold;
}
.formInfo{
	width: 1020px;
}

h3{
	margin: 0;
}
</style>
<script>
	$(function() {
		var aCheck = false;
		var eCheck = false;
		
		$("#agree").change(function() {
			if (this.checked) {
				aCheck = true;
			} else {
				aCheck = false;
			}
		});
		
		$(".essential").change(function() {
			eCheck = false;
			var dname=$("#dname").val();
			var bank=$("#bank").val();
			if (bank == "" || dname=="") {
				eCheck = false;
			} else {
				eCheck = true;
			}
		});
		
		var gCheck=false;
		
		$("#book").click(function() {
			
			if($(".gender").is(":checked")){
				gCheck=true;
			}else{
				gCheck=false;
			}
			
			if (aCheck == false) {
				alert("여행 약관에 체크 해 주세요.");
			}else if(gCheck==false){
				alert("탑승자 성별을 선택해주세요.");
			}else if($(".name").val()==""){
				alert("탑승자 이름을 입력해주세요.");
			}else if($(".engSeong").val()==""){
				alert("탑승자 영문 성을 입력해주세요.");
			}else if($(".engName").val()==""){
				alert("탑승자 영문 이름을 입력해주세요.");
			}else if(eCheck==false){
				alert("모든 필수 입력 사항을 입력 해주세요.");
			}else {
				document.frm.submit();
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
		
		$(".essential").change(function() {
			if ($(this).val() != "") {
				eCheck = true;
			} else {
				eCheck = false;
			}
		});
		
		$("#book_cancel").click(function() {
			location.href="./mainFlight.jsp";
		});
		
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 항공 > 항공권 예매
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">항공권 예매</p>
			</div>
		</div>
		
		<div class="position formInfo">
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
				<ul class="list_type1">
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
				<ul class="mt25">
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
				<ul class="mt25">
					<li>1. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 지장이 있다고 인정될 때</li>
					<li>2. 질병 기타 사유로 여행이 어렵다고 인정될 때</li>
					<li>3. 계약서에 명시한 최대행사인원이 초과되었을 때</li>
				</ul>

				<h3>제11조(여행요금)</h3>
				<ul class="mt25">
					<li>① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 희망여행은 당사자간 합의에 따릅니다.
						<ul class="mt25">
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
					<li class="mt25">② 여행자는 계약 체결 시 계약금(여행요금 중 10%이하 금액)을 당사에
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
						<ul class="mtb25">
							<li>1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한
								경우</li>
							<li>2. 천재지변, 전란, 정부의 명령, 운송,숙박기관 등의 파업,휴업 등으로 여행의 목적을 달성할 수
								없는 경우</li>
						</ul>
					</li>
					<li class="mt25">② 제1항의 여행조건 변경 및 제12조의 여행요금 변경으로 인하여 제11조제1항의
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
						<dl class="mt25">
							<dt>1. 여행자의 여행계약 해제 요청이 있는 경우 (고객 취소요청 시)</dt>
							<dd>- 여행출발일 30일전까지 통보시 : 계약금 환급</dd>
							<dd>- 여행출발일 20일전까지 요청 시(29~20) : 상품가격의 10% 배상</dd>
							<dd>- 여행출발일 10일전까지 요청 시(19~10) : 상품가격의 15% 배상</dd>
							<dd>- 여행출발일 8일 전까지 요청 시(9~8) : 상품가격의 20% 배상</dd>
							<dd>- 여행출발일 1일 전까지 요청 시(7~1) : 상품가격의 30% 배상</dd>
							<dd>- 여행출발 당일 취소 요청 시 : 상품가격 50% 배상</dd>
						</dl>
						<dl class="mt25">
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

					<li class="mt25">② 당사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는
						경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 여행계약을 해제할 수 있습니다.
						<dl class="mt25">
							<dt>1. 당사가 해제할 수 있는 경우</dt>
							<dd>가. 제13조제1항제1호 및 제2호사유의 경우</dd>
							<dd>나. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때</dd>
							<dd>다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우</dd>
							<dd>라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우</dd>
						</dl>

						<dl class="mt25">
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
		
		
		<form action="./flightBookSuccess.flight" name="frm" id="frm" method="post">
			<div class="position titleBox">
				<h3>항공권 정보</h3>
			</div>
			
			<div class="position info">
				<div id="bar">
					<c:if test="${aFlight!=null }">	<!-- 도착 비행기 리스트가 있으면 1 -->
						<h4 class="inBar">왕복</h4>
						<input type="hidden" class="check" value="1">
					</c:if>
					<c:if test="${aFlight==null}">
						<h4 class="inBar">편도</h4>
						<input type="hidden" class="check" value="0">
					</c:if>
				</div>
				
				<c:if test="${aFlight!=null }">
					<div class="left">
						<h5>${sdate} &nbsp;~ &nbsp;${ldate} &nbsp;&nbsp; / &nbsp;&nbsp;인원수 : <strong style="color:rgb(0,174,240);">${pnum}</strong>명</h5>
					</div>
				</c:if>
				
				<c:if test="${aFlight==null }">
					<div class="left">
						<h5>${sdate} &nbsp; / &nbsp;&nbsp;인원수 : <strong style="color:rgb(0,174,240);">${pnum}</strong>명</h5>
					</div>
				</c:if>
				
			</div>
			<div class="position">
				<h4><img src="../resources/img/paper-plane.png" class="plane">&nbsp;구간 1 : ${dLocation.region} - ${aLocation.region} </h4>
				<input type="hidden" name="gnum1" value="${dFlight.num}">
				<table>
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<td class="fInfo">편명</td>
						<td>
							${dFlight.name}
						</td>
					</tr>
					<tr>
						<td class="fInfo">항공사</td>
						<td>
							${dFlight.company}
						</td>
					</tr>
					<tr>
						<td class="fInfo">출발도시</td>
						<td>${dLocation.region}</td>
					</tr>				
					<tr>
						<td class="fInfo">도착도시</td>
						<td>
							${aLocation.region}
						</td>
					</tr>
					<tr>
						<td class="fInfo">출발시간</td>
						<td>${dFlight.dtime}</td>
					</tr>
					<tr>
						<td class="fInfo">도착시간</td>
						<td>${dFlight.atime}</td>
					</tr>
					<tr>
						<td class="fInfo">정규운임</td>
						<td>￦ ${dFlight.price}</td>
					</tr>
					<tr>
						<td class="fInfo">결제예정금액</td>
						<td>￦ ${dTotal}
						<input type="hidden" name="total1" value="${dTotal}"></td>
					</tr>
				</table>
				<br>
				<hr>
				<br>
				<c:if test="${aFlight!=null}">
				<input type="hidden" name="gnum2" value="${aFlight.num}">
				<h4><img src="../resources/img/paper-plane.png" class="plane">&nbsp;구간 2 : ${aLocation.region} - ${dLocation.region} </h4>
					<table>
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>
						<tr>
							<td class="fInfo">편명</td>
							<td>
								${aFlight.name}
							</td>
						</tr>
						<tr>
							<td class="fInfo">항공사</td>
							<td>
								${aFlight.company}
							</td>
						</tr>
						<tr>
							<td class="fInfo">출발도시</td>
							<td>${aLocation.region}</td>
						</tr>				
						<tr>
							<td class="fInfo">도착도시</td>
							<td>
								${dLocation.region}
							</td>
						</tr>
						<tr>
							<td class="fInfo">출발시간</td>
							<td>${aFlight.dtime}</td>
						</tr>
						<tr>
							<td class="fInfo">도착시간</td>
							<td>${aFlight.atime}</td>
						</tr>
						<tr>
							<td class="fInfo">정규운임</td>
							<td>￦ ${aFlight.price}</td>
						</tr>
						<tr>
							<td class="fInfo">결제예정금액</td>
							<td>￦ ${aTotal}
							<input type="hidden" name="total2" value="${aTotal}"></td>
						</tr>
					</table>
				<br>
				<hr>
				<br>
				</c:if>
			</div>
			<div class="position">
			<div class="position titleBox">
				<h3>탑승자 정보 입력</h3>
			</div>
				<hr>
				<input type="checkbox">&nbsp;회원 본인이 탑승하지 않는 경우 체크 해 주시기 바랍니다.
				<c:forEach begin="1" end="${pnum}" var="p">
					<table class="input">
						<tr>
							<td style="color:rgb(0,174,240);">> 승객 ${p}</td>
							<td>*한글성명&nbsp;&nbsp;<input type="text" class="name" name="name" placeholder="ex)홍길동">&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td></td><td>*성별&nbsp;&nbsp;<input type="radio" name="gender" class="gender" value="여자">&nbsp;여자&nbsp;<input type="radio" name="gender" class="gender" value="남자">&nbsp;남자&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td></td><td>*영문성&nbsp;&nbsp;<input type="text" class="engSeong" name="engSeong" placeholder="ex)HONG">
							&nbsp;&nbsp;*영문명&nbsp;&nbsp;<input type="text" class="engName" name="engName" placeholder="ex)GILDONG"></td>
						</tr>
					</table>
				</c:forEach>
				<hr>
				<br>
				<br>
				<input type="hidden" name="sdate" value="${sdate}">
				<input type="hidden" name="ldate" value="${ldate}">
				<input type="hidden" name="pnum" value="${pnum}">
			</div>
			<div class="position">
				<div class="position titleBox">
					<h3>결제 정보</h3>
				</div>
				<hr>
				<table>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>			
					<tr>
						<td scope="row">원화결제금액</td>
						<td>
							<span style="color: red;" class="price">￦${won}</span>
							<input type="hidden" name="won" id="won" value="${won}">
						</td>
					</tr>
					<tr>
						<td>*전용계좌발급</td>
						<td>
							<div style="margin-left:2px;">은행선택
								<select name="bank" class="essential" id="bank" style="width: 150px; height: 30px; visibility: visible;">
									<option value="" selected="selected">선택</option>
									<option value="ibk">기업은행</option>
									<option value="kb">국민은행</option>
									<option value="keb">외환은행</option>
									<option value="suhyup">수협은행</option>
									<option value="nonghyup">농협중앙회</option>
									<option value="shinhan">신한은행</option>
									<option value="woori">우리은행</option>
								</select>
								 입금자명 <input type="text" name="dname" class="essential" id="dname" style="width:150px;">
							</div>
						</td>
					</tr>
					<tr>
						<td scope="row">* 현금영수증</td>
							<td>
								<div style="margin-left:2px;">
									<select id="cash_receipt" name="cash_receipt" class="essential" style="visibility: visible; width: 160px; height: 30px;">
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
				</table>
			</div>
			<div class="position" style="border: 1px solid rgb(0,174,240); padding: 20px;">
				<table>
					<tr>
						<td><strong>총 결제 예정 금액</strong></td>
						<td><strong style="color: rgb(0,174,240); font-size: 23px;">￦${won}</strong></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
			<div class="position button">
				<input type="button" id="book" class="btn btn-warning" value="예약완료">
				<input type="button" id="book_cancel" class="btn btn-default" value="취소하기">
			</div>
		
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>