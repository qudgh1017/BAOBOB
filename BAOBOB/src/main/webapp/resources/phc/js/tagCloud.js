window.onload = function() {
	try {
		TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: '#774444',
			 outlineColour: '#FA5A5C',
			 textHeight: 19,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.10
			});
	} catch(e) {
		// 문제가 생기면 숨긴다.
		document.getElementById('myCanvasContainer').style.display = 'none';
	}
};

function refrechWord() {
	try {
		TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 16,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.10
			});
	} catch(e) {
		// 문제가 생기면 숨긴다.
		document.getElementById('myCanvasContainer').style.display = 'none';
	}
}

function DblHelix(n, rx, ry, rz) {
	var a = Math.PI / n, i, j, p = [],
	z = rz * 2 / n;
	for(i = 0; i < n; ++i) {
		j = a * i;
		if(i % 2)
			j += Math.PI;
		p.push([rx * Math.cos(j),
			rz - z * i,
			ry * Math.sin(j)]);
	}
	return p;
}
