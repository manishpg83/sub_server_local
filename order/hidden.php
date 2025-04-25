<?php
echo <<<EOT

<input type="hidden" name="client" value="$client"/>
<input type="hidden" name="rec" value="$rec" /> 
<input type="hidden" name="volume" value="$volume" /> 
<input type="hidden" name="Accession" value="$Accession"/> 
<input type="hidden" name="billing" value="$billing"/>
<input type="hidden" name="first" value="$first"/>
<input type="hidden" name="last" value="$last"/>
<input type="hidden" name="dob" value="$dob"/>
<input type="hidden" name="Address" value="$address"/>
<input type="hidden" name="city" value="$city"/>
<input type="hidden" name="state" value="$state"/>
<input type="hidden" name="zip" value="$zip"/>
<input type="hidden" name="phone" value="$phone"/>
<input type="hidden" name="email" value="$email"/>
<input type="hidden" name="collection" value="$collection"/>
<input type="hidden" name="celiac" value="$celiac"/>
<input type="hidden" name="onhold" value="$onhold"/>
<input type="hidden" name="gender" value="$gender"/>
<input type="hidden" name="testpath" value="$testpath"/>

EOT;
?>