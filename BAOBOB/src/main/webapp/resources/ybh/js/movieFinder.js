

$(document).ready(function() {
    //장르 전체 체크박스 클릭
    $("#checkall_janre").click(function(){
        //클릭되었으면
        if($("#checkall_janre").prop("checked")){
            //input태그의 name이 movie_janre인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_janre]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_janre인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_janre]").prop("checked",false);
        }
    });
    
 	//제작국가 전체 체크박스 클릭
    $("#checkall_country").click(function(){
        //클릭되었으면
        if($("#checkall_country").prop("checked")){
            //input태그의 name이 movie_country인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_country]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_country인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_country]").prop("checked",false);
        }
    });
    
 	//나이 전체 체크박스 클릭
    $("#checkall_age").click(function(){
        //클릭되었으면
        if($("#checkall_age").prop("checked")){
            //input태그의 name이 movie_age인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_age]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_age인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_age]").prop("checked",false);
        }
    });
 	
 	//search버튼 눌렀을때
    $('#search_btn').click(function() {
    	searchResultPage(1); //1페이지 실행
	});	
});

//무비파인더 결과 페이징 처리를 위한 AJAX
function searchResultPage(page){
	var keyword = document.getElementById("keyword").value;
	if(document.getElementById("keyword").value ==''){
		keyword = '';
	}
	var sel = document.getElementById("select").value;
	//movie_janre이름을 가진 것 중 체크된 것만 값 가져오기
   var size = document.getElementsByName("movie_janre").length;
   var movie_janre = new Array();
   for(var i = 0; i < size; i++){
      if(document.getElementsByName("movie_janre")[i].checked == true){
   		movie_janre[i] = document.getElementsByName("movie_janre")[i].value;
 	  }else{
 		 movie_janre[i] = -1;
 	  }
   	}
 	//movie_country이름을 가진 것 중 체크된 것만 값 가져오기
	var movie_country = new Array();
 	size = document.getElementsByName("movie_country").length;
	for(var i = 0; i < size; i++){
		if(document.getElementsByName("movie_country")[i].checked == true){
			movie_country[i] = document.getElementsByName("movie_country")[i].value;
		}else{
			movie_country[i] = '';
		}
	}
 //movie_age이름을 가진 것 중 체크된 것만 값 가져오기
   var movie_age = new Array();
   size = document.getElementsByName("movie_age").length;
	for(var i = 0; i < size; i++){
		if(document.getElementsByName("movie_age")[i].checked == true){
			movie_age[i] = document.getElementsByName("movie_age")[i].value;
		}else{
			movie_age[i] = -1;
		}
	}
	$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
	$.ajax({
		//GET방식의 URL
		url : 'searchResult?pageNum=' + page,
		type : 'GET',
		data: {//keyword 검색할 keyword, sel:분류 선택
			keyword, sel, movie_janre, movie_country, movie_age
		},
		success : function(msg) {
			$('#result').html(msg);  
		},
		error : function() {
			alert("error");
		}
	});
}