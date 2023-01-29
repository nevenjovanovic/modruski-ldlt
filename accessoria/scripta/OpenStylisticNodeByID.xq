(: open node :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $id := (14004);
for $i in $id
for $phr in db:open-id($dbrhet, $i)
return ($i , normalize-space($phr))