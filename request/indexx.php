<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Login</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style type="text/css">body{background-color:#d6eaf8;}
html, body, svg {
  width: 100%;
  height: 100%;
  margin: 0;
}
</style></head>
<body>
<div id="svg">
<svg xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"
x="0" y="0" width="1200" height="1400" id="sphere">
<style type="text/css">.desc{fill:#d4e6f1;font: 700 1.75em Arial,sans-serif;text-anchor:middle;}</style>
<defs>
</linearGradient>
    <linearGradient
        id="linearGradient4020"
        y2="1196.1"
        gradientUnits="userSpaceOnUse"
        x2="-480.03"
        y1="46.112"
        x1="-495.28"
        inkscape:collect="always"
      >
      <stop
          id="stop4016"
          style="stop-color:#19aeff"
          offset="0"
      />
      <stop
          id="stop4018"
          style="stop-color:#19aeff;stop-opacity:0"
          offset="1"
      />
    </linearGradient
    >
    <filter
        id="filter4082"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur4084"
          stdDeviation="33.297008"
          inkscape:collect="always"
      />
    </filter
    >
    <clipPath
        id="clipPath4088"
        clipPathUnits="userSpaceOnUse"
      >
      <path
          id="path4090"
          sodipodi:rx="596.875"
          sodipodi:ry="578.125"
          style="opacity:.75309;fill-opacity:0;stroke:#19aeff;stroke-miterlimit:2;stroke-width:100"
          sodipodi:type="arc"
          d="m1256.2 480.49a596.88 578.12 0 1 1 -1193.8 0 596.88 578.12 0 1 1 1193.8 0z"
          transform="matrix(.98808 0 0 1 -103.78 87.5)"
          sodipodi:cy="480.48718"
          sodipodi:cx="659.375"
      />
    </clipPath
    >
    <clipPath
        id="clipPath4092"
        clipPathUnits="userSpaceOnUse"
      >
      <path
          id="path4094"
          sodipodi:rx="596.875"
          sodipodi:ry="578.125"
          style="opacity:.75309;fill-opacity:0;stroke:#19aeff;stroke-miterlimit:2;stroke-width:100"
          sodipodi:type="arc"
          d="m1256.2 480.49a596.88 578.12 0 1 1 -1193.8 0 596.88 578.12 0 1 1 1193.8 0z"
          transform="matrix(.57050 0 0 .72789 -852 285.27)"
          sodipodi:cy="480.48718"
          sodipodi:cx="659.375"
      />
    </clipPath
    >
    <clipPath
        id="clipPath4096"
        clipPathUnits="userSpaceOnUse"
      >
      <path
          id="path4098"
          sodipodi:rx="596.875"
          sodipodi:ry="578.125"
          style="opacity:.75309;fill-opacity:0;stroke:#19aeff;stroke-miterlimit:2;stroke-width:100"
          sodipodi:type="arc"
          d="m1256.2 480.49a596.88 578.12 0 1 1 -1193.8 0 596.88 578.12 0 1 1 1193.8 0z"
          sodipodi:cy="480.48718"
          sodipodi:cx="659.375"
      />
    </clipPath
    >
    <filter
        id="filter4104"
        height="1.3388"
        width="1.1778"
        y="-.16939"
        x="-.088896"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur4106"
          stdDeviation="38.895303"
          inkscape:collect="always"
      />
    </filter
    >
    <filter
        id="filter4118"
        height="1.4023"
        width="1.4496"
        y="-.20113"
        x="-.22480"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur4120"
          stdDeviation="9.951923"
          inkscape:collect="always"
      />
    </filter
    >
<g id="ball3" transform="translate(100,-2950) scale(1.4)">

    <path
        id="path3933"
        style="opacity:.75309;fill-opacity:0;filter:url(#filter4082);stroke:#19aeff;stroke-miterlimit:2;stroke-width:100"
        sodipodi:type="arc"
        d="m1256.2 480.49a596.88 578.12 0 1 1 -1193.8 0 596.88 578.12 0 1 1 1193.8 0z"
        clip-path="url(#clipPath4096)"
        transform="matrix(.98808 0 0 1 -103.78 87.5)"
        sodipodi:cy="480.48718"
        sodipodi:cx="659.375"
    />
    <path
        id="path3983"
        style="opacity:.49440;stroke-width:0;stroke-miterlimit:2;fill:url(#linearGradient4020)"
        d="m-175 574.24a303.12 334.38 0 1 1 -606.25 0 303.12 334.38 0 1 1 606.25 0z"
        clip-path="url(#clipPath4092)"
        transform="matrix(1.732 0 0 1.3738 1371.8 -290.42)"
    />
    <path
        id="path4068"
        clip-path="url(#clipPath4088)"
        style="opacity:.79424;filter:url(#filter4104);stroke-miterlimit:2;stroke-width:0;fill:#ffffff"
        inkscape:connector-curvature="0"
        d="m455.18 1073.3c-224.88-43-391.8-210.69-426.77-428.69-11.789-73.49-8.021-82.65 11.238-27.33 51.12 146.85 170.6 253.9 341.8 306.26 51.628 15.788 64.21 17.116 162.22 17.116 98.071 0 110.58-1.322 162.5-17.172 190.19-58.061 316.62-184.54 356.87-357l8.7526-37.5-2.7187 65.625c-9.109 219.87-155.87 401.74-375.72 465.57-69.613 20.214-171.71 25.839-238.18 13.122z"
    />
    <path
        id="path4108"
        style="filter:url(#filter4118);stroke-width:0;stroke-miterlimit:2;fill:#ffffff"
        d="m322.07 319.1c-35.07 36.68-56.73 170.46-76.54 172.87-28.98 3.51-64.28-84.94-64.28-117.73 0-32.792 47.514-106.15 76.854-106.15s100.33 12.977 63.97 51.005z"
        sodipodi:nodetypes="sssss"
        inkscape:connector-curvature="0"
        transform="matrix(1.1465 .57830 -.75464 1.496 269.96 -377.43)"
    />
  </g
  >
<linearGradient id="lg">
<stop style="stop-color:#3498db;" />
<stop style="stop-color:#000088;" offset="1"/>
</linearGradient><radialGradient cx="171" cy="196" r="200" fx="171" fy="196" id="rg"
xlink:href="#lg" gradientUnits="userSpaceOnUse"
gradientTransform="matrix(1,0.796229,-0.8,1,153,-150)"/>
<g id="ball" transform="translate(-25,-28) scale(.5)"> 
  <g><path d="M 450 255 A 200 205 0 1 1 50,255 A 200 205 0 1 1 450 255 z" style="fill:url(#rg);"/></g>
</g>

<filter
    id="f1"
    height="1.2935"
    width="1.0954"
    y="-.14677"
    x="-.0477"
  >
  <feGaussianBlur
      stdDeviation="1.59"
  />
</filter>
<filter
    id="f2"
  >
  <feGaussianBlur
      stdDeviation="0.10820762"
  />
</filter>
<linearGradient
    id="lg2"
    y2="13"
    gradientUnits="userSpaceOnUse"
    x2="40"
    gradientTransform="translate(0 1)"
    y1="-1"
    x1="40"
  >
  <stop
      style="stop-color:#ffffff"
      offset="0"
  />
  <stop
      style="stop-color:#ffffff;stop-opacity:0"
      offset="1"
  />
</linearGradient
>
<linearGradient
    id="lg1"
    y2="26"
    gradientUnits="userSpaceOnUse"
    x2="40"
    y1="-1"
    x1="40"
  >
  <stop
      style="stop-color:#373ea3"
      offset="0"
  />
  <stop
      style="stop-color:#94ddf6"
      offset="1"
  />
>
</defs>
<g transform="translate(0,0) scale(0.5)">
 <a href="food.php">
<use x="450" y="50" xlink:href = "#ball"/>
<text class="desc" x="550" y="150">Food</text>
</a>
<use x="175" y="275" xlink:href = "#ball"/>
<text class="desc" x="275" y="375">Chemical</text>
<a href="epidermal.php">
<use x="725" y="275" xlink:href = "#ball"/>
<text class="desc" x="825" y="375">Epidermal</text>
</a>
<use x="450" y="275" xlink:href = "#ball"/>
<text class="desc" x="550" y="375">Occupational</text>


<use x="0" y="500" xlink:href = "#ball"/>
<text class="desc" x="100" y="600">Insect</text>
<a href="dust.php">
<use x="900" y="500" xlink:href = "#ball"/>
<text class="desc" x="1000" y="600">Dust</text>
</a>
<a href="grass.php">
<use x="175" y="775" xlink:href = "#ball"/>
<text class="desc" x="275" y="875">Grass</text>
</a>
<a href="weed.php">
<use x="725" y="775" xlink:href = "#ball"/>
<text class="desc" x="825" y="875">Weed</text>
</a>
<a href="tree.php">
<use x="450" y="775" xlink:href = "#ball"/>
<text class="desc" x="550" y="875">Tree</text>
</a>
<a href="mold.php">
<use x="450" y="1000" xlink:href = "#ball"/>
<text class="desc" x="550" y="1100">Mold</text>
</a>
<g transform="translate(345,550) scale(5)">
  <path
      style="opacity:0.69;filter:url(#f1);fill:#000000"
      d="m12.783 1h54.434c7.082 0 12.783 5.798 12.783 13s-5.701 13-12.783 13h-54.434c-7.0818 0-12.783-5.798-12.783-13s5.7012-13 12.783-13z"
  />
  <path
      style="fill:url(#lg1)"
      d="m12.783 0h54.434c7.082 0 12.783 5.798 12.783 13s-5.701 13-12.783 13h-54.434c-7.0818 0-12.783-5.798-12.783-13s5.7012-13 12.783-13z"
  />
  <path
      style="opacity:.8;filter:url(#f2);fill:url(#lg2)"
      d="m12.781 1c-6.7523 0-12.781 6-8.781 12h72c4-6-2.029-12-8.781-12h-54.438z"
  />
</g>
<text class="desc" x="550" y="625">Shipping Instructions</text>
</g>
</svg></div>
</body>
</html>
EOT;
ob_flush();
$grp = $_POST['grp'];
$json = file_get_contents('checked.jsn');
$checked = json_decode($json,1);
$checked[$grp] = array();
foreach($_POST as $k => $v){
  if($v == 'on'){
	$checked[$grp][] = $k;
  }
}
file_put_contents('checked.jsn',json_encode($checked));
?>
