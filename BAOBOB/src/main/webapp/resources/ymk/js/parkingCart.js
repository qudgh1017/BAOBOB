/**
 * Host Parking Cart
 */
function month() {
	sendRequest(month_callback, 'hostParkingChartMonth', 'GET', '');
}

function month_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var result = httpRequest.responseText;
			var arr = result.split(',');
			var rowI = arr[0].split('-');
			var rowO = arr[1].split('-');
			
		    google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(drawChart);
		    
		    function drawChart() {
				var data = google.visualization.arrayToDataTable([
					['월', '입차', '출차'],
					['1월', rowI[0]-0, rowO[0]-0],
					['2월', rowI[1]-0, rowO[1]-0],
					['3월', rowI[2]-0, rowO[2]-0],
					['4월', rowI[3]-0, rowO[3]-0],
					['5월', rowI[4]-0, rowO[4]-0],
					['6월', rowI[5]-0, rowO[5]-0],
					['7월', rowI[6]-0, rowO[6]-0],
					['8월', rowI[7]-0, rowO[7]-0],
					['9월', rowI[8]-0, rowO[8]-0],
					['10월', rowI[9]-0, rowO[9]-0],
					['11월', rowI[10]-0, rowO[10]-0],
					['12월', rowI[11]-0, rowO[11]-0]
				]);
		    	
		    	var options = {
		    			isStacked: true,
		    	        vAxis: {minValue: 0}
		    	};
		    	
		    	var chart = new google.visualization.AreaChart(document.getElementById('weekChart'));
		    	chart.draw(data, options);
		    	
		    	var btn = document.getElementById('chartChange');
		    	btn.innerHTML='요일별';
		    	btn.setAttribute('onclick','week();');
		    	document.getElementById('weekTitle').innerHTML = '올해 월별 입/출차수';
		    	document.getElementById('weekFooter').innerHTML = '올해 월별 입차, 출차 현황';
		    	
		    	console.log('완료');
		    } 
		}else {
	    	console.log('오류');
	    }
	}else {
    	console.log('에러 ' + httpRequest.readyState);
    }
}

