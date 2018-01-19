<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body>
	<form name="orderForm" action="hostOrderAddPro" method="POST">
		<input type="hidden" name="restaurant_schedule_index" value="${restaurant_schedule_index}">
		<div style="text-align: center; height: 100%; overflow:scroll;">
			<table style="display: inline-block; padding: 15px; height: 100%;">
				<c:if test="${cnt_menu > 0}">
					<tr>
						<td><hr></td>
					</tr>
					<tr>
					<tr>
						<td style="text-align: center;">
							<span><b style="font-size: 18px;">[ 예약 테이블 ]</b></span>
						</td>
					</tr>
					<c:forEach var="dto" items="${use_tables}">
						<tr>
							<td style="text-align: center;">
								<span>${dto}번 테이블</span>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><hr></td>
					</tr>
				</c:if>
				<c:if test="${cnt_menu == 0}">
					<tr>
						<td colspan="3" style="text-align: center;">등록된 메뉴가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${use_table_cnt > 0}">
					<tr>
						<td style="text-align: center;">
							<span><b style="font-size: 18px;">[ 메뉴 ]</b></span>
						</td>
					</tr>
					<c:forEach var="dto" items="${dtos_menu}" varStatus="status">
						<tr>
							<td>
								<span>[${status.index + 1}.${dto.restaurant_menu_name}] - </span>
								<span style="font-size: 12px; color: gray">${dto.restaurant_menu_price}원</span><br>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><hr></td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<input class="form-control" name="table_index" type="text" placeholder="테이블 번호" required>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<input class="form-control" name="menu_index" type="text" placeholder="메뉴 번호" required>
						</td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<input class="btn btn-primary" style="background-color: #007bff; color: white; border: 1px solid #007bff;" type="submit" value="메뉴 추가" />
						</td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
				</c:if>
				<c:if test="${use_table_cnt == 0}">
					<tr>
						<td colspan="3" style="text-align: center;">사용중인 테이블이 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
	</form>
</body>
</html>