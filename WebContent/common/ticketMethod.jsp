<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${requestScope.mChecked == 'visit'}">
	<table>
		<tr>
			<th>방문지점</th>
			<td><select>
					<option selected="selected">선택</option>
					<option>서울본사</option>
					<option>부산지점</option>
			</select></td>
		</tr>
		<tr>
			<th>방문일자</th>
			<td><input type="date" name="sdate" id="sdate">
				<p>ⓘ 방문하실 일자를 선택해주세요.</p></td>
		</tr>
		<tr>
			<th>안내사항</th>
			<td>
				<ul>
					<li>접수 후 48시간 이내 미결제 또는 일부상품의 경우 당일 23:59까지 미결제(미입금)시 자동 취소
						되오니 주의하시기 바랍니다.</li>
					<li>평일 오후 3시(영업일 기준, 토/일/공휴일 제외)까지 입금 확인된 건에 한하여 다음날부터 방문수령
						가능합니다.</li>
					<li>주말 공휴일에는 방문수령이 불가하며, 평일 영업일에만 가능합니다.</li>
					<li>서울, 부산지점만 방문수령 가능합니다.</li>
					<li>- 서울/부산 방문시간 : 오전 9시~오후 8시</li>
					<li>- 대구 방문시간 : 오전 9시~오후 6시</li>
				</ul>
			</td>
		</tr>
	</table>
</c:if>

<c:if test="${requestScope.mChecked == 'airport'}">
	<table>
		<tr>
			<th>출국일자</th>

			<td><input type="date" name="sdate" id="sdate">
				<p>ⓘ 실제로 한국에서 출국하는 날짜를 기입해주세요. (출국 전까지 티켓 전송을 위한 날짜 확인 용도)</p></td>
		</tr>
		<tr>
			<th>수령시간</th>
			<td>출국 2시간 이전(명절 등 휴일의 경우 출국 3시간 이전)</td>
		</tr>
		<tr>
			<th>수령장소</th>
			<td>인천공항3층 1번출입구 A카운터-유리벽사이 어라운드무비테이블 [대한항공(KE), 진에어(LJ), 제주항공
				(7C)]</td>
		</tr>
		<tr>
			<th>안내사항</th>
			<td>
				<ul>
					<li>월요일~금요일(영업일 기준) 오후 1시까지 결제 완료된 건에 한하여 다음날 공항에서 수령
						가능합니다.(오후 1시까지 미결제 시 자동 취소 되오니 주의하시기 바랍니다.)</li>
					<li>토/일/월/공휴일 출국의 경우, 금요일(이전 영업일) 오후 1시까지 결제 완료 시 출국 당일 공항수령
						가능합니다.</li>
					<li>인천공항에서 수령하실 수령일(출국일자)을 정확하게 입력해 주시기 바랍니다.</li>
					<li>수령시간은 출국 2시간 이전으로 추천드립니다. (명절 등 휴일의 경우 출국 3시간 이전)</li>
					<li>결제 당일 및 토/일/공휴일 입금 시 다음날 공항에서 수령은 불가합니다.</li>
					<li>인천공항에서만 수령 가능합니다. (김포공항 및 기타 공항 수령 불가)</li>
				</ul>
			</td>
		</tr>
	</table>
</c:if>