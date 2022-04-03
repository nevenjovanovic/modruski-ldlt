(: which annotations without parents or children never appear in a set of parents :)
(: find exclusion :)
declare variable $dbrhet := "modr-riar-stil";
let $parents := 
for $p in db:open($dbrhet)//*:phr[*:phr]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
let $singles :=
for $p in db:open($dbrhet)//*:phr[not(parent::*:phr) and not(*:phr)]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
(: return distinct-values( $parents[not(.=$children)] ) :)
return distinct-values( $singles[not(.=$parents)] )