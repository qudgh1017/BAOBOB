/**
 * Host Parking State
 */
stateTypeImg = '';
function parkingStatus(col, row, states) {
	var state = states.split(',');
	
	var space = '';
	for(var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for(x = 0; x < col; x += 1) {
			var location = col + '-' + row;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;
			
			var idx = x + y * col;
			spaceStateType(state[idx]);
			
			space += '<button class="p_spaceBtn p_btn" '
					+ 'id="' + btnId +'" '
					+ 'value="' + state[idx] + '">'
						+ '<img class="p_img space_img" '
						+ 'id="' + imgId + '" '
						+ 'src="/baobob/resources/images/ymk/host_parking/' + stateTypeImg + '">' 
					+ '</button>';
			
			console.log(state[idx]);
		}
		space += '</div>';
	}
	
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
}

function spaceStateType(type) {
	switch(type) {
	case '0': stateTypeImg = 'icon_true.png'; break;
	case '1': stateTypeImg = 'icon_false.png'; break;
	}
}
