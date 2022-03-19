(: list lemmata with LiLa URIs :)
declare variable $db := "modr-riar-lemm";
declare function local:qlila($lemmaref){ 
(: must ensure that we have https:! :)
let $url := ($lemmaref || "?output=application%2Frdf%2Bxml")
let $parsed := doc($url)//*:label/string()
return $parsed
};
for $l in db:open($db)//*:w[@lemmaRef]
let $lref := $l/@lemmaRef
let $lem := $l/@lemma
group by $lref
order by count($l) descending
return element tr {
  element td {  for $ll in distinct-values($lem) return 
  element a { attribute href { "https://logeion.uchicago.edu/" || replace($ll, "[0-9]", "") } , $ll } }, 
  element td { local:qlila($lref)  } , 
  element td {
    element a { attribute href {$lref} , substring-after($lref, "https://lila-erc.eu/data/id/" ) }  } , 
  element td { count($l) }
}