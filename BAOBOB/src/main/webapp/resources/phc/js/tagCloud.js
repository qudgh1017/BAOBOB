window.onload = function() {
	try {
		/*TagCanvas.Start('myCanvas','tags',{
			textColour: '#ff0000',
			outlineColour: '#ff00ff',
			textHeight: 25,
			reverse: true,
			depth: 0.5,
			maxSpeed: 0.08
		});*/
		TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 25,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.10
			});
	} catch(e) {
		// something went wrong, hide the canvas container
		document.getElementById('myCanvasContainer').style.display = 'none';
	}
};



function refrechWord() {
	try {
		TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 25,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.10
			});
		/*TagCanvas.Start('myCanvas','tags',{
			textColour: '#ff0000',
			outlineColour: '#ff00ff',
			reverse: true,
			depth: 0.5,
			maxSpeed: 0.08
		});*/
	/*	TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 25,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.08
			});*/
		/*TagCanvas.Start('myCanvas','tags', {
//			 shape: 'vcylinder',
//			shape: "DblHelix",
			shape: "sphere",
//			shape: "hcylinder",
			 textFont: null,
			 textColour: null,
			 weight: true,
			});*/
	/*	TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 25,
			  more options 
			});*/
	} catch(e) {
		// something went wrong, hide the canvas container
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
