<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/mhj/setting.jsp"%>

<html>
<head>
<title>Baobob_Restaurant</title>

<style type="text/css">
	.head_header {
		position: relative;
	}
	
	.head_screen {
		top: 0;
		left: 0;
		position: absolute;
		margin-left: 45%;
		margin-top: 40%;
	}
	
	section .notice_a {
		color: white;
	}
	
	.advertDiv {
		text-align: center;
	}
	
	@media ( min-width : 992px) {
		.head_screen {
			max-width: 960px;
		}
	}
	
	@media ( min-width : 768px) {
		.head_screen {
			max-width: 720px;
		}
	}
	
	@media ( min-width : 576px) {
		.head_screen {
			max-width: 540px;
		}
	}

/*=====  메뉴 스타일  =====*/
/* 상위 div */
	.area-meals {
		width: 100%;
		margin-left: -20px;
		overflow: hidden;
	}
/* 상세 정보 포함하는 div */
/* 글이 길어질 때 줄바꿈을 어떻게 할지 지정하는 속성 normal;말고 word-break:break-word or break-all*/
	.area-meals .box-meals {
		position: relative;
		word-break: break-word;
		float: left;
		width: 400px;
		height: 180px;
		min-height: 180px; 
		margin-top: 10px;
		padding: 20px 25px 20px 235px;
		border: 1px solid #bee1dd;
		margin-left: 20px;
		box-sizing: border-box;
	}

/* 글이 길어질 때 줄바꿈을 어떻게 할지 지정하는 속성 normal;말고 word-

break:break-word or break-all*/

/* 
.area-meals .box-meals {
	position: relative;
	word-break: break-word;
	float: left;
	width: 480px;
	min-height: 220px;
	margin-top: 10px;
	padding: 20px 25px 20px 270px;
	border: 1px solid #bee1dd;
	margin-left: 20px;
	box-sizing: border-box;
} */
/* 이미지 스타일 */
	.area-meals .box-meals .img_meals {
		position: absolute;
		top: 19px;
		left: 20px;
		width: 192px; 
		height: 140px;
	}
	/* width: 130px;
		height: 130px; */
/* 메뉴이름 */
	.area-meals .box-meals .h6 {
	    margin-bottom: 0px;
		font-weight: bold;
		font-size: 16px;
		line-height: 20px;
		color: #000;
	}
/* 내용 */
	.area-meals .box-meals .txt-info.type-2 {
		margin-top: 3px;
		font-size: 13px;
		line-height: 18px;
		color: #000;
	}
/* 가격 */
	.area-meals .box-meals .txt-info.type-1 {
		margin-top: 10px;
		font-size: 12px;
		line-height: 18px;
		color: #e21b72;
	}

	.area-meals .box-meals .txt-info.type-1 strong {
		color: #e21b72;
	}
</style>
<title>레스토랑 메뉴</title>
</head>
<body>

	<!--======= Header 시작 =======-->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp"%>
	<!-- Baobob Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp"%>

	<!-- 레스토랑 메뉴 -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp"%>

	<section>
		<div class="container">
			<c:if test="${restaurant_index==1}">
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3>どきどき Dokidoki</h3>
						<hr style="border: 2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<c:if test="${restaurant_index==2}">
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3>바오밥</h3>
						<hr style="border: 2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<c:if test="${restaurant_index==3}">
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3>BOUTBACK</h3>
						<hr style="border: 2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<!--====== Container 시작 ======-->
					<h4>메뉴 ${cnt}]</h4>
					<hr style="border: 2px solid black;">
					<c:if test="${cnt>0}">
						<div class="row area-meals">
							<c:forEach var="dto" items="${dtos}" varStatus="status">
								<div class="col-md-6">
									<div class="box-meals clear_fix" align="left">
										<p class="img_meals">
											<img style="width: 192px; height: 140px;" src="${restaurant_images}${dto.restaurant_menu_img}">
										</p>
										<h6 style="margin-bottom:0px;">${dto.restaurant_menu_name}</h6>
										<strong class="txt-info type-1"> [ ${dto.restaurant_menu_price}원]</strong>
										<p class="txt-info type-2">${dto.restaurant_menu_content}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>

					<c:if test="${cnt==0}">
						메뉴가 없서요.
					</c:if>
					<!--====== Container 종료 ======-->
				</div>
				<div class="col-md-offset-1"></div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurant_footer.jsp" %> 
	<!-- Footer -->
</body>
</html>