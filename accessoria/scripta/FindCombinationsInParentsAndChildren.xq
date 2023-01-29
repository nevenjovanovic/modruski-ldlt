(: which annotations from a set of parents have combinations :)
(: do the same for children :)
declare variable $dbrhet := "modr-riar-stil";
let $parents := 
for $p in db:open($dbrhet)//*:phr[*:phr]
let $ana := $p/@ana/string()
order by $ana
return if (matches($ana, " ")) then $ana else()
let $children :=
for $p in db:open($dbrhet)//*:phr[parent::*:phr]
let $ana := $p/@ana/string()
order by $ana
return  if (matches($ana, " ")) then $ana else()
return $children