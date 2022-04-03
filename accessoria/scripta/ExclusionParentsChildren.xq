(: which annotations from a set of parents never appear as children :)
(: find exclusion of sets parents / children :)
declare variable $dbrhet := "modr-riar-stil";
let $parents := 
for $p in db:open($dbrhet)//*:phr[*:phr]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
let $children :=
for $p in db:open($dbrhet)//*:phr[parent::*:phr]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
(: return distinct-values( $parents[not(.=$children)] ) :)
return distinct-values( $children[not(.=$parents)] )