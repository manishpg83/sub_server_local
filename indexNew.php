<?php 
$sub = intval($_POST['sub']);
if ($sub == 1){$sub = 0;include('enter.php');exit;}
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html>
<html><head>
<base href="https://dev.amxemr.com/">
<title>Allermetrix Client Portal</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/*! jQuery Mobile v1.1.0 db342b1f315c282692791aa870455901fdb46a55 jquerymobile.com | jquery.org/license */
.ui-bar-a{border:1px solid #333;background:#111;color:#fff;font-weight:bold;text-shadow:0 -1px 1px #000;background-image:-webkit-gradient(linear,left top,left bottom,from(#3c3c3c),to(#111));background-image:-webkit-linear-gradient(#3c3c3c,#111);background-image:-moz-linear-gradient(#3c3c3c,#111);background-image:-ms-linear-gradient(#3c3c3c,#111);background-image:-o-linear-gradient(#3c3c3c,#111);background-image:linear-gradient(#3c3c3c,#111)}
.ui-bar-a,.ui-bar-a input,.ui-bar-a select,.ui-bar-a textarea,.ui-bar-a button{font-family:Helvetica,Arial,sans-serif}
.ui-bar-a .ui-link-inherit{color:#fff}
.ui-bar-a .ui-link{color:#7cc4e7;font-weight:bold}
.ui-bar-a .ui-link:hover{color:#2489ce}
.ui-bar-a .ui-link:active{color:#2489ce}
.ui-bar-a .ui-link:visited{color:#2489ce}
.ui-body-a,.ui-overlay-a{border:1px solid #444;background:#222;color:#fff;text-shadow:0 1px 1px #111;font-weight:normal;background-image:-webkit-gradient(linear,left top,left bottom,from(#444),to(#222));background-image:-webkit-linear-gradient(#444,#222);background-image:-moz-linear-gradient(#444,#222);background-image:-ms-linear-gradient(#444,#222);background-image:-o-linear-gradient(#444,#222);background-image:linear-gradient(#444,#222)}
.ui-overlay-a{background-image:none;border-width:0}
.ui-body-a,.ui-body-a input,.ui-body-a select,.ui-body-a textarea,.ui-body-a button{font-family:Helvetica,Arial,sans-serif}
.ui-body-a .ui-link-inherit{color:#fff}
.ui-body-a .ui-link{color:#2489ce;font-weight:bold}
.ui-body-a .ui-link:hover{color:#2489ce}
.ui-body-a .ui-link:active{color:#2489ce}
.ui-body-a .ui-link:visited{color:#2489ce}
.ui-btn-up-a{border:1px solid #111;background:#333;font-weight:bold;color:#fff;text-shadow:0 1px 1px #111;background-image:-webkit-gradient(linear,left top,left bottom,from(#444),to(#2d2d2d));background-image:-webkit-linear-gradient(#444,#2d2d2d);background-image:-moz-linear-gradient(#444,#2d2d2d);background-image:-ms-linear-gradient(#444,#2d2d2d);background-image:-o-linear-gradient(#444,#2d2d2d);background-image:linear-gradient(#444,#2d2d2d)}
.ui-btn-up-a a.ui-link-inherit{color:#fff}
.ui-btn-hover-a{border:1px solid #000;background:#444;font-weight:bold;color:#fff;text-shadow:0 1px 1px #111;background-image:-webkit-gradient(linear,left top,left bottom,from(#555),to(#383838));background-image:-webkit-linear-gradient(#555,#383838);background-image:-moz-linear-gradient(#555,#383838);background-image:-ms-linear-gradient(#555,#383838);background-image:-o-linear-gradient(#555,#383838);background-image:linear-gradient(#555,#383838)}
.ui-btn-hover-a a.ui-link-inherit{color:#fff}
.ui-btn-down-a{border:1px solid #000;background:#222;font-weight:bold;color:#fff;text-shadow:0 1px 1px #111;background-image:-webkit-gradient(linear,left top,left bottom,from(#202020),to(#2c2c2c));background-image:-webkit-linear-gradient(#202020,#2c2c2c);background-image:-moz-linear-gradient(#202020,#2c2c2c);background-image:-ms-linear-gradient(#202020,#2c2c2c);background-image:-o-linear-gradient(#202020,#2c2c2c);background-image:linear-gradient(#202020,#2c2c2c)}
.ui-btn-down-a a.ui-link-inherit{color:#fff}
.ui-btn-up-a,.ui-btn-hover-a,.ui-btn-down-a{font-family:Helvetica,Arial,sans-serif;text-decoration:none}
.ui-bar-b{border:1px solid #456f9a;background:#5e87b0;color:#fff;font-weight:bold;text-shadow:0 1px 1px #3e6790;background-image:-webkit-gradient(linear,left top,left bottom,from(#6facd5),to(#497bae));background-image:-webkit-linear-gradient(#6facd5,#497bae);background-image:-moz-linear-gradient(#6facd5,#497bae);background-image:-ms-linear-gradient(#6facd5,#497bae);background-image:-o-linear-gradient(#6facd5,#497bae);background-image:linear-gradient(#6facd5,#497bae)}
.ui-bar-b,.ui-bar-b input,.ui-bar-b select,.ui-bar-b textarea,.ui-bar-b button{font-family:Helvetica,Arial,sans-serif}
.ui-bar-b .ui-link-inherit{color:#fff}
.ui-bar-b .ui-link{color:#ddf0f8;font-weight:bold}
.ui-bar-b .ui-link:hover{color:#ddf0f8}
.ui-bar-b .ui-link:active{color:#ddf0f8}
.ui-bar-b .ui-link:visited{color:#ddf0f8}
.ui-body-b,.ui-overlay-b{border:1px solid #999;background:#f3f3f3;color:#222;text-shadow:0 1px 0 #fff;font-weight:normal;background-image:-webkit-gradient(linear,left top,left bottom,from(#ddd),to(#ccc));background-image:-webkit-linear-gradient(#ddd,#ccc);background-image:-moz-linear-gradient(#ddd,#ccc);background-image:-ms-linear-gradient(#ddd,#ccc);background-image:-o-linear-gradient(#ddd,#ccc);background-image:linear-gradient(#ddd,#ccc)}
.ui-overlay-b{background-image:none;border-width:0}
.ui-body-b,.ui-body-b input,.ui-body-b select,.ui-body-b textarea,.ui-body-b button{font-family:Helvetica,Arial,sans-serif}
.ui-body-b .ui-link-inherit{color:#333}
.ui-body-b .ui-link{color:#2489ce;font-weight:bold}
.ui-body-b .ui-link:hover{color:#2489ce}
.ui-body-b .ui-link:active{color:#2489ce}
.ui-body-b .ui-link:visited{color:#2489ce}
.ui-btn-up-b{border:1px solid #044062;background:#396b9e;font-weight:bold;color:#fff;text-shadow:0 1px 1px #194b7e;background-image:-webkit-gradient(linear,left top,left bottom,from(#5f9cc5),to(#396b9e));background-image:-webkit-linear-gradient(#5f9cc5,#396b9e);background-image:-moz-linear-gradient(#5f9cc5,#396b9e);background-image:-ms-linear-gradient(#5f9cc5,#396b9e);background-image:-o-linear-gradient(#5f9cc5,#396b9e);background-image:linear-gradient(#5f9cc5,#396b9e)}
.ui-btn-up-b a.ui-link-inherit{color:#fff}
.ui-btn-hover-b{border:1px solid #00415e;background:#4b88b6;font-weight:bold;color:#fff;text-shadow:0 1px 1px #194b7e;background-image:-webkit-gradient(linear,left top,left bottom,from(#6facd5),to(#4272a4));background-image:-webkit-linear-gradient(#6facd5,#4272a4);background-image:-moz-linear-gradient(#6facd5,#4272a4);background-image:-ms-linear-gradient(#6facd5,#4272a4);background-image:-o-linear-gradient(#6facd5,#4272a4);background-image:linear-gradient(#6facd5,#4272a4)}
.ui-btn-hover-b a.ui-link-inherit{color:#fff}
.ui-btn-down-b{border:1px solid #225377;background:#4e89c5;font-weight:bold;color:#fff;text-shadow:0 1px 1px #194b7e;background-image:-webkit-gradient(linear,left top,left bottom,from(#295b8e),to(#3e79b5));background-image:-webkit-linear-gradient(#295b8e,#3e79b5);background-image:-moz-linear-gradient(#295b8e,#3e79b5);background-image:-ms-linear-gradient(#295b8e,#3e79b5);background-image:-o-linear-gradient(#295b8e,#3e79b5);background-image:linear-gradient(#295b8e,#3e79b5)}
.ui-btn-down-b a.ui-link-inherit{color:#fff}
.ui-btn-up-b,.ui-btn-hover-b,.ui-btn-down-b{font-family:Helvetica,Arial,sans-serif;text-decoration:none}
.ui-bar-c{border:1px solid #b3b3b3;background:#eee;color:#3e3e3e;font-weight:bold;text-shadow:0 1px 1px #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#f0f0f0),to(#ddd));background-image:-webkit-linear-gradient(#f0f0f0,#ddd);background-image:-moz-linear-gradient(#f0f0f0,#ddd);background-image:-ms-linear-gradient(#f0f0f0,#ddd);background-image:-o-linear-gradient(#f0f0f0,#ddd);background-image:linear-gradient(#f0f0f0,#ddd)}
.ui-bar-c .ui-link-inherit{color:#3e3e3e}
.ui-bar-c .ui-link{color:#7cc4e7;font-weight:bold}
.ui-bar-c .ui-link:hover{color:#2489ce}
.ui-bar-c .ui-link:active{color:#2489ce}
.ui-bar-c .ui-link:visited{color:#2489ce}
.ui-bar-c,.ui-bar-c input,.ui-bar-c select,.ui-bar-c textarea,.ui-bar-c button{font-family:Helvetica,Arial,sans-serif}
.ui-body-c,.ui-overlay-c{border:1px solid #aaa;color:#333;text-shadow:0 1px 0 #fff;background:#f9f9f9;background-image:-webkit-gradient(linear,left top,left bottom,from(#f9f9f9),to(#eee));background-image:-webkit-linear-gradient(#f9f9f9,#eee);background-image:-moz-linear-gradient(#f9f9f9,#eee);background-image:-ms-linear-gradient(#f9f9f9,#eee);background-image:-o-linear-gradient(#f9f9f9,#eee);background-image:linear-gradient(#f9f9f9,#eee)}
.ui-overlay-c{background-image:none;border-width:0}
.ui-body-c,.ui-body-c input,.ui-body-c select,.ui-body-c textarea,.ui-body-c button{font-family:Helvetica,Arial,sans-serif}
.ui-body-c .ui-link-inherit{color:#333}
.ui-body-c .ui-link{color:#2489ce;font-weight:bold}
.ui-body-c .ui-link:hover{color:#2489ce}
.ui-body-c .ui-link:active{color:#2489ce}
.ui-body-c .ui-link:visited{color:#2489ce}
.ui-btn-up-c{border:1px solid #ccc;background:#eee;font-weight:bold;color:#222;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff),to(#f1f1f1));background-image:-webkit-linear-gradient(#fff,#f1f1f1);background-image:-moz-linear-gradient(#fff,#f1f1f1);background-image:-ms-linear-gradient(#fff,#f1f1f1);background-image:-o-linear-gradient(#fff,#f1f1f1);background-image:linear-gradient(#fff,#f1f1f1)}
.ui-btn-up-c a.ui-link-inherit{color:#2f3e46}
.ui-btn-hover-c{border:1px solid #bbb;background:#dfdfdf;font-weight:bold;color:#222;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#f6f6f6),to(#e0e0e0));background-image:-webkit-linear-gradient(#f9f9f9,#e0e0e0);background-image:-moz-linear-gradient(#f6f6f6,#e0e0e0);background-image:-ms-linear-gradient(#f6f6f6,#e0e0e0);background-image:-o-linear-gradient(#f6f6f6,#e0e0e0);background-image:linear-gradient(#f6f6f6,#e0e0e0)}
.ui-btn-hover-c a.ui-link-inherit{color:#2f3e46}
.ui-btn-down-c{border:1px solid #bbb;background:#d6d6d6;font-weight:bold;color:#222;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#d0d0d0),to(#dfdfdf));background-image:-webkit-linear-gradient(#d0d0d0,#dfdfdf);background-image:-moz-linear-gradient(#d0d0d0,#dfdfdf);background-image:-ms-linear-gradient(#d0d0d0,#dfdfdf);background-image:-o-linear-gradient(#d0d0d0,#dfdfdf);background-image:linear-gradient(#d0d0d0,#dfdfdf)}
.ui-btn-down-c a.ui-link-inherit{color:#2f3e46}
.ui-btn-up-c,.ui-btn-hover-c,.ui-btn-down-c{font-family:Helvetica,Arial,sans-serif;text-decoration:none}
.ui-bar-d{border:1px solid #bbb;background:#bbb;color:#333;text-shadow:0 1px 0 #eee;background-image:-webkit-gradient(linear,left top,left bottom,from(#ddd),to(#bbb));background-image:-webkit-linear-gradient(#ddd,#bbb);background-image:-moz-linear-gradient(#ddd,#bbb);background-image:-ms-linear-gradient(#ddd,#bbb);background-image:-o-linear-gradient(#ddd,#bbb);background-image:linear-gradient(#ddd,#bbb)}
.ui-bar-d,.ui-bar-d input,.ui-bar-d select,.ui-bar-d textarea,.ui-bar-d button{font-family:Helvetica,Arial,sans-serif}
.ui-bar-d .ui-link-inherit{color:#333}
.ui-bar-d .ui-link{color:#2489ce;font-weight:bold}
.ui-bar-d .ui-link:hover{color:#2489ce}
.ui-bar-d .ui-link:active{color:#2489ce}
.ui-bar-d .ui-link:visited{color:#2489ce}
.ui-body-d,.ui-overlay-d{border:1px solid #bbb;color:#333;text-shadow:0 1px 0 #fff;background:#fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff),to(#fff));background-image:-webkit-linear-gradient(#fff,#fff);background-image:-moz-linear-gradient(#fff,#fff);background-image:-ms-linear-gradient(#fff,#fff);background-image:-o-linear-gradient(#fff,#fff);background-image:linear-gradient(#fff,#fff)}
.ui-overlay-d{background-image:none;border-width:0}
.ui-body-d,.ui-body-d input,.ui-body-d select,.ui-body-d textarea,.ui-body-d button{font-family:Helvetica,Arial,sans-serif}
.ui-body-d .ui-link-inherit{color:#333}
.ui-body-d .ui-link{color:#2489ce;font-weight:bold}
.ui-body-d .ui-link:hover{color:#2489ce}
.ui-body-d .ui-link:active{color:#2489ce}
.ui-body-d .ui-link:visited{color:#2489ce}
.ui-btn-up-d{border:1px solid #bbb;background:#fff;font-weight:bold;color:#333;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#fafafa),to(#f6f6f6));background-image:-webkit-linear-gradient(#fafafa,#f6f6f6);background-image:-moz-linear-gradient(#fafafa,#f6f6f6);background-image:-ms-linear-gradient(#fafafa,#f6f6f6);background-image:-o-linear-gradient(#fafafa,#f6f6f6);background-image:linear-gradient(#fafafa,#f6f6f6)}
.ui-btn-up-d a.ui-link-inherit{color:#333}
.ui-btn-hover-d{border:1px solid #aaa;background:#eee;font-weight:bold;color:#333;cursor:pointer;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#eee),to(#fff));background-image:-webkit-linear-gradient(#eee,#fff);background-image:-moz-linear-gradient(#eee,#fff);background-image:-ms-linear-gradient(#eee,#fff);background-image:-o-linear-gradient(#eee,#fff);background-image:linear-gradient(#eee,#fff)}
.ui-btn-hover-d a.ui-link-inherit{color:#333}
.ui-btn-down-d{border:1px solid #aaa;background:#eee;font-weight:bold;color:#333;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#e5e5e5),to(#f2f2f2));background-image:-webkit-linear-gradient(#e5e5e5,#f2f2f2);background-image:-moz-linear-gradient(#e5e5e5,#f2f2f2);background-image:-ms-linear-gradient(#e5e5e5,#f2f2f2);background-image:-o-linear-gradient(#e5e5e5,#f2f2f2);background-image:linear-gradient(#e5e5e5,#f2f2f2)}
.ui-btn-down-d a.ui-link-inherit{color:#333}
.ui-btn-up-d,.ui-btn-hover-d,.ui-btn-down-d{font-family:Helvetica,Arial,sans-serif;text-decoration:none}
.ui-bar-e{border:1px solid #f7c942;background:#fadb4e;color:#333;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#fceda7),to(#fbef7e));background-image:-webkit-linear-gradient(#fceda7,#fbef7e);background-image:-moz-linear-gradient(#fceda7,#fbef7e);background-image:-ms-linear-gradient(#fceda7,#fbef7e);background-image:-o-linear-gradient(#fceda7,#fbef7e);background-image:linear-gradient(#fceda7,#fbef7e)}
.ui-bar-e,.ui-bar-e input,.ui-bar-e select,.ui-bar-e textarea,.ui-bar-e button{font-family:Helvetica,Arial,sans-serif}
.ui-bar-e .ui-link-inherit{color:#333}
.ui-bar-e .ui-link{color:#2489ce;font-weight:bold}
.ui-bar-e .ui-link:hover{color:#2489ce}
.ui-bar-e .ui-link:active{color:#2489ce}
.ui-bar-e .ui-link:visited{color:#2489ce}
.ui-body-e,.ui-overlay-e{border:1px solid #f7c942;color:#222;text-shadow:0 1px 0 #fff;background:#fff9df;background-image:-webkit-gradient(linear,left top,left bottom,from(#fffadf),to(#fff3a5));background-image:-webkit-linear-gradient(#fffadf,#fff3a5);background-image:-moz-linear-gradient(#fffadf,#fff3a5);background-image:-ms-linear-gradient(#fffadf,#fff3a5);background-image:-o-linear-gradient(#fffadf,#fff3a5);background-image:linear-gradient(#fffadf,#fff3a5)}
.ui-overlay-e{background-image:none;border-width:0}
.ui-body-e,.ui-body-e input,.ui-body-e select,.ui-body-e textarea,.ui-body-e button{font-family:Helvetica,Arial,sans-serif}
.ui-body-e .ui-link-inherit{color:#333}
.ui-body-e .ui-link{color:#2489ce;font-weight:bold}
.ui-body-e .ui-link:hover{color:#2489ce}
.ui-body-e .ui-link:active{color:#2489ce}
.ui-body-e .ui-link:visited{color:#2489ce}
.ui-btn-up-e{border:1px solid #f4c63f;background:#fadb4e;font-weight:bold;color:#222;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#ffefaa),to(#ffe155));background-image:-webkit-linear-gradient(#ffefaa,#ffe155);background-image:-moz-linear-gradient(#ffefaa,#ffe155);background-image:-ms-linear-gradient(#ffefaa,#ffe155);background-image:-o-linear-gradient(#ffefaa,#ffe155);background-image:linear-gradient(#ffefaa,#ffe155)}
.ui-btn-up-e a.ui-link-inherit{color:#222}
.ui-btn-hover-e{border:1px solid #f2c43d;background:#fbe26f;font-weight:bold;color:#111;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff5ba),to(#fbdd52));background-image:-webkit-linear-gradient(#fff5ba,#fbdd52);background-image:-moz-linear-gradient(#fff5ba,#fbdd52);background-image:-ms-linear-gradient(#fff5ba,#fbdd52);background-image:-o-linear-gradient(#fff5ba,#fbdd52);background-image:linear-gradient(#fff5ba,#fbdd52)}
.ui-btn-hover-e a.ui-link-inherit{color:#333}
.ui-btn-down-e{border:1px solid #f2c43d;background:#fceda7;font-weight:bold;color:#111;text-shadow:0 1px 0 #fff;background-image:-webkit-gradient(linear,left top,left bottom,from(#f8d94c),to(#fadb4e));background-image:-webkit-linear-gradient(#f8d94c,#fadb4e);background-image:-moz-linear-gradient(#f8d94c,#fadb4e);background-image:-ms-linear-gradient(#f8d94c,#fadb4e);background-image:-o-linear-gradient(#f8d94c,#fadb4e);background-image:linear-gradient(#f8d94c,#fadb4e)}
.ui-btn-down-e a.ui-link-inherit{color:#333}
.ui-btn-up-e,.ui-btn-hover-e,.ui-btn-down-e{font-family:Helvetica,Arial,sans-serif;text-decoration:none}
a.ui-link-inherit{text-decoration:none!important}
.ui-btn-active{border:1px solid #2373a5;background:#5393c5;font-weight:bold;color:#fff;cursor:pointer;text-shadow:0 1px 1px #3373a5;text-decoration:none;background-image:-webkit-gradient(linear,left top,left bottom,from(#5393c5),to(#6facd5));background-image:-webkit-linear-gradient(#5393c5,#6facd5);background-image:-moz-linear-gradient(#5393c5,#6facd5);background-image:-ms-linear-gradient(#5393c5,#6facd5);background-image:-o-linear-gradient(#5393c5,#6facd5);background-image:linear-gradient(#5393c5,#6facd5);font-family:Helvetica,Arial,sans-serif}
.ui-btn-active a.ui-link-inherit{color:#fff}
.ui-btn-inner{border-top:1px solid #fff;border-color:rgba(255,255,255,.3)}
.ui-corner-tl{-moz-border-radius-topleft:.6em;-webkit-border-top-left-radius:.6em;border-top-left-radius:.6em}
.ui-corner-tr{-moz-border-radius-topright:.6em;-webkit-border-top-right-radius:.6em;border-top-right-radius:.6em}
.ui-corner-bl{-moz-border-radius-bottomleft:.6em;-webkit-border-bottom-left-radius:.6em;border-bottom-left-radius:.6em}
.ui-corner-br{-moz-border-radius-bottomright:.6em;-webkit-border-bottom-right-radius:.6em;border-bottom-right-radius:.6em}
.ui-corner-top{-moz-border-radius-topleft:.6em;-webkit-border-top-left-radius:.6em;border-top-left-radius:.6em;-moz-border-radius-topright:.6em;-webkit-border-top-right-radius:.6em;border-top-right-radius:.6em}
.ui-corner-bottom{-moz-border-radius-bottomleft:.6em;-webkit-border-bottom-left-radius:.6em;border-bottom-left-radius:.6em;-moz-border-radius-bottomright:.6em;-webkit-border-bottom-right-radius:.6em;border-bottom-right-radius:.6em}
.ui-corner-right{-moz-border-radius-topright:.6em;-webkit-border-top-right-radius:.6em;border-top-right-radius:.6em;-moz-border-radius-bottomright:.6em;-webkit-border-bottom-right-radius:.6em;border-bottom-right-radius:.6em}
.ui-corner-left{-moz-border-radius-topleft:.6em;-webkit-border-top-left-radius:.6em;border-top-left-radius:.6em;-moz-border-radius-bottomleft:.6em;-webkit-border-bottom-left-radius:.6em;border-bottom-left-radius:.6em}
.ui-corner-all{-moz-border-radius:.6em;-webkit-border-radius:.6em;border-radius:.6em}
.ui-corner-none{-moz-border-radius:0;-webkit-border-radius:0;border-radius:0}
.ui-br{border-bottom:#828282;border-bottom:rgba(130,130,130,.3);border-bottom-width:1px;border-bottom-style:solid}
.ui-disabled{opacity:.3}
.ui-disabled,.ui-disabled a{cursor:default!important;pointer-events:none}
.ui-disabled .ui-btn-text{-ms-filter:"alpha(opacity=30)";filter:alpha(opacity=30);zoom:1}
.ui-icon,.ui-icon-searchfield:after{background:#666;background:rgba(0,0,0,.4);background-image:url(images/icons-18-white.png);background-repeat:no-repeat;-moz-border-radius:9px;-webkit-border-radius:9px;border-radius:9px}
.ui-icon-alt{background:#fff;background:rgba(255,255,255,.3);background-image:url(images/icons-18-black.png);background-repeat:no-repeat}
@media only screen and (-webkit-min-device-pixel-ratio:1.5),only screen and (min--moz-device-pixel-ratio:1.5),only screen and (min-resolution:240dpi){.ui-icon-plus,.ui-icon-minus,.ui-icon-delete,.ui-icon-arrow-r,.ui-icon-arrow-l,.ui-icon-arrow-u,.ui-icon-arrow-d,.ui-icon-check,.ui-icon-gear,.ui-icon-refresh,.ui-icon-forward,.ui-icon-back,.ui-icon-grid,.ui-icon-star,.ui-icon-alert,.ui-icon-info,.ui-icon-home,.ui-icon-search,.ui-icon-searchfield:after,.ui-icon-checkbox-off,.ui-icon-checkbox-on,.ui-icon-radio-off,.ui-icon-radio-on{background-image:url(images/icons-36-white.png);-moz-background-size:776px 18px;-o-background-size:776px 18px;-webkit-background-size:776px 18px;background-size:776px 18px}
.ui-icon-alt{background-image:url(images/icons-36-black.png)}
}
.ui-icon-plus{background-position:-0 50%}
.ui-icon-minus{background-position:-36px 50%}
.ui-icon-delete{background-position:-72px 50%}
.ui-icon-arrow-r{background-position:-108px 50%}
.ui-icon-arrow-l{background-position:-144px 50%}
.ui-icon-arrow-u{background-position:-180px 50%}
.ui-icon-arrow-d{background-position:-216px 50%}
.ui-icon-check{background-position:-252px 50%}
.ui-icon-gear{background-position:-288px 50%}
.ui-icon-refresh{background-position:-324px 50%}
.ui-icon-forward{background-position:-360px 50%}
.ui-icon-back{background-position:-396px 50%}
.ui-icon-grid{background-position:-432px 50%}
.ui-icon-star{background-position:-468px 50%}
.ui-icon-alert{background-position:-504px 50%}
.ui-icon-info{background-position:-540px 50%}
.ui-icon-home{background-position:-576px 50%}
.ui-icon-search,.ui-icon-searchfield:after{background-position:-612px 50%}
.ui-icon-checkbox-off{background-position:-684px 50%}
.ui-icon-checkbox-on{background-position:-648px 50%}
.ui-icon-radio-off{background-position:-756px 50%}
.ui-icon-radio-on{background-position:-720px 50%}
.ui-checkbox .ui-icon{-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px}
.ui-icon-checkbox-off,.ui-icon-radio-off{background-color:transparent}
.ui-checkbox-on .ui-icon,.ui-radio-on .ui-icon{background-color:#4596ce}
.ui-icon-loading{background:url(images/ajax-loader.gif);background-size:46px 46px}
.ui-btn-corner-tl{-moz-border-radius-topleft:1em;-webkit-border-top-left-radius:1em;border-top-left-radius:1em}
.ui-btn-corner-tr{-moz-border-radius-topright:1em;-webkit-border-top-right-radius:1em;border-top-right-radius:1em}
.ui-btn-corner-bl{-moz-border-radius-bottomleft:1em;-webkit-border-bottom-left-radius:1em;border-bottom-left-radius:1em}
.ui-btn-corner-br{-moz-border-radius-bottomright:1em;-webkit-border-bottom-right-radius:1em;border-bottom-right-radius:1em}
.ui-btn-corner-top{-moz-border-radius-topleft:1em;-webkit-border-top-left-radius:1em;border-top-left-radius:1em;-moz-border-radius-topright:1em;-webkit-border-top-right-radius:1em;border-top-right-radius:1em}
.ui-btn-corner-bottom{-moz-border-radius-bottomleft:1em;-webkit-border-bottom-left-radius:1em;border-bottom-left-radius:1em;-moz-border-radius-bottomright:1em;-webkit-border-bottom-right-radius:1em;border-bottom-right-radius:1em}
.ui-btn-corner-right{-moz-border-radius-topright:1em;-webkit-border-top-right-radius:1em;border-top-right-radius:1em;-moz-border-radius-bottomright:1em;-webkit-border-bottom-right-radius:1em;border-bottom-right-radius:1em}
.ui-btn-corner-left{-moz-border-radius-topleft:1em;-webkit-border-top-left-radius:1em;border-top-left-radius:1em;-moz-border-radius-bottomleft:1em;-webkit-border-bottom-left-radius:1em;border-bottom-left-radius:1em}
.ui-btn-corner-all{-moz-border-radius:1em;-webkit-border-radius:1em;border-radius:1em}
.ui-corner-tl,.ui-corner-tr,.ui-corner-bl,.ui-corner-br,.ui-corner-top,.ui-corner-bottom,.ui-corner-right,.ui-corner-left,.ui-corner-all,.ui-btn-corner-tl,.ui-btn-corner-tr,.ui-btn-corner-bl,.ui-btn-corner-br,.ui-btn-corner-top,.ui-btn-corner-bottom,.ui-btn-corner-right,.ui-btn-corner-left,.ui-btn-corner-all{-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}
.ui-overlay{background:#666;opacity:.5;filter:Alpha(Opacity=50);position:absolute;width:100%;height:100%}
.ui-overlay-shadow{-moz-box-shadow:0 0 12px rgba(0,0,0,.6);-webkit-box-shadow:0 0 12px rgba(0,0,0,.6);box-shadow:0 0 12px rgba(0,0,0,.6)}
.ui-shadow{-moz-box-shadow:0 1px 4px rgba(0,0,0,.3);-webkit-box-shadow:0 1px 4px rgba(0,0,0,.3);box-shadow:0 1px 4px rgba(0,0,0,.3)}
.ui-bar-a .ui-shadow,.ui-bar-b .ui-shadow,.ui-bar-c .ui-shadow{-moz-box-shadow:0 1px 0 rgba(255,255,255,.3);-webkit-box-shadow:0 1px 0 rgba(255,255,255,.3);box-shadow:0 1px 0 rgba(255,255,255,.3)}
.ui-shadow-inset{-moz-box-shadow:inset 0 1px 4px rgba(0,0,0,.2);-webkit-box-shadow:inset 0 1px 4px rgba(0,0,0,.2);box-shadow:inset 0 1px 4px rgba(0,0,0,.2)}
.ui-icon-shadow{-moz-box-shadow:0 1px 0 rgba(255,255,255,.4);-webkit-box-shadow:0 1px 0 rgba(255,255,255,.4);box-shadow:0 1px 0 rgba(255,255,255,.4)}
.ui-btn:focus{outline:0}
.ui-focus,.ui-btn:focus{-moz-box-shadow:0 0 12px #387bbe;-webkit-box-shadow:0 0 12px #387bbe;box-shadow:0 0 12px #387bbe}
.ui-mobile-nosupport-boxshadow *{-moz-box-shadow:none!important;-webkit-box-shadow:none!important;box-shadow:none!important}
.ui-mobile-nosupport-boxshadow .ui-focus,.ui-mobile-nosupport-boxshadow .ui-btn:focus{outline-width:1px;outline-style:dotted}
.ui-mobile,.ui-mobile body{height:99.9%}
.ui-mobile fieldset,.ui-page{padding:0;margin:0}
.ui-mobile a img,.ui-mobile fieldset{border-width:0}
.ui-mobile-viewport{margin:0;overflow-x:visible;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;-webkit-tap-highlight-color:rgba(0,0,0,0)}
body.ui-mobile-viewport,div.ui-mobile-viewport{overflow-x:hidden}
.ui-mobile [data-role=page],.ui-mobile [data-role=dialog],.ui-page{top:0;left:0;width:100%;min-height:100%;position:absolute;display:none;border:0}
.ui-mobile .ui-page-active{display:block;overflow:visible}
.ui-page{outline:0}
@media screen and (orientation:portrait){.ui-mobile,.ui-mobile .ui-page{min-height:420px}
}
@media screen and (orientation:landscape){.ui-mobile,.ui-mobile .ui-page{min-height:300px}
}
.ui-loading .ui-loader{display:block}
.ui-loader{display:none;z-index:9999999;position:fixed;top:50%;box-shadow:0 1px 1px -1px #fff;left:50%;border:0}
.ui-loader-default{background:0;opacity:.18;width:46px;height:46px;margin-left:-23px;margin-top:-23px}
.ui-loader-verbose{width:200px;opacity:.88;height:auto;margin-left:-110px;margin-top:-43px;padding:10px}
.ui-loader-default h1{font-size:0;width:0;height:0;overflow:hidden}
.ui-loader-verbose h1{font-size:16px;margin:0;text-align:center}
.ui-loader .ui-icon{background-color:#000;display:block;margin:0;width:44px;height:44px;padding:1px;-webkit-border-radius:36px;-moz-border-radius:36px;border-radius:36px}
.ui-loader-verbose .ui-icon{margin:0 auto 10px;opacity:.75}
.ui-loader-textonly{padding:15px;margin-left:-115px}
.ui-loader-textonly .ui-icon{display:none}
.ui-loader-fakefix{position:absolute}
.ui-mobile-rendering>*{visibility:hidden}
.ui-bar,.ui-body{position:relative;padding:.4em 15px;overflow:hidden;display:block;clear:both}
.ui-bar{font-size:16px;margin:0}
.ui-bar h1,.ui-bar h2,.ui-bar h3,.ui-bar h4,.ui-bar h5,.ui-bar h6{margin:0;padding:0;font-size:16px;display:inline-block}
.ui-header,.ui-footer{position:relative;border-left-width:0;border-right-width:0}
.ui-header .ui-btn-left,.ui-header .ui-btn-right,.ui-footer .ui-btn-left,.ui-footer .ui-btn-right{position:absolute;top:3px}
.ui-header .ui-btn-left,.ui-footer .ui-btn-left{left:5px}
.ui-header .ui-btn-right,.ui-footer .ui-btn-right{right:5px}
.ui-footer .ui-btn-icon-notext,.ui-header .ui-btn-icon-notext{top:6px}
.ui-header .ui-title,.ui-footer .ui-title{min-height:1.1em;text-align:center;font-size:16px;display:block;margin:.6em 30% .8em;padding:0;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;outline:0!important}
.ui-footer .ui-title{margin:.6em 15px .8em}
.ui-content{border-width:0;overflow:visible;overflow-x:hidden;padding:15px}
.ui-icon{width:18px;height:18px}
.ui-nojs{position:absolute;left:-9999px}
.ui-hide-label label,.ui-hidden-accessible{position:absolute!important;left:-9999px;clip:rect(1px 1px 1px 1px);clip:rect(1px,1px,1px,1px)}
.ui-mobile-viewport-transitioning,.ui-mobile-viewport-transitioning .ui-page{width:100%;height:100%;overflow:hidden}
.in{-webkit-animation-timing-function:ease-out;-webkit-animation-duration:350ms;-moz-animation-timing-function:ease-out;-moz-animation-duration:350ms}
.out{-webkit-animation-timing-function:ease-in;-webkit-animation-duration:225ms;-moz-animation-timing-function:ease-in;-moz-animation-duration:225}
@-webkit-keyframes fadein{from{opacity:0}
to{opacity:1}
}
@-moz-keyframes fadein{from{opacity:0}
to{opacity:1}
}
@-webkit-keyframes fadeout{from{opacity:1}
to{opacity:0}
}
@-moz-keyframes fadeout{from{opacity:1}
to{opacity:0}
}
.fade.out{opacity:0;-webkit-animation-duration:125ms;-webkit-animation-name:fadeout;-moz-animation-duration:125ms;-moz-animation-name:fadeout}
.fade.in{opacity:1;-webkit-animation-duration:225ms;-webkit-animation-name:fadein;-moz-animation-duration:225ms;-moz-animation-name:fadein}
.pop{-webkit-transform-origin:50% 50%;-moz-transform-origin:50% 50%}
.pop.in{-webkit-transform:scale(1);-moz-transform:scale(1);opacity:1;-webkit-animation-name:popin;-moz-animation-name:popin;-webkit-animation-duration:350ms;-moz-animation-duration:350ms}
.pop.out{-webkit-animation-name:fadeout;-moz-animation-name:fadeout;opacity:0;-webkit-animation-duration:100ms;-moz-animation-duration:100ms}
.pop.in.reverse{-webkit-animation-name:fadein;-moz-animation-name:fadein}
.pop.out.reverse{-webkit-transform:scale(.8);-moz-transform:scale(.8);-webkit-animation-name:popout;-moz-animation-name:popout}
@-webkit-keyframes popin{from{-webkit-transform:scale(.8);opacity:0}
to{-webkit-transform:scale(1);opacity:1}
}
@-moz-keyframes popin{from{-moz-transform:scale(.8);opacity:0}
to{-moz-transform:scale(1);opacity:1}
}
@-webkit-keyframes popout{from{-webkit-transform:scale(1);opacity:1}
to{-webkit-transform:scale(.8);opacity:0}
}
@-moz-keyframes popout{from{-moz-transform:scale(1);opacity:1}
to{-moz-transform:scale(.8);opacity:0}
}
@-webkit-keyframes slideinfromright{from{-webkit-transform:translateX(100%)}
to{-webkit-transform:translateX(0)}
}
@-moz-keyframes slideinfromright{from{-moz-transform:translateX(100%)}
to{-moz-transform:translateX(0)}
}
@-webkit-keyframes slideinfromleft{from{-webkit-transform:translateX(-100%)}
to{-webkit-transform:translateX(0)}
}
@-moz-keyframes slideinfromleft{from{-moz-transform:translateX(-100%)}
to{-moz-transform:translateX(0)}
}
@-webkit-keyframes slideouttoleft{from{-webkit-transform:translateX(0)}
to{-webkit-transform:translateX(-100%)}
}
@-moz-keyframes slideouttoleft{from{-moz-transform:translateX(0)}
to{-moz-transform:translateX(-100%)}
}
@-webkit-keyframes slideouttoright{from{-webkit-transform:translateX(0)}
to{-webkit-transform:translateX(100%)}
}
@-moz-keyframes slideouttoright{from{-moz-transform:translateX(0)}
to{-moz-transform:translateX(100%)}
}
.slide.out,.slide.in{-webkit-animation-timing-function:ease-out;-webkit-animation-duration:350ms;-moz-animation-timing-function:ease-out;-moz-animation-duration:350ms}
.slide.out{-webkit-transform:translateX(-100%);-webkit-animation-name:slideouttoleft;-moz-transform:translateX(-100%);-moz-animation-name:slideouttoleft}
.slide.in{-webkit-transform:translateX(0);-webkit-animation-name:slideinfromright;-moz-transform:translateX(0);-moz-animation-name:slideinfromright}
.slide.out.reverse{-webkit-transform:translateX(100%);-webkit-animation-name:slideouttoright;-moz-transform:translateX(100%);-moz-animation-name:slideouttoright}
.slide.in.reverse{-webkit-transform:translateX(0);-webkit-animation-name:slideinfromleft;-moz-transform:translateX(0);-moz-animation-name:slideinfromleft}
.slidefade.out{-webkit-transform:translateX(-100%);-webkit-animation-name:slideouttoleft;-moz-transform:translateX(-100%);-moz-animation-name:slideouttoleft;-webkit-animation-duration:225ms;-moz-animation-duration:225ms}
.slidefade.in{-webkit-transform:translateX(0);-webkit-animation-name:fadein;-moz-transform:translateX(0);-moz-animation-name:fadein;-webkit-animation-duration:200ms;-moz-animation-duration:200ms}
.slidefade.out.reverse{-webkit-transform:translateX(100%);-webkit-animation-name:slideouttoright;-moz-transform:translateX(100%);-moz-animation-name:slideouttoright;-webkit-animation-duration:200ms;-moz-animation-duration:200ms}
.slidefade.in.reverse{-webkit-transform:translateX(0);-webkit-animation-name:fadein;-moz-transform:translateX(0);-moz-animation-name:fadein;-webkit-animation-duration:200ms;-moz-animation-duration:200ms}
.slidedown.out{-webkit-animation-name:fadeout;-moz-animation-name:fadeout;-webkit-animation-duration:100ms;-moz-animation-duration:100ms}
.slidedown.in{-webkit-transform:translateY(0);-webkit-animation-name:slideinfromtop;-moz-transform:translateY(0);-moz-animation-name:slideinfromtop;-webkit-animation-duration:250ms;-moz-animation-duration:250ms}
.slidedown.in.reverse{-webkit-animation-name:fadein;-moz-animation-name:fadein;-webkit-animation-duration:150ms;-moz-animation-duration:150ms}
.slidedown.out.reverse{-webkit-transform:translateY(-100%);-moz-transform:translateY(-100%);-webkit-animation-name:slideouttotop;-moz-animation-name:slideouttotop;-webkit-animation-duration:200ms;-moz-animation-duration:200ms}
@-webkit-keyframes slideinfromtop{from{-webkit-transform:translateY(-100%)}
to{-webkit-transform:translateY(0)}
}
@-moz-keyframes slideinfromtop{from{-moz-transform:translateY(-100%)}
to{-moz-transform:translateY(0)}
}
@-webkit-keyframes slideouttotop{from{-webkit-transform:translateY(0)}
to{-webkit-transform:translateY(-100%)}
}
@-moz-keyframes slideouttotop{from{-moz-transform:translateY(0)}
to{-moz-transform:translateY(-100%)}
}
.slideup.out{-webkit-animation-name:fadeout;-moz-animation-name:fadeout;-webkit-animation-duration:100ms;-moz-animation-duration:100ms}
.slideup.in{-webkit-transform:translateY(0);-webkit-animation-name:slideinfrombottom;-moz-transform:translateY(0);-moz-animation-name:slideinfrombottom;-webkit-animation-duration:250ms;-moz-animation-duration:250ms}
.slideup.in.reverse{-webkit-animation-name:fadein;-moz-animation-name:fadein;-webkit-animation-duration:150ms;-moz-animation-duration:150ms}
.slideup.out.reverse{-webkit-transform:translateY(100%);-moz-transform:translateY(100%);-webkit-animation-name:slideouttobottom;-moz-animation-name:slideouttobottom;-webkit-animation-duration:200ms;-moz-animation-duration:200ms}
@-webkit-keyframes slideinfrombottom{from{-webkit-transform:translateY(100%)}
to{-webkit-transform:translateY(0)}
}
@-moz-keyframes slideinfrombottom{from{-moz-transform:translateY(100%)}
to{-moz-transform:translateY(0)}
}
@-webkit-keyframes slideouttobottom{from{-webkit-transform:translateY(0)}
to{-webkit-transform:translateY(100%)}
}
@-moz-keyframes slideouttobottom{from{-moz-transform:translateY(0)}
to{-moz-transform:translateY(100%)}
}
.viewport-flip{-webkit-perspective:1000;-moz-perspective:1000;position:absolute}
.flip{-webkit-backface-visibility:hidden;-webkit-transform:translateX(0);-moz-backface-visibility:hidden;-moz-transform:translateX(0)}
.flip.out{-webkit-transform:rotateY(-90deg) scale(.9);-webkit-animation-name:flipouttoleft;-webkit-animation-duration:175ms;-moz-transform:rotateY(-90deg) scale(.9);-moz-animation-name:flipouttoleft;-moz-animation-duration:175ms}
.flip.in{-webkit-animation-name:flipintoright;-webkit-animation-duration:225ms;-moz-animation-name:flipintoright;-moz-animation-duration:225ms}
.flip.out.reverse{-webkit-transform:rotateY(90deg) scale(.9);-webkit-animation-name:flipouttoright;-moz-transform:rotateY(90deg) scale(.9);-moz-animation-name:flipouttoright}
.flip.in.reverse{-webkit-animation-name:flipintoleft;-moz-animation-name:flipintoleft}
@-webkit-keyframes flipouttoleft{from{-webkit-transform:rotateY(0)}
to{-webkit-transform:rotateY(-90deg) scale(.9)}
}
@-moz-keyframes flipouttoleft{from{-moz-transform:rotateY(0)}
to{-moz-transform:rotateY(-90deg) scale(.9)}
}
@-webkit-keyframes flipouttoright{from{-webkit-transform:rotateY(0)}
to{-webkit-transform:rotateY(90deg) scale(.9)}
}
@-moz-keyframes flipouttoright{from{-moz-transform:rotateY(0)}
to{-moz-transform:rotateY(90deg) scale(.9)}
}
@-webkit-keyframes flipintoleft{from{-webkit-transform:rotateY(-90deg) scale(.9)}
to{-webkit-transform:rotateY(0)}
}
@-moz-keyframes flipintoleft{from{-moz-transform:rotateY(-90deg) scale(.9)}
to{-moz-transform:rotateY(0)}
}
@-webkit-keyframes flipintoright{from{-webkit-transform:rotateY(90deg) scale(.9)}
to{-webkit-transform:rotateY(0)}
}
@-moz-keyframes flipintoright{from{-moz-transform:rotateY(90deg) scale(.9)}
to{-moz-transform:rotateY(0)}
}
.viewport-turn{-webkit-perspective:1000;-moz-perspective:1000;position:absolute}
.turn{-webkit-backface-visibility:hidden;-webkit-transform:translateX(0);-webkit-transform-origin:0 0;-moz-backface-visibility:hidden;-moz-transform:translateX(0);-moz-transform-origin:0 0}
.turn.out{-webkit-transform:rotateY(-90deg) scale(.9);-webkit-animation-name:flipouttoleft;-moz-transform:rotateY(-90deg) scale(.9);-moz-animation-name:flipouttoleft;-webkit-animation-duration:125ms;-moz-animation-duration:125ms}
.turn.in{-webkit-animation-name:flipintoright;-moz-animation-name:flipintoright;-webkit-animation-duration:250ms;-moz-animation-duration:250ms}
.turn.out.reverse{-webkit-transform:rotateY(90deg) scale(.9);-webkit-animation-name:flipouttoright;-moz-transform:rotateY(90deg) scale(.9);-moz-animation-name:flipouttoright}
.turn.in.reverse{-webkit-animation-name:flipintoleft;-moz-animation-name:flipintoleft}
@-webkit-keyframes flipouttoleft{from{-webkit-transform:rotateY(0)}
to{-webkit-transform:rotateY(-90deg) scale(.9)}
}
@-moz-keyframes flipouttoleft{from{-moz-transform:rotateY(0)}
to{-moz-transform:rotateY(-90deg) scale(.9)}
}
@-webkit-keyframes flipouttoright{from{-webkit-transform:rotateY(0)}
to{-webkit-transform:rotateY(90deg) scale(.9)}
}
@-moz-keyframes flipouttoright{from{-moz-transform:rotateY(0)}
to{-moz-transform:rotateY(90deg) scale(.9)}
}
@-webkit-keyframes flipintoleft{from{-webkit-transform:rotateY(-90deg) scale(.9)}
to{-webkit-transform:rotateY(0)}
}
@-moz-keyframes flipintoleft{from{-moz-transform:rotateY(-90deg) scale(.9)}
to{-moz-transform:rotateY(0)}
}
@-webkit-keyframes flipintoright{from{-webkit-transform:rotateY(90deg) scale(.9)}
to{-webkit-transform:rotateY(0)}
}
@-moz-keyframes flipintoright{from{-moz-transform:rotateY(90deg) scale(.9)}
to{-moz-transform:rotateY(0)}
}
.flow{-webkit-transform-origin:50% 30%;-moz-transform-origin:50% 30%;-webkit-box-shadow:0 0 20px rgba(0,0,0,.4);-moz-box-shadow:0 0 20px rgba(0,0,0,.4)}
.ui-dialog.flow{-webkit-transform-origin:none;-moz-transform-origin:none;-webkit-box-shadow:none;-moz-box-shadow:none}
.flow.out{-webkit-transform:translateX(-100%) scale(.7);-webkit-animation-name:flowouttoleft;-webkit-animation-timing-function:ease;-webkit-animation-duration:350ms;-moz-transform:translateX(-100%) scale(.7);-moz-animation-name:flowouttoleft;-moz-animation-timing-function:ease;-moz-animation-duration:350ms}
.flow.in{-webkit-transform:translateX(0) scale(1);-webkit-animation-name:flowinfromright;-webkit-animation-timing-function:ease;-webkit-animation-duration:350ms;-moz-transform:translateX(0) scale(1);-moz-animation-name:flowinfromright;-moz-animation-timing-function:ease;-moz-animation-duration:350ms}
.flow.out.reverse{-webkit-transform:translateX(100%);-webkit-animation-name:flowouttoright;-moz-transform:translateX(100%);-moz-animation-name:flowouttoright}
.flow.in.reverse{-webkit-animation-name:flowinfromleft;-moz-animation-name:flowinfromleft}
@-webkit-keyframes flowouttoleft{0%{-webkit-transform:translateX(0) scale(1)}
60%,70%{-webkit-transform:translateX(0) scale(.7)}
100%{-webkit-transform:translateX(-100%) scale(.7)}
}
@-moz-keyframes flowouttoleft{0%{-moz-transform:translateX(0) scale(1)}
60%,70%{-moz-transform:translateX(0) scale(.7)}
100%{-moz-transform:translateX(-100%) scale(.7)}
}
@-webkit-keyframes flowouttoright{0%{-webkit-transform:translateX(0) scale(1)}
60%,70%{-webkit-transform:translateX(0) scale(.7)}
100%{-webkit-transform:translateX(100%) scale(.7)}
}
@-moz-keyframes flowouttoright{0%{-moz-transform:translateX(0) scale(1)}
60%,70%{-moz-transform:translateX(0) scale(.7)}
100%{-moz-transform:translateX(100%) scale(.7)}
}
@-webkit-keyframes flowinfromleft{0%{-webkit-transform:translateX(-100%) scale(.7)}
30%,40%{-webkit-transform:translateX(0) scale(.7)}
100%{-webkit-transform:translateX(0) scale(1)}
}
@-moz-keyframes flowinfromleft{0%{-moz-transform:translateX(-100%) scale(.7)}
30%,40%{-moz-transform:translateX(0) scale(.7)}
100%{-moz-transform:translateX(0) scale(1)}
}
@-webkit-keyframes flowinfromright{0%{-webkit-transform:translateX(100%) scale(.7)}
30%,40%{-webkit-transform:translateX(0) scale(.7)}
100%{-webkit-transform:translateX(0) scale(1)}
}
@-moz-keyframes flowinfromright{0%{-moz-transform:translateX(100%) scale(.7)}
30%,40%{-moz-transform:translateX(0) scale(.7)}
100%{-moz-transform:translateX(0) scale(1)}
}
.ui-grid-a,.ui-grid-b,.ui-grid-c,.ui-grid-d{overflow:hidden}
.ui-block-a,.ui-block-b,.ui-block-c,.ui-block-d,.ui-block-e{margin:0;padding:0;border:0;float:left;min-height:1px}
.ui-grid-solo .ui-block-a{width:100%;float:none}
.ui-grid-a .ui-block-a,.ui-grid-a .ui-block-b{width:50%}
.ui-grid-a .ui-block-a{clear:left}
.ui-grid-b .ui-block-a,.ui-grid-b .ui-block-b,.ui-grid-b .ui-block-c{width:33.333%}
.ui-grid-b .ui-block-a{clear:left}
.ui-grid-c .ui-block-a,.ui-grid-c .ui-block-b,.ui-grid-c .ui-block-c,.ui-grid-c .ui-block-d{width:25%}
.ui-grid-c .ui-block-a{clear:left}
.ui-grid-d .ui-block-a,.ui-grid-d .ui-block-b,.ui-grid-d .ui-block-c,.ui-grid-d .ui-block-d,.ui-grid-d .ui-block-e{width:20%}
.ui-grid-d .ui-block-a{clear:left}
.ui-header-fixed,.ui-footer-fixed{left:0;right:0;width:100%;position:fixed;z-index:1000}
.ui-header-fixed{top:0}
.ui-footer-fixed{bottom:0}
.ui-header-fullscreen,.ui-footer-fullscreen{opacity:.9}
.ui-page-header-fixed{padding-top:2.5em}
.ui-page-footer-fixed{padding-bottom:3em}
.ui-page-header-fullscreen .ui-content,.ui-page-footer-fullscreen .ui-content{padding:0}
.ui-fixed-hidden{position:absolute}
.ui-page-header-fullscreen .ui-fixed-hidden,.ui-page-footer-fullscreen .ui-fixed-hidden{left:-99999em}
.ui-header-fixed .ui-btn,.ui-footer-fixed .ui-btn{z-index:10}
.ui-navbar{overflow:hidden}
.ui-navbar ul,.ui-navbar-expanded ul{list-style:none;padding:0;margin:0;position:relative;display:block;border:0}
.ui-navbar-collapsed ul{float:left;width:75%;margin-right:-2px}
.ui-navbar-collapsed .ui-navbar-toggle{float:left;width:25%}
.ui-navbar li.ui-navbar-truncate{position:absolute;left:-9999px;top:-9999px}
.ui-navbar li .ui-btn,.ui-navbar .ui-navbar-toggle .ui-btn{display:block;font-size:12px;text-align:center;margin:0;border-right-width:0;max-width:100%}
.ui-navbar li .ui-btn{margin-right:-1px}
.ui-navbar li .ui-btn:last-child{margin-right:0}
.ui-header .ui-navbar li .ui-btn,.ui-header .ui-navbar .ui-navbar-toggle .ui-btn,.ui-footer .ui-navbar li .ui-btn,.ui-footer .ui-navbar .ui-navbar-toggle .ui-btn{border-top-width:0;border-bottom-width:0}
.ui-navbar .ui-btn-inner{padding-left:2px;padding-right:2px}
.ui-navbar-noicons li .ui-btn .ui-btn-inner,.ui-navbar-noicons .ui-navbar-toggle .ui-btn-inner{padding-top:.8em;padding-bottom:.9em}
.ui-navbar-expanded .ui-btn{margin:0;font-size:14px}
.ui-navbar-expanded .ui-btn-inner{padding-left:5px;padding-right:5px}
.ui-navbar-expanded .ui-btn-icon-top .ui-btn-inner{padding:45px 5px 15px;text-align:center}
.ui-navbar-expanded .ui-btn-icon-top .ui-icon{top:15px}
.ui-navbar-expanded .ui-btn-icon-bottom .ui-btn-inner{padding:15px 5px 45px;text-align:center}
.ui-navbar-expanded .ui-btn-icon-bottom .ui-icon{bottom:15px}
.ui-navbar-expanded li .ui-btn .ui-btn-inner{min-height:2.5em}
.ui-navbar-expanded .ui-navbar-noicons .ui-btn .ui-btn-inner{padding-top:1.8em;padding-bottom:1.9em}
.ui-btn{display:block;text-align:center;cursor:pointer;position:relative;margin:.5em 5px;padding:0}
.ui-mini{margin:.25em 5px}
.ui-btn-inner{padding:.6em 20px;min-width:.75em;display:block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;position:relative;zoom:1}
.ui-btn input,.ui-btn button{z-index:2}
.ui-btn-left,.ui-btn-right,.ui-btn-inline{display:inline-block}
.ui-btn-block{display:block}
.ui-header .ui-btn,.ui-footer .ui-btn{display:inline-block;margin:0}
.ui-header .ui-btn-inner,.ui-footer .ui-btn-inner,.ui-mini .ui-btn-inner{font-size:12.5px;padding:.55em 11px .5em}
.ui-header .ui-fullsize .ui-btn-inner,.ui-footer .ui-fullsize .ui-btn-inner{font-size:16px;padding:.6em 25px}
.ui-btn-icon-notext{width:24px;height:24px}
.ui-btn-icon-notext .ui-btn-inner{padding:0;height:100%}
.ui-btn-icon-notext .ui-btn-inner .ui-icon{margin:2px 1px 2px 3px}
.ui-btn-text{position:relative;z-index:1;width:100%}
.ui-btn-icon-notext .ui-btn-text{position:absolute;left:-9999px}
.ui-btn-icon-left .ui-btn-inner{padding-left:40px}
.ui-btn-icon-right .ui-btn-inner{padding-right:40px}
.ui-btn-icon-top .ui-btn-inner{padding-top:40px}
.ui-btn-icon-bottom .ui-btn-inner{padding-bottom:40px}
.ui-header .ui-btn-icon-left .ui-btn-inner,.ui-footer .ui-btn-icon-left .ui-btn-inner,.ui-mini .ui-btn-icon-left .ui-btn-inner{padding-left:30px}
.ui-header .ui-btn-icon-right .ui-btn-inner,.ui-footer .ui-btn-icon-right .ui-btn-inner,.ui-mini .ui-btn-icon-right .ui-btn-inner{padding-right:30px}
.ui-header .ui-btn-icon-top .ui-btn-inner,.ui-footer .ui-btn-icon-top .ui-btn-inner,.ui-mini .ui-btn-icon-top .ui-btn-inner{padding:30px 3px .5em 3px}
.ui-header .ui-btn-icon-bottom .ui-btn-inner,.ui-footer .ui-btn-icon-bottom .ui-btn-inner,.ui-mini .ui-btn-icon-bottom .ui-btn-inner{padding:.55em 3px 30px 3px}
.ui-btn-icon-notext .ui-icon{display:block;z-index:0}
.ui-btn-icon-left .ui-btn-inner .ui-icon,.ui-btn-icon-right .ui-btn-inner .ui-icon{position:absolute;top:50%;margin-top:-9px}
.ui-btn-icon-top .ui-btn-inner .ui-icon,.ui-btn-icon-bottom .ui-btn-inner .ui-icon{position:absolute;left:50%;margin-left:-9px}
.ui-btn-icon-left .ui-icon{left:10px}
.ui-btn-icon-right .ui-icon{right:10px}
.ui-btn-icon-top .ui-icon{top:10px}
.ui-btn-icon-bottom .ui-icon{top:auto;bottom:10px}
.ui-header .ui-btn-icon-left .ui-icon,.ui-footer .ui-btn-icon-left .ui-icon,.ui-mini.ui-btn-icon-left .ui-icon,.ui-mini .ui-btn-icon-left .ui-icon{left:5px}
.ui-header .ui-btn-icon-right .ui-icon,.ui-footer .ui-btn-icon-right .ui-icon,.ui-mini.ui-btn-icon-right .ui-icon,.ui-mini .ui-btn-icon-right .ui-icon{right:5px}
.ui-header .ui-btn-icon-top .ui-icon,.ui-footer .ui-btn-icon-top .ui-icon,.ui-mini.ui-btn-icon-top .ui-icon,.ui-mini .ui-btn-icon-top .ui-icon{top:5px}
.ui-header .ui-btn-icon-bottom .ui-icon,.ui-footer .ui-btn-icon-bottom .ui-icon,.ui-mini.ui-btn-icon-bottom .ui-icon,.ui-mini .ui-btn-icon-bottom .ui-icon{bottom:5px}
.ui-btn-hidden{position:absolute;top:0;left:0;width:100%;height:100%;-webkit-appearance:button;opacity:.1;cursor:pointer;background:#fff;background:rgba(255,255,255,0);filter:Alpha(Opacity=.0001);font-size:1px;border:0;text-indent:-9999px}
.ui-collapsible{margin:.5em 0}
.ui-collapsible-heading{font-size:16px;display:block;margin:0 -8px;padding:0;border-width:0 0 1px 0;position:relative}
.ui-collapsible-heading a{text-align:left;margin:0}
.ui-collapsible-heading .ui-btn-inner,.ui-collapsible-heading .ui-btn-icon-left .ui-btn-inner{padding-left:40px}
.ui-collapsible-heading .ui-btn-icon-right .ui-btn-inner{padding-left:12px;padding-right:40px}
.ui-collapsible-heading .ui-btn-icon-top .ui-btn-inner,.ui-collapsible-heading .ui-btn-icon-bottom .ui-btn-inner{padding-right:40px;text-align:center}
.ui-collapsible-heading a span.ui-btn{position:absolute;left:6px;top:50%;margin:-12px 0 0 0;width:20px;height:20px;padding:1px 0 1px 2px;text-indent:-9999px}
.ui-collapsible-heading a span.ui-btn .ui-btn-inner{padding:10px 0}
.ui-collapsible-heading a span.ui-btn .ui-icon{left:0;margin-top:-10px}
.ui-collapsible-heading-status{position:absolute;top:-9999px;left:0}
.ui-collapsible-content{display:block;margin:0 -8px;padding:10px 16px;border-top:0;background-image:none;font-weight:normal}
.ui-collapsible-content-collapsed{display:none}
.ui-collapsible-set{margin:.5em 0}
.ui-collapsible-set .ui-collapsible{margin:-1px 0 0}
.ui-controlgroup,fieldset.ui-controlgroup{padding:0;margin:0 0 .5em;zoom:1}
.ui-bar .ui-controlgroup{margin:0 .3em}
.ui-controlgroup-label{font-size:16px;line-height:1.4;font-weight:normal;margin:0 0 .4em}
.ui-controlgroup-controls{display:block;width:100%}
.ui-controlgroup li{list-style:none}
.ui-controlgroup-vertical .ui-btn,.ui-controlgroup-vertical .ui-checkbox,.ui-controlgroup-vertical .ui-radio{margin:0;border-bottom-width:0}
.ui-controlgroup-controls label.ui-select{position:absolute;left:-9999px}
.ui-controlgroup-vertical .ui-controlgroup-last{border-bottom-width:1px}
.ui-controlgroup-horizontal{padding:0}
.ui-controlgroup-horizontal .ui-btn-inner{text-align:center}
.ui-controlgroup-horizontal .ui-btn,.ui-controlgroup-horizontal .ui-select{display:inline-block;margin:0 -6px 0 0}
.ui-controlgroup-horizontal .ui-checkbox,.ui-controlgroup-horizontal .ui-radio{float:left;clear:none;margin:0 -1px 0 0}
.ui-controlgroup-horizontal .ui-checkbox .ui-btn,.ui-controlgroup-horizontal .ui-radio .ui-btn,.ui-controlgroup-horizontal .ui-checkbox:last-child,.ui-controlgroup-horizontal .ui-radio:last-child{margin-right:0}
.ui-controlgroup-horizontal .ui-controlgroup-last{margin-right:0}
.ui-controlgroup .ui-checkbox label,.ui-controlgroup .ui-radio label{font-size:16px}
@media all and (min-width:450px){.ui-field-contain .ui-controlgroup-label{vertical-align:top;display:inline-block;width:20%;margin:0 2% 0 0}
.ui-field-contain .ui-controlgroup-controls{width:60%;display:inline-block}
.ui-field-contain .ui-controlgroup .ui-select{width:100%}
.ui-field-contain .ui-controlgroup-horizontal .ui-select{width:auto}
}
.ui-dialog{background:none!important}
.ui-dialog-contain{width:92.5%;max-width:500px;margin:10% auto 15px auto;padding:0}
.ui-dialog .ui-header{margin-top:15%;border:0;overflow:hidden}
.ui-dialog .ui-header,.ui-dialog .ui-content,.ui-dialog .ui-footer{display:block;position:relative;width:auto}
.ui-dialog .ui-header,.ui-dialog .ui-footer{z-index:10;padding:0}
.ui-dialog .ui-footer{padding:0 15px}
.ui-dialog .ui-content{padding:15px}
.ui-dialog{margin-top:-15px}
.ui-checkbox,.ui-radio{position:relative;clear:both;margin:.2em 0 .5em;z-index:1}
.ui-checkbox .ui-btn,.ui-radio .ui-btn{margin:0;text-align:left;z-index:2}
.ui-checkbox .ui-btn-inner,.ui-radio .ui-btn-inner{white-space:normal}
.ui-checkbox .ui-btn-icon-left .ui-btn-inner,.ui-radio .ui-btn-icon-left .ui-btn-inner{padding-left:45px}
.ui-checkbox .ui-mini.ui-btn-icon-left .ui-btn-inner,.ui-radio .ui-mini.ui-btn-icon-left .ui-btn-inner{padding-left:36px}
.ui-checkbox .ui-btn-icon-right .ui-btn-inner,.ui-radio .ui-btn-icon-right .ui-btn-inner{padding-right:45px}
.ui-checkbox .ui-mini.ui-btn-icon-right .ui-btn-inner,.ui-radio .ui-mini.ui-btn-icon-right .ui-btn-inner{padding-right:36px}
.ui-checkbox .ui-btn-icon-top .ui-btn-inner,.ui-radio .ui-btn-icon-top .ui-btn-inner{padding-right:0;padding-left:0;text-align:center}
.ui-checkbox .ui-btn-icon-bottom .ui-btn-inner,.ui-radio .ui-btn-icon-bottom .ui-btn-inner{padding-right:0;padding-left:0;text-align:center}
.ui-checkbox .ui-icon,.ui-radio .ui-icon{top:1.1em}
.ui-checkbox .ui-btn-icon-left .ui-icon,.ui-radio .ui-btn-icon-left .ui-icon{left:15px}
.ui-checkbox .ui-mini.ui-btn-icon-left .ui-icon,.ui-radio .ui-mini.ui-btn-icon-left .ui-icon{left:9px}
.ui-checkbox .ui-btn-icon-right .ui-icon,.ui-radio .ui-btn-icon-right .ui-icon{right:15px}
.ui-checkbox .ui-mini.ui-btn-icon-right .ui-icon,.ui-radio .ui-mini.ui-btn-icon-right .ui-icon{right:9px}
.ui-checkbox .ui-btn-icon-top .ui-icon,.ui-radio .ui-btn-icon-top .ui-icon{top:10px}
.ui-checkbox .ui-btn-icon-bottom .ui-icon,.ui-radio .ui-btn-icon-bottom .ui-icon{top:auto;bottom:10px}
.ui-checkbox .ui-btn-icon-right .ui-icon,.ui-radio .ui-btn-icon-right .ui-icon{right:15px}
.ui-checkbox .ui-mini.ui-btn-icon-right .ui-icon,.ui-radio .ui-mini.ui-btn-icon-right .ui-icon{right:9px}
.ui-checkbox input,.ui-radio input{position:absolute;left:20px;top:50%;width:10px;height:10px;margin:-5px 0 0 0;outline:0!important;z-index:1}
.ui-field-contain,fieldset.ui-field-contain{padding:.8em 0;margin:0;border-width:0 0 1px 0;overflow:visible}
.ui-field-contain:first-child{border-top-width:0}
.ui-header .ui-field-contain-left,.ui-header .ui-field-contain-right{position:absolute;top:0;width:25%}
.ui-header .ui-field-contain-left{left:1em}
.ui-header .ui-field-contain-right{right:1em}
@media all and (min-width:450px){.ui-field-contain,.ui-mobile fieldset.ui-field-contain{border-width:0;padding:0;margin:1em 0}
}
.ui-select{display:block;position:relative}
.ui-select select{position:absolute;left:-9999px;top:-9999px}
.ui-select .ui-btn{overflow:hidden;opacity:1;margin:0}
.ui-select .ui-btn select{cursor:pointer;-webkit-appearance:button;left:0;top:0;width:100%;min-height:1.5em;min-height:100%;height:3em;max-height:100%;opacity:0;-ms-filter:"alpha(opacity=0)";filter:alpha(opacity=0);z-index:2}
.ui-select .ui-disabled{opacity:.3}
@-moz-document url-prefix(){.ui-select .ui-btn select{opacity:.0001}
}
.ui-select .ui-btn select.ui-select-nativeonly{opacity:1;text-indent:0}
.ui-select .ui-btn-icon-right .ui-btn-inner{padding-right:45px}
.ui-select .ui-btn-icon-right .ui-icon{right:15px}
.ui-select .ui-mini.ui-btn-icon-right .ui-icon{right:7px}
label.ui-select{font-size:16px;line-height:1.4;font-weight:normal;margin:0 0 .3em;display:block}
.ui-select .ui-btn-text,.ui-selectmenu .ui-btn-text{display:block;min-height:1em;overflow:hidden!important}
.ui-select .ui-btn-text{text-overflow:ellipsis}
.ui-selectmenu{position:absolute;padding:0;z-index:1100!important;width:80%;max-width:350px;padding:6px}
.ui-selectmenu .ui-listview{margin:0}
.ui-selectmenu .ui-btn.ui-li-divider{cursor:default}
.ui-selectmenu-hidden{top:-9999px;left:-9999px}
.ui-selectmenu-screen{position:absolute;top:0;left:0;width:100%;height:100%;z-index:99}
.ui-screen-hidden,.ui-selectmenu-list .ui-li .ui-icon{display:none}
.ui-selectmenu-list .ui-li .ui-icon{display:block}
.ui-li.ui-selectmenu-placeholder{display:none}
.ui-selectmenu .ui-header .ui-title{margin:.6em 46px .8em}
@media all and (min-width:450px){.ui-field-contain label.ui-select{vertical-align:top;display:inline-block;width:20%;margin:0 2% 0 0}
.ui-field-contain .ui-select{width:60%;display:inline-block}
}
.ui-selectmenu .ui-header h1:after{content:'.';visibility:hidden}
label.ui-input-text{font-size:16px;line-height:1.4;display:block;font-weight:normal;margin:0 0 .3em}
input.ui-input-text,textarea.ui-input-text{background-image:none;padding:.4em;line-height:1.4;font-size:16px;display:block;width:97%;outline:0}
.ui-header input.ui-input-text,.ui-footer input.ui-input-text{margin-left:1.25%;padding:.4em 1%;width:95.5%}
input.ui-input-text{-webkit-appearance:none}
textarea.ui-input-text{height:50px;-webkit-transition:height 200ms linear;-moz-transition:height 200ms linear;-o-transition:height 200ms linear;transition:height 200ms linear}
.ui-input-search{padding:0 30px;background-image:none;position:relative}
.ui-icon-searchfield:after{position:absolute;left:7px;top:50%;margin-top:-9px;content:"";width:18px;height:18px;opacity:.5}
.ui-input-search input.ui-input-text{border:0;width:98%;padding:.4em 0;margin:0;display:block;background:transparent none;outline:0!important}
.ui-input-search .ui-input-clear{position:absolute;right:0;top:50%;margin-top:-13px}
.ui-mini .ui-input-clear{right:-3px}
.ui-input-search .ui-input-clear-hidden{display:none}
input.ui-mini,.ui-mini input,textarea.ui-mini{font-size:14px}
textarea.ui-mini{height:45px}
</style>
<style type="text/css">
@media all and (min-width:450px){.ui-field-contain label.ui-input-text{vertical-align:top;display:inline-block;width:20%;margin:0 2% 0 0}
.ui-field-contain input.ui-input-text,.ui-field-contain textarea.ui-input-text,.ui-field-contain .ui-input-search{width:60%;display:inline-block}
.ui-field-contain .ui-input-search{width:50%}
.ui-hide-label input.ui-input-text,.ui-hide-label textarea.ui-input-text,.ui-hide-label .ui-input-search{padding:.4em;width:97%}
.ui-input-search input.ui-input-text{width:98%}
}
.ui-listview{margin:0;counter-reset:listnumbering}
.ui-content .ui-listview{margin:-15px}
.ui-content .ui-listview-inset{margin:1em 0}
.ui-listview,.ui-li{list-style:none;padding:0}
.ui-li,.ui-li.ui-field-contain{display:block;margin:0;position:relative;overflow:visible;text-align:left;border-width:0;border-top-width:1px}
.ui-li .ui-btn-text a.ui-link-inherit{text-overflow:ellipsis;overflow:hidden;white-space:nowrap}
.ui-li-divider,.ui-li-static{padding:.5em 15px;font-size:14px;font-weight:bold}
.ui-li-divider{counter-reset:listnumbering}
ol.ui-listview .ui-link-inherit:before,ol.ui-listview .ui-li-static:before,.ui-li-dec{font-size:.8em;display:inline-block;padding-right:.3em;font-weight:normal;counter-increment:listnumbering;content:counter(listnumbering) ". "}
ol.ui-listview .ui-li-jsnumbering:before{content:""!important}
.ui-listview-inset .ui-li{border-right-width:1px;border-left-width:1px}
.ui-li:last-child,.ui-li.ui-field-contain:last-child{border-bottom-width:1px}
.ui-li>.ui-btn-inner{display:block;position:relative;padding:0}
.ui-li .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li{padding:.7em 15px .7em 15px;display:block}
.ui-li-has-thumb .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-thumb{min-height:60px;padding-left:100px}
.ui-li-has-icon .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-icon{min-height:20px;padding-left:40px}
.ui-li-has-count .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-count{padding-right:45px}
.ui-li-has-arrow .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-arrow{padding-right:30px}
.ui-li-has-arrow.ui-li-has-count .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-arrow.ui-li-has-count{padding-right:75px}
.ui-li-has-count .ui-btn-text{padding-right:15px}
.ui-li-heading{font-size:16px;font-weight:bold;display:block;margin:.6em 0;text-overflow:ellipsis;overflow:hidden;white-space:nowrap}
.ui-li-desc{font-size:12px;font-weight:normal;display:block;margin:-.5em 0 .6em;text-overflow:ellipsis;overflow:hidden;white-space:nowrap}
.ui-li-thumb,.ui-listview .ui-li-icon{position:absolute;left:1px;top:0;max-height:80px;max-width:80px}
.ui-listview .ui-li-icon{max-height:40px;max-width:40px;left:10px;top:.9em}
.ui-li-thumb,.ui-listview .ui-li-icon,.ui-li-content{float:left;margin-right:10px}
.ui-li-aside{float:right;width:50%;text-align:right;margin:.3em 0}
@media all and (min-width:480px){
  .ui-li-aside{width:45%}
}
.ui-li-divider{cursor:default}
.ui-li-has-alt .ui-btn-inner a.ui-link-inherit,.ui-li-static.ui-li-has-alt{padding-right:95px}
.ui-li-has-count .ui-li-count{position:absolute;font-size:11px;font-weight:bold;padding:.2em .5em;top:50%;margin-top:-.9em;right:48px}
.ui-li-divider .ui-li-count,.ui-li-static .ui-li-count{right:10px}
.ui-li-has-alt .ui-li-count{right:55px}
.ui-li-link-alt{position:absolute;width:40px;height:100%;border-width:0;border-left-width:1px;top:0;right:0;margin:0;padding:0;z-index:2}
.ui-li-link-alt .ui-btn{overflow:hidden;position:absolute;right:8px;top:50%;margin:-11px 0 0 0;border-bottom-width:1px;z-index:-1}
.ui-li-link-alt .ui-btn-inner{padding:0;height:100%;position:absolute;width:100%;top:0;left:0}
.ui-li-link-alt .ui-btn .ui-icon{right:50%;margin-right:-9px}
.ui-listview * .ui-btn-inner>.ui-btn>.ui-btn-inner{border-top:0}
.ui-listview-filter{border-width:0;overflow:hidden;margin:-15px -15px 15px -15px}
.ui-listview-filter .ui-input-search{margin:5px;width:auto;display:block}
.ui-listview-filter-inset{margin:-15px -5px -15px -5px;background:transparent}
.ui-li.ui-screen-hidden{display:none}
@media only screen and (min-device-width:768px) and (max-device-width:1024px){
  .ui-li .ui-btn-text{overflow:visible}
}
label.ui-slider{font-size:16px;line-height:1.4;font-weight:normal;margin:0 0 .3em;display:block}
input.ui-slider-input,.ui-field-contain input.ui-slider-input{display:inline-block;width:50px}
select.ui-slider-switch{display:none}
div.ui-slider{position:relative;display:inline-block;overflow:visible;height:15px;padding:0;margin:0 2% 0 20px;top:4px;width:65%}
div.ui-slider-mini{height:12px;margin-left:10px}
div.ui-slider-bg{border:0;height:100%;padding-right:8px}
.ui-controlgroup a.ui-slider-handle,a.ui-slider-handle{position:absolute;z-index:1;top:50%;width:28px;height:28px;margin-top:-15px;margin-left:-15px;outline:0}
a.ui-slider-handle .ui-btn-inner{padding:0;height:100%}
div.ui-slider-mini a.ui-slider-handle{height:14px;width:14px;margin:-8px 0 0 -7px}
div.ui-slider-mini a.ui-slider-handle .ui-btn-inner{height:30px;width:30px;padding:0;margin:-9px 0 0 -9px}
@media all and (min-width:450px){
.ui-field-contain label.ui-slider{vertical-align:top;display:inline-block;width:20%;margin:0 2% 0 0}
.ui-field-contain div.ui-slider{width:43%}
.ui-field-contain div.ui-slider-switch{width:5.5em}
}
div.ui-slider-switch{height:32px;margin-left:0;width:5.8em}
a.ui-slider-handle-snapping{-webkit-transition:left 70ms linear;-moz-transition:left 70ms linear}
div.ui-slider-switch .ui-slider-handle{margin-top:1px}
.ui-slider-inneroffset{margin:0 16px;position:relative;z-index:1}
div.ui-slider-switch.ui-slider-mini{width:5em;height:29px}
div.ui-slider-switch.ui-slider-mini .ui-slider-inneroffset{margin:0 15px 0 14px}
div.ui-slider-switch.ui-slider-mini .ui-slider-handle{width:25px;height:25px;margin:1px 0 0 -13px}
div.ui-slider-switch.ui-slider-mini a.ui-slider-handle .ui-btn-inner{height:30px;width:30px;padding:0;margin:0}
span.ui-slider-label{position:absolute;text-align:center;width:100%;overflow:hidden;font-size:16px;top:0;line-height:2;min-height:100%;border-width:0;white-space:nowrap}
.ui-slider-mini span.ui-slider-label{font-size:14px}
span.ui-slider-label-a{z-index:1;left:0;text-indent:-1.5em}
span.ui-slider-label-b{z-index:0;right:0;text-indent:1.5em}
.ui-slider-inline{width:120px;display:inline-block}

.mobile{width:90%;margin:0 auto 0;}
.tablet{width:80%;margin:0 auto 0;}
.desk{width:60%;margin:0 auto 0;}
.row1 {width:40%}
.row2 {width:30%}
.row3 {width:20%}
.center{text-align:center;margin:0 auto 0;}
.small {font-size:small;font-weight:400}
.max {max-width:400px;margin:0 auto 0}
#page1{display:block;}
fieldset{border:0;}
#dom{padding-left:2em;}
</style>
</head>
<body>
<div style="padding-top: 84px; padding-bottom: 15px; min-height: 666px;" class="ui-page
ui-body-a
ui-page-header-fixed
ui-page-footer-fixed
ui-page-active" 
tabindex="0"
data-url="page1"
data-role="page"
data-theme="a" id="page1">
<div role="banner" class="ui-header
ui-bar-a
ui-header-fixed slidedown"
data-role="header"
data-theme="a"
data-position="fixed">
<h2 aria-level="1" role="heading" class="ui-title">Allermetrix<br>Authorized Users Only</h2>
<div>
<p class="center">
An Unauthorized Attempt to Access this Site is Violation of United States  and International&nbsp;Law
</p>
</div>
</div>
<div role="main"
data-role="content"
data-theme="a" class="desk
ui-content
ui-body-a">
<form method="post" action="https://dev.amxemr.com/enter.php"
data-ajax="false">
<input name="sub" value="0" type="hidden">
<div class="ui-field-contain
ui-body
ui-br"
data-role="fieldcontain">
<fieldset class="ui-corner-all
ui-controlgroup
ui-controlgroup-vertical"
data-role="controlgroup">
<label class="ui-input-text" for="id">
User ID
</label>
<input class="ui-input-text
ui-body-a
ui-corner-all
ui-shadow-inset" id="id" name="id" placeholder="" value="" type="text">
</fieldset>
</div>
<div class="ui-field-contain
ui-body
ui-br"
data-role="fieldcontain">
<fieldset class="ui-corner-all
ui-controlgroup
ui-controlgroup-vertical"
data-role="controlgroup">
<label class="ui-input-text" for="pwh">
Unexposed Passcode
</label>
<input class="ui-input-text
ui-body-a
ui-corner-all
ui-shadow-inset" id="pwh" name="pwh" placeholder="" value="" type="password">
</fieldset>
</div>
<div class="ui-field-contain
ui-body
ui-br"
data-role="fieldcontain">
<fieldset class="ui-corner-all
ui-controlgroup
ui-controlgroup-vertical"
data-role="controlgroup">
<label class="ui-input-text" for="pw">
Visible Passcode 
</label>
<input class="ui-input-text
ui-body-a
ui-corner-all
ui-shadow-inset" id="pw" name="pw" placeholder="" value="" type="text">
</fieldset>
</div>
<div class="max">
<div aria-disabled="false" class="ui-btn
ui-shadow
ui-btn-corner-all
ui-fullsize
ui-btn-block
ui-btn-up-a"
data-mini="false"
data-inline="false"
data-theme="a"
data-iconpos="null"
data-icon="null"
data-wrapperels="span"
data-iconshadow="true"
data-shadow="true"
data-corners="true">
<span class="ui-btn-inner
ui-btn-corner-all">
<span class="ui-btn-text">Login</span>
</span>
<input aria-disabled="false" class="ui-btn-hidden" value="Login" type="submit">
</div>
</div>
</form>
<hr>
<div>
<h1>HIPAA WARNING</h1>
<p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and 164
Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p>
<p>
Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply
with its policies and procedures.
</p>
</div>
</div>
<hr/>
<div id="dom"></div>
</div>
<script type="text/javascript"> 
//<![CDATA[
var styles = new Object();
var tags = new Object();
var txt = '';
var label = '<br/>1) =============labels=======================<br/>';
function getpage(){
var id = document.querySelectorAll('[id]');
for (var i=0; i<id.length; i++){
var did = id[i].getAttribute("id");
  styles[did] = true;
  txt = txt + ' did: ' + did + '<br/>';
}
txt = txt + '<br/>2) ------------------------------------------------<br/>'
var s = document.getElementsByTagName('*');
console.log("ElementsByTagName");  console.log(s);


for (var i=0; i<s.length; i++){
  var classes = new Object();
  var cl = s[i].classList;
  if(cl.length == 0){continue;}
             //   console.log('Tag');console.log(s[i]);
  for (var c=0; c<s.length; c++){
    if(typeof cl[c] == 'string'){
      classes[cl[c]] = true;
      txt = txt + '<br/>' + s[i].localName + ' => ' +  cl[c];
      styles[cl[c]] = true;
    }
  }
  tags[s[i].localName] = classes;
}
console.log('styles');console.log(styles);
console.log('tags');console.log(tags);
var match = true;
var uSelector = '';
var tf = '';
var unused = '<br/>----------------- unused -------------------------------<br/>';
var used = '<br/>----------------- used -------------------------------<br/>';



var ss = document.styleSheets;     console.log('ss');console.log(ss);
for (var i=0; i<ss.length; i++){
txt = txt + '<br/>i=' + i + '--------------------- used 1 ---------------------------<br/>'
  var cr = document.styleSheets[i].cssRules;      //           console.log('cssRules');console.log(cr);
  for (var r=0; r<cr.length; r++){
    var st = cr[r].selectorText;
    t= cr[r].cssText;
    var pos = t.indexOf('{');
    var rule = t.substring(pos,t.length);
    if(typeof st == 'string'){
      var cl = st.split(", ");                          //             console.log('ss.selector');console.log(cl);
      for (var c=0; c<cl.length; c++){
        var type = cl[c].substring(0,1);
        if(type == '.' || type == '#' ){
          t = cl[c].substring(1,48);
          if(styles[t] === true){
            txt = txt + '<br/>' + type + t + rule; 
          }
          else{
            var space = t.split(' ');
            var len = space.length;
            if(len > 1){
              len = len - 1;
              match = true;
              uSelector = '';
              for (var u=0; u<len; u++){
                match = styles[space[u]] && match;
                if(styles[space[u]]){tf = '+true'}else{tf = '-false'}
                uSelector = uSelector + space[u] + tf + ', ' ;
              }
              if(match){txt = txt + '<br/>' + type + t + rule;}
              else{unused = unused + '<br/>' + len + '] ' + type + uSelector ;}
            }
          }
        }
        else{
		  var space = t.split(' ');
          pos = cl[c].indexOf('.');
          var tag = cl[c].substring(0,pos);
          label = label + '<br/>' + tag + '=>' + cl[c];
          t = cl[c].substring(1,32);
          if(tags[tag]){
            txt = txt + '<br/>| ' + tag + ' rule: ' + rule; 
          }
          else{
            var space = t.split(' ');
            var len = space.length;
            if(tags[space[0]]){
              if(len == 2){
			    if(tags[space[0]][space[1]]){
			      txt = txt + '<br/>' + t + rule;
				}
				else{
				  unused = unused + '<br/>' + len + '| ' + type + t ;
				}
			  }
			  else{
				unused = unused + '<br/>' + len + '| ' + type + t ;
			  }
			}
			if(len > 2){
              len = len - 1;
              match = true;
              uSelector = '';
              for (var u=1; u<len; u++){
                match = styles[space[u]] && match;
                if(styles[space[u]]){tf = '+true'}else{tf = '-false'}
                uSelector = uSelector + space[u] + tf + ', ' ;
              }
              if(match){txt = txt + '<br/>' + type + t + rule;}
              else{unused = unused + '<br/>' + len + '| ' + type + uSelector ;}
            }
          }
        }
      }
    }
  }
}
input=>input.ui-input-text
 document.getElementById('dom').innerHTML = label + txt + used + unused ;
}

window.onload = getpage;
//]]>
</script></body></html>
</body>
</html>
EOT;
