(: get all phr elements annotated with style, as table :)
(: index phr/@ana, separate values, tokenize to get individual values (@ana may carry more than one) :)
(: count occurrences of individual values :)
declare variable $dbrhet := "modr-riar-stil";
declare function local:indiculus(){
(: get all phr elements annotated with style, as table :)
(: index phr/@ana, separate values, tokenize to get individual values (@ana may carry more than one) :)
(: count occurrences of individual values :)
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
  let $term := substring-after($r/td[1]/string(), "#")
  let $url := "https://croala.ffzg.hr/basex/nm-stil/terminus/"
  order by xs:integer($r/td[2]/string()) descending
  return element tr {   
  element td { db:open($dbrhet)//*:interp[@xml:id=$term]/string()}, 
  element td { 
  element a { attribute href { $url || $term} , $term } } ,
  $r/td[2] }
};
local:indiculus()