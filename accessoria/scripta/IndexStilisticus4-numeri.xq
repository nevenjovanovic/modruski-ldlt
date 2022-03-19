(: count all phr elements annotated with style :)
(: sum all counts of occurrences of individual values within @ana :)
declare variable $dbrhet := "modr-riar-stil";
let $countphr := count(db:open($dbrhet)//*:text//*:phr[@ana])
let $rows := element tbody {
let $stylevalues :=
for $p in db:open($dbrhet)//*:text//*:phr
let $ana := $p/@ana/string()
return tokenize($ana, " ")
for $dv in distinct-values($stylevalues)
return element tr {
  element td { $dv } ,
  element td { count($stylevalues[. eq $dv]) }
}
}
let $r := sum( for $r in $rows/tr/td[2]/string() return xs:integer($r))
let $countsv := count(distinct-values(
  for $p in db:open($dbrhet)//*:text//*:phr
let $ana := $p/@ana/string()
return tokenize($ana, " ")
))
return "Annotationes stilisticae sunt **" || $countphr || "**. In eis notae singulares **" || $r || "**. Notarum genera sunt **" || $countsv || "**."