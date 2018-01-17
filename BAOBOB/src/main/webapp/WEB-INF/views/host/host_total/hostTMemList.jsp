<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="common/navigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="card-header">
			<i class="fa fa-table">
				Member List
			</i>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" id="dataTable" role="grid" style="width: 100%;">
								<tr role="row">
									<!-- 테이블 th -->
									<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 235.004px;">Name</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending"
										style="width: 351.004px;">Position</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 170.004px;">Phone</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 85.0039px;">Address</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Start date: activate to sort column ascending"
										style="width: 166.004px;">Email</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 136px;">Reg Date</th>
								</tr>
								
								<!-- 내용 -->
								<c:if test="${cnt > 0 }">
								<c:forEach var="dto" items="${dtos}">
								<tbody>
									<tr role="row" class="odd">
										<td class="sorting_1">
											<a href="hostTMemView?member_id=${dto.member_id}&pageNum=${pageNum}">
												${dto.member_id}
											</a>
										</td>
										<td>
											<c:choose>
												<c:when test="${dto.member_step eq 1}">
													종합 관리자
												</c:when>
												<c:when test="${dto.member_step eq 2}">
													영화관 관리자
												</c:when>
												<c:when test="${dto.member_step eq 3}">
													영화관 직원
												</c:when>
												<c:when test="${dto.member_step eq 4}">
													식당 총관리자
												</c:when>
												<c:when test="${dto.member_step eq 51}">
													한식당 관리자
												</c:when>
												<c:when test="${dto.member_step eq 52}">
													일식당 관리자
												</c:when>
												<c:when test="${dto.member_step eq 53}">
													양식당 관리자
												</c:when>
												<c:when test="${dto.member_step eq 61}">
													한식당 직원
												</c:when>
												<c:when test="${dto.member_step eq 62}">
													일식당 직원
												</c:when>
												<c:when test="${dto.member_step eq 63}">
													양식당 직원
												</c:when>
												<c:when test="${dto.member_step eq 7}">
													주차장 관리자
												</c:when>
												<c:when test="${dto.member_step eq 8}">
													비회원
												</c:when>
												<c:when test="${dto.member_step eq 9}">
													일반회원
												</c:when>
												<c:when test="${dto.member_step eq 10}">
													VIP
												</c:when>
												<c:when test="${dto.member_step eq 11}">
													VVIP
												</c:when>
												<c:when test="${dto.member_step eq 12}">
													SVIP
												</c:when>
												<c:when test="${dto.member_step eq 13}">
													미인증 회원
												</c:when>
												<c:otherwise>
													미존재 member_step
												</c:otherwise>
											</c:choose>
										</td>
										<td>${dto.member_tel}</td>
										<td>${dto.member_address}</td>
										<td>${dto.member_email}</td>
										<td>
											<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.member_reg_date}"/>
										</td>
									</tr>
								</tbody>
								</c:forEach>
								</c:if>
							</table>
							
						</div>
					</div>
					
					<div class="row">
						<!-- 페이징 컨트롤 -->
						<div class="col-sm-12 col-md-7">
							<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
								<ul class="pagination">
									<c:if test="${cnt > 0 }">
										<c:if test="${startPage > pageBlock }">
											<li class="paginate_button page-item previous">
												<a href="hostTMemList?pageNum=${startPage - pageBlock}"
												aria-controls="dataTable" class="page-link">&lsaquo;</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<li class="paginate_button page-item active"><a href="#"
													aria-controls="dataTable" data-dt-idx="1" tabindex="0"
													class="page-link">${i}</a></li>
											</c:if>
											<c:if test="${i != currentPage}">
												<li class="paginate_button page-item "><a href="hostTMemList?pageNum=${i}"
													aria-controls="dataTable" data-dt-idx="2" tabindex="0"
													class="page-link">${i}</a></li>
											</c:if>
										</c:forEach>
										<c:if test="${pageCount > endPage }">
											<li class="paginate_button page-item next">
												<a href="hostTMemList?pageNum=${startPage + pageBlock}" 
												aria-controls="dataTable" class="page-link">&rsaquo;</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="common/footer.jsp" %>
</body>
</html>