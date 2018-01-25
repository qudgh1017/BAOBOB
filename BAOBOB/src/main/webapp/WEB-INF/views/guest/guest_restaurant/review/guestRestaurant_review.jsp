<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/mhj/setting.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
	<title>Baobob_Restaurant</title>
    
    <style type="text/css">
     	.head_header{position:relative;}
    	/* .head_screen{top: 0;left: 0;position: absolute;margin-left: 28.5rem;margin-top: 16rem;} */
    	.head_screen{top: 0; left: 0;position: absolute; margin-left: 45%; margin-top: 40%;} 
    	
    	section .notice_a{color:white;}
    	
    	.advertDiv{text-align:center;}
    	body .mainImg {height:600px;}
    	
    	@media (min-width: 992px){
			.head_screen{
			    max-width: 960px;
			}
		}
		@media (min-width: 768px){
			.head_screen{
			    max-width: 720px;
			}
		}
		@media (min-width: 576px){
			.head_screen{
			    max-width: 540px;
			}
		}
		
		
			
		
/*======= 별점 시작 =======*/

#divRateCnt {
   width: 130px;
   position: relative;
}

#divRareCnt, #divStarsCnt{
    height: 26px;
    background: url(http://s4.postimg.org/wi683zp2h/stars.png) 0 0px repeat-x;
}

#divRateCnt input{
    display: none;
}

#divRateCnt label{
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    height: 26px;
    width: 130px;
    cursor: pointer;
}
#divRateCnt:hover label{
    display: block;
}
#divRateCnt label:hover{
    background: url(http://s4.postimg.org/wi683zp2h/stars.png) 0 -52px repeat-x;
}

#divRateCnt label + input + label{width: 104px;}
#divRateCnt label + input + label + input + label{width: 78px;}
#divRateCnt label + input + label + input + label + input + label{width: 52px;}
#divRateCnt label + input + label + input + label + input + label + input + label{width: 26px;}

#divRateCnt input:checked + label{
    display: block;
    background: url(http://s4.postimg.org/wi683zp2h/stars.png) 0 -52px repeat-x;
}
	
/*======= 별점 종료 =======*/
</style>
<script src="${restaurant_js}"></script>
<!-- 
<script type="text/javascript">
var locked = 0;

function show(star){
	if(locked)  return;
	var i;
	var image;
	var el;
	var e=document.getElementById('startext');
	var stateMsg;
	
	for(i =1; i<= star; i++){
		image = 'image' + i;
		el =document.getElementById(image);
		el.src="/baobob/resources/images/mhj/choice/icon_starOn.gif";
	}
	
	switch(star){
	case 1:
		stateMsg = "불만족스러워요";
		/* alert('1'); */
		break;
	case 2:
		stateMsg = "별로에요";
		/* alert('2'); */
		break;
	case 3:
		stateMsg = "그러저럭";
		/* alert('3'); */
		break;
	case 4:
		stateMsg = "기대해도 좋아요";
		/* alert('4'); */
		break;
	case 5:
		stateMsg = "정말 좋아요! 추천!!";
		/* alert('5'); */
		break;
	default :
		stateMsg = "";
	}	
	e.innerHTML = stateMsg;	
}

function noshow(star){
	if(locked) return;

	var i;
	var image;
	var el;
	
	for (i = 1; i <= star; i++){
		image = 'image' + i;
		el = document.getElementById(image);
		el.src="/baobob/resources/images/mhj/choice/icon_starOff.gif";
	}
}
	
function lock(star){
	show(star);
	locked=1;
	/* alert("locked : " + locked); */
}

function mark(star){
	lock(star);
	alert('star : ' + star);

	document.reviewForm.star.value=star;
}


</script> -->
<title>레스토랑 메뉴</title>
</head>
<body>

	<!--======= Header 시작 =======-->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Baobob Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- 레스토랑 메뉴 -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp" %>
	
	<!--===== 식당1-사진 =====-->
	<%-- <header class="bg-primary text-white text-center head_header" style="background-color: #2c3e50!important;">
	<div class="head_screen"><!-- container -->
		<h1>Japanese Food</h1>
		<!-- <h2>Multiplex Baobob</h2> -->
	</div>
	<img class="img-fluid mb-5 d-block mx-auto mainImg" src="${projectRes}images/mhj/choice/jap_2.jpg" width="100%" height="100px">
	</header> --%>
	<!--======= Header 종료 =======-->
	
	
	<!--====== Container 시작 ======-->
	<!-- 리뷰 쓰기  -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					<c:if test="${restaurant_index==1}">
						<h3 align=left;>どきどきDokidoki</h3>
					</c:if>
					<c:if test="${restaurant_index==2}">
						<h3 align=left;>바압</h3>
					</c:if>
					<c:if test="${restaurant_index==3}">
						<h3 align=left;>BOUTBACK</h3>
					</c:if>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<br>
			
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<h3>리뷰 쓰기</h3>
					<hr style="border:2px solid black;">
					<form id="reviewForm" action="Restaurant_reviewWrite" method="POST">
						<input type="hidden" value="${restaurant_index}" name="restaurant_index">
						<table class="table table-bordered" border="1">
							<tr>
								<th style="text-align:center;">별점</th> 
								<td>
									<!-- 별점 시작 -->
									<div id="rating" align="center">
										<span>
											<img id="image1" onmouseover="show(1);" onclick="mark(1);" onmouseout="noshow(1);" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
											<img id="image2" onmouseover="show(2);" onclick="mark(2);" onmouseout="noshow(2);" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
											<img id="image3" onmouseover="show(3);" onclick="mark(3);" onmouseout="noshow(3);" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
											<img id="image4" onmouseover="show(4);" onclick="mark(4);" onmouseout="noshow(4);" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
											<img id="image5" onmouseover="show(5);" onclick="mark(5);" onmouseout="noshow(5);" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										</span>
										<br><span id="startext"></span>
									</div>
									<div id="spaceDiv"> 
									</div>
									<!-- 별점 종료 -->
									<!-- <input class="input" type="grade" value="" name="review_grade" style="width:50px" required/> -->
								</td>
							</tr>
							
							<tr>
								<th style="text-align:center;">글 내용</th> 
								<td>
									<textArea class="input" rows="10" cols="40" name="review_content" required></textArea>
								</td>
							</tr>
							<tr>
								<th colspan="2">
									<input class="button" type="submit" value="리뷰 올리기"> 
									<input class="button" type="reset" value="취소"> 
								</th>
							</tr>
						</table>	
					</form>
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
				<!-- 리뷰 보기 -->
				<!-- <div class="container"> -->
					<h2>리뷰</h2>
					<h5>리뷰 갯수: ${cnt}</h5>
					<hr style="border:2px solid black;">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-9">
							<c:if test="${cnt>0}">
								<c:forEach var="dto" items="${dtos}">
									<form id="reviewListForm">
										<table class="table table-bordered" border="1">
											<input type="hidden" value="${dto.review_index}" name="review_index">
											<tr>
												<th style="width:40px; text-align:center;"><span>Id</span></th> 
												<td style="width:200px;">
													${dto.member_id}
												</td>
												<td rowspan="4" style="width:20px; text-align:center; vertical-align:middle;">
													<input class="button" type="button" value="변경" onclick="guest_review_modify(${pageNum}, ${dto.review_index}, ${restaurant_index});"> 
													<br/><input class="button" type="button" value="삭제" onclick="guest_review_delete(${pageNum}, ${dto.review_index}, ${restaurant_index});"> 
												</td>
											</th>
											</tr>
											<tr>
												<th style="text-align:center;"><span>평점</span></th> 
												<td>${dto.review_grade}
													<c:if test="${dto.review_grade==1}">
													<span>
														<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
														<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
													</span>
										
													</c:if>
													<c:if test="${dto.review_grade==2}">
														<span>
															<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
															<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
															<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														</span>
													</c:if>
													<c:if test="${dto.review_grade==3}">
														<span>
															<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
															<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														</span>
													</c:if>
													<c:if test="${dto.review_grade==4}">
														<span>
															<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
														</span>
													</c:if>
													<c:if test="${dto.review_grade==5}">
														<span>
															<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
															<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
														</span>
													</c:if>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;"><span>내용</span></th> 
												<td>
													${dto.review_content}
												</td>
											</tr>
											<tr>
												<th style="text-align:center;"><span>날짜</span></th> 
												<td>
													<fmt:formatDate type="both" pattern="yyyy/MM:dd HH:mm" value="${dto.review_reg_date}"/>
												</td>
											</tr>
											<br>
										</table>	
									</form>
								</c:forEach>
							</c:if>
							
							<c:if test="${cnt==0}">
							메뉴가 없서요.
							</c:if>
										<!-- 페이지 컨트롤 -->
							<table style="width=100%; text-align:center;">
								<tr style="text-align:center;">
									<th>
									<c:if test="${cnt>0}">
										<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
										<c:if test="${startPage>pageBlock}">
											<a href="guestRestaurant_review?restaurant_index=${restaurant_index}">[◀◀]</a>
											<a href="guestRestaurant_review?restaurant_index=${restaurant_index}&pageNum=${startPage - pageBlock}">[◀]</a>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>
											<c:if test="${i!=currentPage}">
												<a href ="guestRestaurant_review?restaurant_index=${restaurant_index}&pageNum=${i}">[${i}]</a>
											</c:if>
										</c:forEach>
						
										<!-- 다음[▶] / 끝[▶▶] -->			
										<c:if test="${pageCount > endPage}">
											<a href="guestRestaurant_review?restaurant_index=${restaurant_index}&pageNum=${startPage + pageBlock}" >[▶]</a>
											<a href="guestRestaurant_review?restaurant_index=${restaurant_index}&pageNum=${pageCount}">[▶▶]</a>
										</c:if>
									</c:if>
									</th>
								</tr>
							</table>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
				
			</div>	
			<!--====== Container 종료 ======-->
			
		</div>
	</section>
	
	<!--======= Footer 시작 =======-->
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
	<!-- Footer -->
	<!--======= Footer 종료=======-->
</body>
</html>
	