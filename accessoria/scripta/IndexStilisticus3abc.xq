(: get all phr elements annotated with style, as table :)
(: in alphabetical order by name of stylistic term :)
(: index phr/@ana, separate values, tokenize to get individual values (@ana may carry more than one) :)
(: count occurrences of individual values :)
declare variable $dbrhet := "modr-riar-stil";
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
for $r in $rows/tr
  order by $r/td[1]/string()
  return element tr {   $r/td[1] , element td { db:open($dbrhet)//*:interp[@xml:id=substring-after($r/td[1]/string(), "#")]/string()}, $r/td[2] }