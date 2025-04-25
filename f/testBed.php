<?php
header('Content-Type: text/html; charset=utf-8');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Test Bed</title><style>
.row{padding:0;margin:0;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;outline:2px solid #000;margin:0;}
.descG4{font-size:.9em;width:17em;display:inline-block;font-weight:700;padding: 4.7px 0 6.3px 0;margin: 5px 5px 5px 0;}
.echk{cursor:pointer;position:relative;text-align:left;background:#0f0;background-color:#0f0;padding:0;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#0f0;background-color:#0f0;padding:0;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.descE,.descG4{font-size:.9em;width:17em;display:inline-block;font-weight:700;padding: 4.7px 0 6.3px 0;margin: 5px 5px 5px 0;}
.descE{background:#ff0;color:#000;background-color:#0f0;}
.descG4{background:#0ff;color:#000;background-color:#0f0;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:1.77em;height:1.77em;border:1px solid #eee;outline:2px solid #eee;display: inline-block;margin:1px;margin:5px 0 5px 5px;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
</style></head><body>
 
EOT;
$idg = 3346;
$ide = 1329;
$property = 10;
$check = true;

echo <<<EOT
<h2>this is it?</h2>

1202:10<br>
1329:10<br>
3092:30<br>
3376:30<br>




<div class="row">
  <div id="d1329" class="echk" title="1">
    <input type="checkbox"  id="c1329" class="chk" value="F339" name="E339" onclick="ck('1329')"  />
    <div id="dc1329" class="descE" onclick="clickit(1329)">
	  &#x2002;23&#x2002;F339 Crab, Alaskan King
	</div>
  </div>&#x2003;

  <div id="d3092" class="gchk" title="3">
    <input type="checkbox"  id="c3092" class="chk" value="F346" name="G346" onclick="ck('3092')"  />
    <div id="dc3092" class="descG4" onclick="clickit(3092)">&#x2002;23&#x2002;Squash, Summer/Yellow</div>
  </div>
</div>
<div id="exp">
  <div class="row">
    <div id="d1202" class="echk" title="1">
      <input type="checkbox"  id="c1202" class="chk" value="F339" name="E339" onclick="ck(1202)"/>
      <div id="dc1202" class="descE" onclick="clickit(1202)">&#x2002;23&#x2002;F339 Crab, Alaskan King</div>
    </div>&#x2003;
    <div id="d3376" class="gchk" title="3">
      <input type="checkbox"  id="c3376" class="chk" value="F346" name="G346" onclick="ck('3376')"  />
      <div id="dc3376" class="descG4" onclick="clickit(3376)">&#x2002;23&#x2002;Squash, Summer/Yellow</div>
    </div>&#x2003;
  </div>
</div>

<script>
var bg = {1:[false,true],10:[false,true],3:[false,true],30:[false,true]};console.log('bg');
var colors = {10:['#ff0'],30:['#0ff']};
var border = {10:['#ff0','#f00'],30:['#0ff','#f00']};
var checkBoxes = {1329:[10,null,null,false,false,false,false,false,false,false],3092:[30,null,null,false,false,false,false,false,false,false],3376:[30,null,null,false,false,false,false,false,false,false],1202:[10,null,null,false,false,false,false,false,false,false]};
console.log('checkBoxes, before init');
console.log(checkBoxes);
var c = null;
var d = null;
var p = null;
toggle = [];
toggle[true] = false;
toggle[false] = true;


//checkBoxes[id][1] object for border of checkbox (red when checked yellow when not
//checkBoxes[id][2] object for the actual input[checkbox]
//checkBoxes[id][3] object for checkbox text background

function ck(id){
  
  checkBoxes[id][4].checked = toggle[checkBoxes[id][2].checked];
  checkBoxes[id][1].style.background =  border[checkBoxes[id][0]][Number(checkBoxes[id][2].checked)];
}



//checkBoxes[id][1] object for border of checkbox (red when checked yellow when not
//checkBoxes[id][2] object for the actual input[checkbox]
//checkBoxes[id][3] object for checkbox text background


function init(){
  for (var id in checkBoxes){
	checkBoxes[id][1] = document.getElementById('d' + id);
	checkBoxes[id][1].style.background = colors[checkBoxes[id][0]];
	checkBoxes[id][2] = document.getElementById('c' + id);
	checkBoxes[id][2].checked = false;

	checkBoxes[id][3] = document.getElementById('dc' + id);
	checkBoxes[id][3].style.background = colors[checkBoxes[id][0]];
  }
}


function pck(id){
  var checked = foodPanels[id][1].checked;
  foodPanels[id][0].style.backgroundColor=bg[checked];
  foodPanels[id][3].style.backgroundColor=bg[checked];
  for (var r in Rated){
    Rated[r][0].style.backgroundColor=bg[false];
    Rated[r][1].checked=false;
    Rated[r][1].disabled=false;
    Rated[r][1].style.opacity=1;
  }
  for (var r in foodPanels){
    foodPanels[r][3].style.backgroundColor = '#006';
    foodPanels[r][0].style.backgroundColor = bg[false];
    foodPanels[r][1].checked = false;
  } 
  if(checked){
    foodPanels[id][3].style.backgroundColor = '#f00';
	pname.innerHTML = foodPanels[id][4];
	pigE.innerHTML = foodPanels[id][5];
	pigG4.innerHTML = foodPanels[id][6];
    for (var div=0; div<panelCodes[id].length; div++){
      Rated[panelCodes[id][div]][0].style.backgroundColor=bg[Rated[panelCodes[id][div]][0].title];
      Rated[panelCodes[id][div]][1].disabled=true;
	  Rated[panelCodes[id][div]][1].checked=true;
      Rated[panelCodes[id][div]][1].style.opacity=1;
	  Rated[panelCodes[id][div]][1].style.backgroundColor=bg[Rated[panelCodes[id][div]][0].title];
	  
    }

    var y=foods.offsetTop;
	window.scrollTo(0, y);
  }
  else{
	pname.innerHTML = '';
	pigE.innerHTML = '';
	pigG4.innerHTML = '';
  
  }
  foodPanels[id][1].checked=checked;
  foodPanels[id][0].style.backgroundColor=bg[checked];
}









 // for (var id in checkBoxes){
    //checkBoxes[id][1].style.backgroundColor = bg[checkBoxes[id][1][Number(false)]]; // colors checkbox 
    //console.log(bg[checkBoxes[id][1][Number(false)]]

    
 // }
  console.log('checkBoxes, after init');
  console.log(checkBoxes);




console.log('bg');
console.log(bg);
console.log('checkBoxes');
console.log(checkBoxes);




function clickit(id){
  if(!Rated[id][1].disabled){
    Rated[id][1].checked=toggle[Rated[id][1].checked];
    ck(id);
  }
}

window.onload = init;
</script></body></html>
EOT;
/*
this one works
function init(){                          THIS ONE WORKS 5/9/22
  for (var id in checkBoxes){
	d = document.getElementById('d' + id);
	d.style.background =  '#f0f';
	window.onload = init; =  d;
	console.log('d');
	console.log(d);
    document.getElementById('d' + id).style.background =  '#f0f';
    document.getElementById('d' + id).style.backgroundColor =  '#f0f';
  }
}





  for (var id in checkBoxes){
    //checkBoxes[id][1].style.backgroundColor = bg[checkBoxes[id][1][Number(false)]]; // colors checkbox 
    //console.log(bg[checkBoxes[id][1][Number(false)]]

    checkBoxes[id][1] =  document.getElementById('d' + id);
    checkBoxes[id][2] =  document.getElementById('c' + id);
  }
  console.log('checkBoxes, after init');
  console.log(checkBoxes);




  var i;
  for (var id in checkBoxes){ 
    document.getElementById('d' + id).style.backgroundColor =  '#f0f';
    document.getElementById('c' + id).style.backgroundColor =  '#f0f';


    checkBoxes[id][1].style.backgroundColor = bg[checkBoxes[id][1][Number(false)]]; // colors checkbox 
    console.log(bg[checkBoxes[id][1][Number(false)]]

    checkBoxes[id][1] =  document.getElementById('d' + id);
    checkBoxes[id][2] =  document.getElementById('c' + id);
  }
  console.log('checkBoxes, after init');
  console.log(checkBoxes);
}
function ck(id){
  checkBoxes[id][3] = toggle[checkBoxes[id][3]];
  checkBoxes[id][1].style.backgroundColor = bg[checkBoxes[id][3]];
}

function clickit(id){
  if(!Rated[id][1].disabled){
    Rated[id][1].checked=toggle[Rated[id][1].checked];
    ck(id);
  }
}

*/

?>
