(: get info on nesting depth :)
declare variable $dbrhet := "modr-riar-stil";
let $phr := db:open($dbrhet)//*:s/*:phr
let $phr3 := $phr[*:phr/*:phr/*:phr]
let $phr2 := $phr[*:phr/*:phr[not(*:phr)]]
let $phr1 := $phr[*:phr[not(*:phr)]]
let $phr0 := $phr[not(*:phr)]
let $phr1excl := $phr1[not(.=$phr2) and not(.=$phr3)]
let $phr2excl := $phr2[not(.=$phr3)]
return "Phr elements immediately below s (level 1): **" || count($phr) || "** \
Phr without phr children: **" || count($phr0) || "** \
Phr with phr children (level 2), no descendants: **" || count($phr1excl) || "** \
Phr with phr descendants level 3, no level 4: **" || count($phr2excl) || "** \
Phr with phr descendants level 4: **" || count($phr3) || "** "