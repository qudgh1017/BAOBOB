/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/
var starRating = function(){
var $star = $("rating"),
    //$result = $star.find("output");
	$result = $star.find("output");
	
  	$(document).on("focusin", ".star-input>.input", function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    //.on("change", ".rating :radio", function(){
	.on("change", ".star-input :radio", function(){
    	//$result.text($(this).next().text());
    	$('#outText').text($(this).next().text());
  	})
    //.on("mouseover", ".rating label", function(){
    	
    .on("mouseover", ".star-input label", function(){
//    	$result.text($(this).text());
//    	$result.text('aa');
    	$('#outText').text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){1
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		//$result.text("평점을 입력해주세요!");
     	 		$('#outText').text("평점을 입력해주세요!");
   		 	} else {
     	 		//$result.text($checked.next().text());
     	 		$('#outText').text($checked.next().text());
    		}
  	});
};

starRating();

