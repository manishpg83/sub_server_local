<?
$video = $_POST['playVideo'];
$video = $_GET['playVideo'];
if ($video < 1){$video = 3;}
if ($video == 1){
  $play = "https://dev.amxemr.com/video/diet.mp4";
}
if ($video == 2){
  $play = "https://dev.amxemr.com/video/ordering.mp4";
}
if ($video == 3){
  $play = "https://dev.amxemr.com/video/eOffice.mp4";
}
if ($video == 4){
  $play = "https://dev.amxemr.com/video/request.mp4";
}
//$play = "https://dev.amxemr.com/video/request.mp4";
echo <<<EOT
<!DOCTYPE html>
<html><head><title>Allermetrix Client Portal</title><style>
#frame{width:640;}
.btn4{background-image: linear-gradient(to bottom, rgba(0,0,180,1) 0%, rgba(0,0,30,1) 100%);}
.btn4{border-color:coral;border:1px;width:209px;font:700 1.1em Arial,sans-serif;color:#fff; padding-top:5px;height:40px;display:inline-block;text-align:center;}
</style>
</head><body>
<div id="frame">
<video id="video" controls width="1024" autoplay>
   <source src= "$play" />
</video><br>
<button  onclick="history.back()" class="btn4">Back</button>
</div>
<script>
const video = document.getElementById("video");
video.addEventListener("play", handleFirstPlay, false);
let hasPlayed = false;
function handleFirstPlay(event) {
  if (!hasPlayed) {
    hasPlayed = true;

    // Remove listener so this only gets called once.
    const vid = event.target;
    vid.removeEventListener("play", handleFirstPlay);

    // Start whatever you need to do after first playback has started
  }
}
</script>
</html>

EOT;


?>