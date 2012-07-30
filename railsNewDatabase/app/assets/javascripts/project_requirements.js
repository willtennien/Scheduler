var instrumentNames = [];
var counter = 0;
var defaultText = "Add Instrument";

function addEventSimple(obj,evt,fn) {
    if (obj.addEventListener)
        obj.addEventListener(evt,fn,false);
    else if (obj.attachEvent)
        obj.attachEvent('on'+evt,fn);
}

function pushInstrumentName(str) {
	instrumentNames.push(str);
}

function selectionDiv() {
	return document.getElementById('instrument_reqs_selection');
}

function AreUnusedSelectors() {
	var selectors = selectionDiv().children
	for (var i = 0; i < selectors.length; ++i) {
		var e = selectors[i];
		if ((e.tagName == "DIV") &&
			(e.children[1].value == defaultText)
			) {
			return true;
		}
	}
	return false;
}

function name2option(instr_name) {
	return '		<option value="'+instr_name+'">'+instr_name+'</option>';
}

function theSelectorElement(n) { return [ '      <a>x</a>', // This will definitely become an icon.
'      <select name="instrument_names[][name]" onchange="instrumentSelectionMade();">',
'		<option>'+defaultText+'</option>'].concat(
		instrumentNames.map(name2option)).concat(
['		</select>', //(How talented do they have to be?)',
'      Min: ',
'      <select name="instrument_names[][min]">',
'		<option selected>1</option>',
'		<option>2</option>',
'		<option>3</option>',
'      </select>',
'      Max: ',
'      <select name="instrument_names[][max]">',
'        <option>same</option>', 
'        <option>2</option>',
'        <option>3</option>',
'        <option selected>tons</option>',
'      </select>']
		).join("\n");
}

function appendDiv(name) {
	name = name || defaultText
    var newDiv = document.createElement('div');
    newDiv.id = "instrument_selector_"+counter;
    newDiv.innerHTML = theSelectorElement(selectionDiv().children.length); //the header <h3> accounts for an extra element.
   	newDiv.children[0].addEventListener("click",removeSelector(counter),false);
   	var options = newDiv.children[1].getElementsByTagName("option");
   	for (var i = 0; i < options.length; ++i) {
   		var option = options[i];
   		if (option.value == name) {
   			option.setAttribute("selected","");
   		}
   	}
   	selectionDiv().appendChild(newDiv);
   	++counter;
}

function instrumentSelectionMade() {
    if (!AreUnusedSelectors()) {
    	appendDiv();
	}
}

function removeSelector(id) {
	return function() {
		var selector = document.getElementById("instrument_selector_"+id);
		(selector.parentNode).removeChild(selector);
		if (!AreUnusedSelectors()) {
			appendDiv();
		}
	}
}

/*
'      <option>Strings (5 available)</option>',
'      <option>- - Violin (4 available)</option>',
'      <option>- - Viola (1 available)</option>',
'      <option value="Guitar">Guitar (1000 available)</option>',
'      <option>Cymbals (1 available)</option>',
'      <option>Vocals (15 available)</option>',
'      <option>- - Singing (5 available)</option>',
'      <option>- - Rapping (10 available)</option>',
'      <option>Didgerido (1 available)</option>',
'      <option>Mandolin (2 available)</option>',
'      <option>Bass (5 available)</option>',
*/
