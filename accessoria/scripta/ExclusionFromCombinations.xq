(: which terms never appear in combinations :)
(: find exclusion of sets single terms / terms in combinations :)
declare variable $dbrhet := "modr-riar-stil";
let $single := 
for $p in db:open($dbrhet)//*:phr[not(matches(@ana, " "))]
let $ana := $p/@ana/string()
return $ana
let $combo :=
for $p in db:open($dbrhet)//*:phr[matches(@ana, " ")]
let $ana := tokenize($p/@ana/string(), " ")
return $ana
return distinct-values( $combo[not(.=$single)] )
(: return distinct-values( $single[not(.=$combo)] ) :)