var counter = 1;

function theSelectorElement(n) { return [ '      <a href="">x</a>', // this one'll definitely be an icon
'      <select name="instrument_names[][name]" onchange="instrument_selection_made();">',
'        <option selected>Pick instrument</option>',
'      <option>Strings (5 available)</option>',
'      <option>- - Violin (4 available)</option>',
'      <option>- - Viola (1 available)</option>',
'      <option>Guitar (1000 available)</option>',
'      <option>Cymbals (1 available)</option>',
'      <option>Vocals (15 available)</option>',
'      <option>- - Singing (5 available)</option>',
'      <option>- - Rapping (10 available)</option>',
'      <option>Didgerido (1 available)</option>',
'      <option>Mandolin (2 available)</option>',
'      <option>Bass (5 available)</option>',
'      </select>', //(How talented do they have to be?)',
'      Min: ',
'      <select name="instrument_names[][min]">',
'        <option selected>1</option>',
'        <option>2</option>',
'        <option>3</option>',
'      </select>',
'      Max: ',
'      <select name="instrument_names[][max]">',
'        <option>same</option>', 
'        <option>2</option>',
'        <option>3</option>',
'        <option selected>tons</option>',
'      </select>'].join("\n");
}


function instrument_selection_made() {

      
  if (true) {

    // remove the option from all other selectors -- still validate for it tho

    var newdiv = document.createElement('div');

    newdiv.innerHTML = theSelectorElement();
    document.getElementById('someIsh').appendChild(newdiv);
    counter++;

  }

}