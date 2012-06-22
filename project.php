<html>
  <head>
    <title>Create/Edit project</title>
    <script type="text/javascript">
    <!--

    var counter = 1;

    function theSelectorElement(n) { return [ '      <a href="">x</a>', // this one'll definitely be an icon
'      <select name="instruments' + n + '" onchange="instrument_selection_made();">',
'        <option selected>Pick instrument</option>',
'    	 <option>Strings (5 available)</option>',
'    	 <option>- - Violin (4 available)</option>',
'    	 <option>- - Viola (1 available)</option>',
'    	 <option>Guitar (1000 available)</option>',
'    	 <option>Cymbals (1 available)</option>',
'    	 <option>Vocals (15 available)</option>',
'    	 <option>- - Singing (5 available)</option>',
'    	 <option>- - Rapping (10 available)</option>',
'    	 <option>Didgerido (1 available)</option>',
'    	 <option>Mandolin (2 available)</option>',
'    	 <option>Bass (5 available)</option>',
'      </select>', //(How talented do they have to be?)',
'      Min: ',
'      <select name="numOfInstrumentsMin">',
'        <option selected>1</option>',
'        <option>2</option>',
'        <option>3</option>',
'      </select>',
'      Max: ',
'      <select name="numOfInstrumentsMax">',
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


    //-->
    </script>

  </head>

  <body>


    <h2> Create a Project </h2>

    <h3>Tell us about your demo:</h3>
    <textarea rows=7 cols=50></textarea> <br /><br />

    <div id="someIsh">
      <h3>What instruments do you want on your demo?</h3>
    </div>

    <script type="text/javascript">instrument_selection_made();</script>

    <br /><br />


    <h3>Recording Environment:</h3>
    <select name="recording_environment">
      <option>Totally soundproof</option>
      <option>Silence!!!</option>
      <option>I don't want to hear people talking on my recordings</option>
      <option selected>Could be the front lawn - I don't care (make sure you don't get kicked out)</option>
    </select>

    <br /><br />

    <h3>How long will it take?</h3>
    From start to finish! Be realistic. If you say 3 hours, people might have to leave right at the end of 3 hours.<br />
    <?php // (This'll be better as a slider - look into jquery ones)<br /> ?>
    <select>
      <option>1 hour</option>
      <option>2 hours</option>
      <option>3 hours</option>
      <option selected>4 hours</option>
      <option>5 hours</option>
      <option>6 hours</option>
      <option>7 hours</option>
      <option>8 hours</option>
      <option>more</option>
    </select>

    <br /><br />

    <input type="submit">



  </body>
</html>