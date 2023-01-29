(: count number of annotations in each @ana, order by that count :)
declare variable $dbrhet := "modr-riar-stil";
for $phr in db:open($dbrhet)//*:phr
let $id := db:node-id($phr)
let $ana := tokenize($phr/@ana/string(), " ")
let $anacount := count($ana)
where $anacount > 2
order by $anacount descending
return element tr {
  element td { $id },
  element td { $ana },
  element td { $anacount },
  element td { normalize-space($phr)}
}