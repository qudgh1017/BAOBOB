
	
var m_num;
var tot;

//======================== Detail Modal
function genderAgeRate(movie_num, total) {
   var url = "/uuplex/c-box/genderAgeRate";
   var method = "GET";
   var params = "movie_num=" + movie_num + "total=" + total;
   
   m_num = movie_num;
   tot = total;
   
   sendRequest(graphModal, url, method, params);
   
}



//======================== Write Modal Dialog
function graphModal() {
   var graph = document.getElementById("dialog");
   
   if(httpRequest.readyState == 4 ) {
      if(httpRequest.status == 200) {
         //응답 결과가 HTML이면 responseText로 받고, XML이면 resonseXML로 받는다
    	  graph.innerHTML = httpRequest.responseText;
    	  /*graph.innerHTML += '<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>';*/
    	  
    	  /* 
    	   * AJAX 데이터 호출
    	   */
    	  $.ajax({
  			type: 'GET',
  			url: '/uuplex/c-box/genderAgeRate_json?movie_num='+m_num+'&total='+tot,
  			async: false,
  			success: function(data) {
  				/*
  	    	   * 그래프 DATA, DRAW 호출
  	    	   */
  				console.dir(data);
  				google.charts.load('visualization', '1', {'packages':['corechart'], "callback": drawChart5(data)});
  				google.charts.load('visualization', '1', {'packages':['corechart'], "callback": drawChart6(data)});
  				

  			}
           });
    	  
    	  
         
      } else {
    	  graph.innerHTML = httpRequest.status + "에러 발생";
      }
   } else {
	   graph.innerHTML = "상태 : " + httpRequest.readyState;
   }
   
}

function drawChart5(data) {
	   
		var woman = data.gender*1;
		var man = data.total-data.gender*1;
		
	   //방법2
	   var chartData = new google.visualization.DataTable();
	   
	   chartData.addColumn('string','title');
	   chartData.addColumn('number','rate');
	   chartData.addRows([
			['여자',  woman],
			['남자',  man]
		]);
		
	   
	var options = {
		title : '성별 예매 분포',
		pieHole : 0.4,
		label: 'none',
		pieSliceText: 'none',
		
	};

	var chart = new google.visualization.PieChart(
			document.getElementById('donutchart5'));
	
	chart.draw(chartData, options);
	
	
}
function drawChart6(data) {
	 
	
   //Create the data table.
   var chartData = new google.visualization.DataTable();
   
   chartData.addColumn('string','연령');
   chartData.addColumn('number','비율');
   
   var dtos = data.age;
   var tot = data.total;
   

	   
   dtos.forEach(function(item){
	   
	   var rate2 = 0;
	   
	   if(item.num == 0){
		   rate2 = 0;
	   }else{
		   var rate1 = (item.num/tot)*100;
		   
		   if(rate1 == 100){
			   rate2 = rate1.toString().substr(0, 3); 
		   }else{
			   rate2 = rate1.toString().substr(0, 2); 
		   }
		   rate2=rate2*1;
	   }
	   
	   var row = [item.rng, rate2];
		chartData.addRow(row);
	});
   
	   
   
	   
	   
	   
   var view = new google.visualization.DataView(chartData);
   
   view.setColumns([0, 1,
                    { calc: "stringify",
                      sourceColumn: 1,
                      type: "string",
                      role: "annotation" }]);
   
   

   var options = {
     title: "연령별 예매분포",
     width: 400,
     height: 200,
     bar: {groupWidth: "95%"},
     legend: { position: "none" }
     
     
   };
   
   var chart = new google.visualization.ColumnChart(document.getElementById("donutchart6"));
   chart.draw(view, options);


}
