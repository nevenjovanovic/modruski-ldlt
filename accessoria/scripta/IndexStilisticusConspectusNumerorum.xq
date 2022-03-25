(: basic info on stylistic annotation under phr :)
declare variable $dbrhet := "modr-riar-stil";
(: how many phr segments? :)
declare function local:terms(){
let $terms := for $s in db:open($dbrhet)//*:text//*:phr/@ana/string() return tokenize($s, " ")
return $terms
};
let $segs := db:open($dbrhet)//*:phr
let $nosegs := db:open($dbrhet)//*:text//*:s/*:w
let $parents := db:open($dbrhet)//*:text//*:phr[*:phr]
let $children := db:open($dbrhet)//*:text//*:phr[parent::*:phr]
let $nochild := db:open($dbrhet)//*:text//*:s/*:phr[not(*:phr)]
let $words := db:open($dbrhet)//*:text//*:w
return "Notarum stilisticarum numerus: " || count($segs) || "
Extra notis: " || count($nosegs) || " de " || count($words) || "
Nomina in notis occurrentia: " || count(local:terms()) || "
Nominum typi: " || count(distinct-values(local:terms())) || "
Notarum parentium: " || count($parents) || "
Notarum liberorum: " || count($children) || "
Notarum sine liberis: " || count($nochild)