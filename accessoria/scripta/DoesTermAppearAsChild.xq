(: does one stylistic term appear as child of the other in phr :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $pair := ("#dicolon", "#bimembre");
for $p in db:open($dbrhet)//*:phr
where $p[matches(@ana, $pair[2])]
return $p/*:phr[matches(@ana, $pair[1])]