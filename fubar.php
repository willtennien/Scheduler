<!DOCTYPE html>

<html>
<head>
<title>Yes yes yall</title>
<script type="text/javascript">
<!--
var startTime, endTime, mouseIsDown, timesAvailable, currently_adding_not_subtracting, dragging;

mouseIsDown = 0; // this is vital
timesAvailable = Array();


// store 1st and last div ---


// from: http://stackoverflow.com/questions/322378/javascript-check-if-mouse-button-down
// I don't handle IE correctly yet.
document.onmousedown = function() { 
    mouseIsDown++;
    //alert("hi");
    //alert(mouseIsDown)
}
document.onmouseup = function() {
    dragging = false;
    mouseIsDown--;
    //alert(mouseIsDown);

}

function theMouseOver(i) {

    
    if (mouseIsDown) { 
//alert("down");
        if (currently_adding_not_subtracting) {
    	    document.getElementById(i).style.background = "#FF0000"; 
    	} else {
    		document.getElementById(i).style.background = "#FFFFFF"; 
    	}
    	timesAvailable[i] = currently_adding_not_subtracting;
    } else {
 //   	alert("up");
        document.getElementById(i).style.background="#FF00AA";
    }

}


function theMouseOut(i) {

    if (!mouseIsDown) { 
    	if (timesAvailable[i]) {
    	    document.getElementById(i).style.background="#FF0000";
        } else {
    	    document.getElementById(i).style.background="#FFFFFF"; 
    	}
    }

}

function theMouseDown(i) {
	// duplicating this. not sure if it's the right thing to do.
    //++mouseIsDown;
    
    if (timesAvailable[i] == true) { // this isn't a "!" because I want to handle the nil case
        currently_adding_not_subtracting = false;
        //timesAvailable[i] = false;
        document.getElementById(i).style.background="#FFFFFF";
    } else {
    	currently_adding_not_subtracting = true;
        //timesAvailable[i] = true;
        document.getElementById(i).style.background="#FF0000"; 
    }
    timesAvailable[i] = currently_adding_not_subtracting;
    startTime=i;
    // mouseIsDown = true;

}

function theMouseUp() {
	// duplicating this. not sure if it's the right thing to do.
	// --mouseIsDown;

	// mouseIsDown = false;
	//if (startTime==endTime) return false;


	larger=Math.max(startTime, endTime);
	smaller=Math.min(startTime, endTime);


	for(i=smaller;i<=larger;i++) {
		timesAvailable[i] = currently_adding_not_subtracting;
		if (currently_adding_not_subtracting) {
	        document.getElementById(i).style.background = "#FF0000";
	    } else {
	    	document.getElementById(i).style.background = "#FFFFFF";
	    }
	}
}
//-->
</script>
<style type="text/css">
<!--
body {
	-moz-user-select: none;
}
.slot {
	display: block;
	cursor:  default;
	width:   200px;
	font-size: 20px;
}
-->
</style>
</head>
<body ondragstart="return false;event.preventDefault();" onselectstart="return false;event.preventDefault();">
<?php for($i=5;$i<28;$i++) { // midnight end time doesn't have to be -- just start the morning at, say, 6, and end the night at, say, 3

//TODO: handle when the mouse goes past start or end times

	print '<div onmousedown="dragging=true; theMouseDown(' . $i . ')"'; //  // is 'dragging=true' necessary? -- well might have special significance, since it's not declared in 'var'
	print ' onmouseup="if(dragging){endTime=' . $i . ';theMouseUp(' . $i . ');dragging=false;}"'; // ;mouseIsDown--;
	print ' onmouseover="theMouseOver(' . $i . ')"';
	print ' onmouseout="theMouseOut(' . $i . ')"';
	print ' class="slot" id="' . $i . '">' . ($i % 24) . ':00</div>';
	print "\n";
// <div onmousedown="dragging=true;startTime=this.innerHTML" onmouseup="if(dragging){endTime=this.innerHTML;theMouseUp();dragging=false;}" class="slot" id="5">5am</div>
}
?>
<button onclick="alert(mouseIsDown); alert(dragging)">sdfkj</button>
<br />
<br />
<br />
<br />




Remember that if you commit to being available at these times, you might get assigned to any of them, and you'll kind of be screwing everyone else on the project if you aren't available.
</body>
</html>