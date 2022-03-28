(: a list of stylistic annotations (@ana values) for concordance :)
declare variable $dbrhet := "modr-riar-stil";
for $s in db:open($dbrhet)//*:phr
let $n := db:node-id($s)
let $ana:= $s/@ana/string()
return ( $n || ": " || $ana || " \" )