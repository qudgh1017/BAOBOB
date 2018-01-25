<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${restaurant_js}"></script>
<html>
<body>
	<form name="orderForm" action="hostOrderAddPro" method="POST">
		<input type="hidden" id="restaurant_schedule_index" name="restaurant_schedule_index" value="${restaurant_schedule_index}">
		<div style="text-align: center; height: 100%; overflow:scroll;">
			<table style="display: inline-block; padding: 15px; height: 100%;">
				<tr>
					<td><hr></td>
				</tr>
				<tr>
				<tr>
					<td style="text-align: center;">
						<span><b style="font-size: 18px;">[ 예약 테이블 ]</b></span>
					</td>
				</tr>
				<c:if test="${use_table_cnt > 0}">
					<c:forEach var="dto" items="${use_tables}" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<span>${dto}번 테이블</span><br>
								<span style="font-size: 12px; color: gray">- ${bill[status.index]}원</span><br>
								<input type="hidden" id="payValue${dto}" value="${bill[status.index]}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${use_table_cnt == 0}">
					<tr>
						<td colspan="3" style="text-align: center;">사용중인 테이블이 없습니다.</td>
					</tr>
				</c:if>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<span><b style="font-size: 18px;">[ 메뉴 ]</b></span>
					</td>
				</tr>
				<c:if test="${cnt_menu > 0}">
					<c:forEach var="dto" items="${dtos_menu}" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<span>${status.index + 1}.${dto.restaurant_menu_name}</span><br>
								<span style="font-size: 12px; color: gray">- ${dto.restaurant_menu_price}원</span><br>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${cnt_menu == 0}">
					<tr>
						<td colspan="3" style="text-align: center;">등록된 메뉴가 없습니다.</td>
					</tr>
				</c:if>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<span><b style="font-size: 18px;">[ 주문 ]</b></span>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="table_index" name="table_index" type="text" placeholder="테이블 번호" required>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="menu_index" name="menu_index" type="text" placeholder="메뉴 번호" required>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="menu_count" name="menu_count" type="text" placeholder="수량" required>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="btn btn-primary" style="background-color: #007bff; margin-top: 15px; color: white; border: 1px solid #007bff;" type="submit" value="주문" />
						<input class="btn btn-primary" style="background-color: #343a40; margin-top: 15px; color: white; border: 1px solid #343a40;" type="button" value="삭제" onclick="orderDel()"/>
					</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<span><b style="font-size: 18px;">[ 결제 ]</b></span>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="table_number" name="table_number" type="text" placeholder="테이블 번호">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="member_id" name="member_id" type="text" placeholder="결제 아이디">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="form-control" id="point" name="point" type="text" placeholder="포인트 사용">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="btn btn-primary" onclick="payment()" style="background-color: #007bff; margin-top: 15px; color: white; border: 1px solid #007bff;" type="button" value="결제" />
					</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
