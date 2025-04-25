<?php
header('Content-Type: text/html');
$to = 'patrick.young@patrick-young.com';
$subject = 'SVG in HTML Email';
$headers = "From: patrick.young@patrick-young.com\nReply-To: patrick.young@patrick-young.com\nMIME-Version: 1.0\r\nContent-Type: text/html;\r\n";
$message = <<< EOT
<html><head><style>body{font-weight:700;}</style></head><body><h2>SVG in HTML Email</h2>
<svg id="db" class="oval" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1200" height="1200" viewBox="0 0 1500 1500">
<style type="text/css">
.num{fill: #fff; font: 700 3em Arial,sans-serif;text-anchor:middle; }
.desc{fill: #fff; font: 700 1.5em Arial,sans-serif;text-anchor:middle; }
.recomend{fill: #8f0; font: 700 2em Arial,sans-serif;text-anchor:middle; }
.head{fill: #fff; font: 700 2.5em Arial,sans-serif;text-anchor:middle; }
.pollen{fill: #fff; font: 700 1.2em Arial,sans-serif; }
.title{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.value{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.month{fill: #fff; font: 400 1.2em Arial,sans-serif;text-anchor:middle;}
.txt{fill: #fff; font: 400 1em Arial,sans-serif;text-anchor:middle; }
.emp{fill: #0bf; font: 700 1.2em Arial,sans-serif;text-anchor:middle; }
.txtstart{text-anchor:start;}
.txtmiddle{text-anchor:middle;}
.txtend{text-anchor:end;}
</style>
<defs>
<ellipse id="moval" rx="300" ry="150" fill="#111"></ellipse>
<ellipse id="ioval" rx="205" ry="205" fill="#111"></ellipse>
<ellipse id="bgOval" rx="600" ry="320" fill="#659CD7"></ellipse>

<g id="more">
	 <circle style="fill:#111;stroke:#0bf;stroke-width:2px;" cx="0" cy="0" r="11"></circle>
<text class="head" x="0" y="6" style="fill:#0bf;  font:400 1em serif; ">i</text>
</g>
<g id="oval">
  <ellipse rx="100" ry="90" fill="#111"></ellipse>
  <use x="0" y="55" xlink:href="#more"></use>
  </g>
</defs>
<rect x="0" y="672" height="500" width="1500" rx="55" ry="35" fill="#659CD7"></rect>
<use x="750" y="825" xlink:href="#moval"></use>
<use id="topoval" x="750" y="320" xlink:href="#bgOval"></use>

<use x="210" y="900" xlink:href="#ioval"></use>
<text class="head" x="210" y="880">Family History</text>
<text class="txt" x="210" y="920">Odds that a child, with two </text>
<text class="txt" x="210" y="940">allergic parents, will develop allergies: </text>
<text class="num" x="210" y="1020">65%</text>
<text class="txt" x="210" y="1080"></text>

<use x="1290" y="900" xlink:href="#ioval"></use>
<text class="head" x="500" y="750"></text>
<text class="desc" x="1290" y="775"></text>
<text class="head" x="750" y="780">Symptoms by Category</text>
<text class="title" x="630" y="835">Foods: </text> <text x="790" y="830" class="num"> 0</text>
<use x="600" y="825" xlink:href="#more" onmousedown="show('ftxt')" ;="" onmouseup="disappear('ftxt')" onmouseout="disappear('ftxt')"></use>
<text class="title" x="630" y="875">Inhalants: </text> <text x="790" y="885" class="num"> 0</text>
<use x="600" y="865" xlink:href="#more" onmousedown="show('itxt')" ;="" onmouseup="disappear('itxt')" onmouseout="disappear('itxt')"></use>
<text class="title" x="630" y="915">Both: </text> <text x="790" y="930" class="num"> 6</text>
<use x="600" y="905" xlink:href="#more" onmousedown="show('btxt')" ;="" onmouseup="disappear('btxt')" onmouseout="disappear('btxt')"></use>

<text class="recomend" x="1290" y="840">Recommendations</text>
<text class="title" x="1180" y="890">Test Inhalants: </text> <text x="1360" y="890" class="value"> Yes</text>
<text class="title" x="1180" y="930">Test Animals: </text> <text x="1360" y="930" class="value"> Yes</text>
<text class="title" x="1180" y="970">Test Foods: </text> <text x="1360" y="970" class="value"> Yes</text>

<g transform="translate(170,830)scale(.2,-.2)" fill="#fff">
<circle cx="114.141" cy="421.263" r="36.305"></circle><path d="m 109.114,154.839 0,-126.2304 c -0.19,-22.93453 -34.3281,-22.93453 -34.6296,0 l 0,126.2304 -44.6836,0 48.0349,168.679 -7.8198,0 -27.927,-96.069 C 35.0288,206.202 6.29761,214.804 13.0444,237.503 L 44.323,341.392 c 3.5969,11.93 18.6331,32.997 44.6836,33.512 l 50.2694,0 c 25.3,-0.515 40.398,-21.761 44.683,-33.512 l 42.15062,-107.36792 c 6.345,-22.587 -22.159,-31.859 -29.045,-10.054 L 158.266,323.518 l -8.937,0 49.152,-168.679 -45.8,0 0,-126.2304 c 0.357,-22.93453 -33.647,-22.82198 -33.513,0 l 0,126.2304 z"></path>
<circle cx="320.524" cy="430.731" r="37.2365"></circle><path d="m 407,219 0,115 c 0,24 -19,49 -48,49 l -74,0 c -24,0 -34,-13 -43,-40 L 197.86784,232.69541 c -7,-21 23,-31 30,-10 L 270,325 l 4,0 0,-291 c 0,-31 43,-30 43,0 l 0,169 6,0 0,-169 c 1,-30 44,-31 44,0 l 0,291 8,0 0,-106 c 0,-22 32,-22 32,0 z"></path>
</g>
<use x="350" y="220" xlink:href="#oval" onmousedown="show('rtxt')" ;="" onmouseup="disappear('rtxt')" onmouseout="disappear('rtxt')"></use>
<text class="desc" x="350" y="240">Respiratory</text>
<text class="num" x="350" y="210">3</text>

<use x="540" y="140" xlink:href="#oval" onmousedown="show('htxt')" ;="" onmouseup="disappear('htxt')" onmouseout="disappear('htxt')"></use>
<text class="desc" x="540" y="160">Head</text>
<text class="num" x="540" y="130">3</text>

<use x="750" y="110" xlink:href="#oval" onmousedown="show('dtxt')" ;="" onmouseup="disappear('dtxt')" onmouseout="disappear('dtxt')"></use>
<text class="desc" x="750" y="130">Digestive</text>
<text class="num" x="750" y="100">0</text>

<use x="960" y="140" xlink:href="#oval" onmousedown="show('stxt')" ;="" onmouseup="disappear('stxt')" onmouseout="disappear('stxt')"></use>
<text class="desc" x="960" y="170">Skin</text>
<text class="num" x="960" y="130">0</text>

<use x="1150" y="220" xlink:href="#oval" onmousedown="show('wtxt')" ;="" onmouseup="disappear('wtxt')" onmouseout="disappear('wtxt')"></use>

<text class="desc" x="1150" y="240">Whole Body</text>
<text class="num" x="1150" y="200">0</text>

<rect id="totalsym" x="450" y="255" width="600" height="70" rx="35" ry="20" fill="#111"></rect>
<text x="750" y="305"><tspan class="head">Total Symptoms:</tspan><tspan class="num"> 6</tspan></text>

<rect x="500" y="1010" width="500" height="150" fill="#111" rx="50" ry="25"></rect>

<g transform="translate(910,1010) scale(.15)">
  <path style="fill:#fff;stroke:#fff;" d="m151.35 307.2h113c0-16.06-1.15-19.25-27.75-19.25 4.25-12.75 21.52-43.59 31.12-43.59 8.5 0 18.63 0.47 18.63 19.84 0 22 37.02 57.48 46 43 13.38-21.56-23-14.98-23-67 0-71.15 41.52-61.02 41.52-101 0-20-5.52-22.7-5.52-37 0-18.893 16.65-17.796 13.41-33.465-2.24-10.823-3.99-19.503-5.29-32.591-0.93-9.287-1.23-19.185-10.87-18.787-11.33 0.468-15.63 20.417-33.25 21.848-17.58 1.427-32.57-14.967-39.38-12.625-6.74 2.321-4.62 20.625-0.62 33.625 6.29 20.432 20 46.995-5 50.995s-68 8-99 49-29.86 89.12-42 104c-40.759 49.96-82.526 29.45-82.526 71 0 18.61 31.525 32 36.525 26s-42.485-23.87 10.646-45c45.395-18.04 49.445-21.72 63.355-9z"></path>
</g>
<g transform="translate(500,1010) scale(.2)"> 
<path fill="#fff" stroke="#fff" d="m341.44 72.48c-4.996 5.373-16.788 6.249-19.439 15.36s-12.298 50.862-24.24 70.56c-1.711 22.575-5.242 43.325-1.92 68.16 0.512 3.827 2.866 6.739 3.6 10.8 2.746 2.787 11.308 2.142 11.04 7.2-0.214 4.048-15.984 4.37-19.199 1.68-6.181-5.172-4.091-18.73-9.12-24.48 0.391 7.822-1.031 15.667 2.399 21.36 1.779 2.952 9.235 4.252 9.12 8.4-0.185 6.643-18.83 1.623-20.16-0.48-2.101-3.322-1.912-9.327-3.84-14.399-2.19-5.765-3.423-5.582-3.12-12.96 0.308-7.478-2.403-17.44-3.6-25.681-1.598-11-2.987-21.504-6-28.8-33.955-4.925-58.845-18.915-96.24-20.4-14.532 23.549-37.729 38.432-58.8 55.44-1.453 6.972 1.004 14.763 1.44 22.08 2.946 1.99 9.732 0.78 9.6 5.28-0.109 3.701-13.088 4.427-16.56 2.159-6.799-4.439-3.471-22.006-8.4-28.079-14.843 4.438-17 23.64-22.32 38.399 2.486 2.285 9.844 2.29 7.92 6.96-2.098 5.092-19.677 1.365-20.4-2.399-1.232-6.421 3.276-16.929 4.56-22.801 1.385-6.33 1.811-17.056 4.8-22.56 0.893-1.644 4.24-2.775 5.52-4.08 5.983-6.097 16.533-14.781 18.72-23.76 3.528-14.487 8.287-30.359 7.2-48.72-4.202 16.561-11.877 27.42-24.72 34.56-15.535 8.636-36.694 1.528-54.96 1.92 9.262-6.627 28.635-3.066 41.04-5.28 35.111-6.264 21.791-55.728 52.8-67.2 20.893-7.729 42.031-12 71.52-12 9.277 0 48.22-1.306 60.72-3.12s26.796-11.99 41.04-19.68 29.986-35.007 53.28-36.72c11.954-0.879 20.691 3.304 26.4 9.12 8.817 8.984 9.726 22.967 22.08 29.52 2.517 1.335 4.622 0.951 5.04 3.6 0.617 3.918-3.49 10.69-5.521 12.72-10.04 10.039-31.3 5.056-41.28-1.68z"></path>
</g>


<text class="head" x="750" y="1050">Animal Exposure</text>



<text class="desc" x="630" y="1080"></text>
<text class="desc" x="770" y="1080"></text>
<text class="desc" x="920" y="1080"></text>

<text class="desc" x="630" y="1110"></text>
<text class="desc" x="770" y="1110">horse</text>
<text class="desc" x="920" y="1110"></text>

<text class="desc" x="630" y="1140"></text>
<text class="desc" x="770" y="1140"></text>
<text class="desc" x="920" y="1140"></text>

<rect id="rec1" x="420" y="333" width="660" height="175" fill="#111" rx="50" ry="25"></rect>
<text class="head" x="750" y="380">Months Symptoms Occur</text>
<text x="790" y="410">
<tspan class="month">Jan </tspan>
<tspan class="month">Feb </tspan>
<tspan class="month">Mar </tspan>
<tspan class="month">Apr </tspan>
<tspan class="month">May </tspan>
<tspan class="month">Jun </tspan>
<tspan class="month">Jly </tspan>
<tspan class="month">Aug </tspan>
<tspan class="month">Sept </tspan>
<tspan class="month">Oct </tspan>
<tspan class="month">Nov </tspan>
<tspan class="month">Dec</tspan>
</text>
<rect x="420" y="470" width="660" height="110" fill="#111" rx="50" ry="25"></rect>
<text class="desc" x="750" y="450">Pollination information for FL</text>
<text x="460" y="480" class="pollen">Weeds: </text>
<text x="790" y="480"><tspan class="month">Jan </tspan><tspan class="month">Feb </tspan><tspan class="month"> Mar </tspan><tspan class="emp">Apr </tspan><tspan class="emp">May </tspan><tspan class="emp">Jun </tspan><tspan class="emp">Jly </tspan><tspan class="emp">Aug </tspan><tspan class="emp">Sept </tspan><tspan class="emp">Oct </tspan><tspan class="month">Nov </tspan><tspan class="month">Dec</tspan>
</text>
<text x="460" y="510" class="pollen">Grasses: </text><text x="790" y="510"><tspan class="emp">Jan </tspan><tspan class="emp">Feb </tspan><tspan class="emp"> Mar </tspan><tspan class="emp">Apr </tspan><tspan class="emp">May </tspan><tspan class="emp">Jun </tspan><tspan class="emp">Jly </tspan><tspan class="emp">Aug </tspan><tspan class="emp">Sept </tspan><tspan class="emp">Oct </tspan><tspan class="emp">Nov </tspan><tspan class="emp">Dec</tspan>
</text>

<text x="460" y="540" class="pollen">Trees: </text><text x="790" y="540"><tspan class="emp">Jan </tspan><tspan class="emp">Feb </tspan><tspan class="emp"> Mar </tspan><tspan class="emp">Apr </tspan><tspan class="emp">May </tspan><tspan class="emp">Jun </tspan><tspan class="emp">Jly </tspan><tspan class="emp">Aug </tspan><tspan class="emp">Sept </tspan><tspan class="emp">Oct </tspan><tspan class="emp">Nov </tspan><tspan class="emp">Dec</tspan>
</text>
<rect x="480" y="642" height="28" width="580" rx="55" ry="35" fill="#f90"></rect>
<circle style="fill:#fff;" cx="695" cy="656" r="13"></circle>
<text x="670" y="663" class="txtend" font-size="22" font-weight="bold">Click and hold</text>
<text x="720" y="663" class="txtstart" font-size="22" font-weight="bold">to reveal the specific symptoms.</text>
<use x="695" y="656" xlink:href="#more"></use>
<rect x="0" y="1190" height="50" width="1500" rx="55" ry="35" fill="#f90"></rect>
<text x="750" y="1222" class="txtmiddle">The information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if  you have any concerns, or, specific questions regarding this information.</text>
</svg></body></html>
EOT;
echo mail($to,$subject, $message, $headers, "-fmailer@amxemr.com") ;
?>

