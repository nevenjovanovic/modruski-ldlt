(: which annotation types without parents or children never appear in a set of children :)
(: find exclusion :)
declare variable $dbrhet := "modr-riar-stil";
let $children := 
for $p in db:open($dbrhet)//*:phr[parent::*:phr]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
let $singles :=
for $p in db:open($dbrhet)//*:phr[not(parent::*:phr) and not(*:phr)]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
(: return distinct-values( $parents[not(.=$children)] ) :)
return distinct-values( $singles[not(.=$children)] )