(: count number of annotations in each @ana, order by that count :)
declare variable $dbrhet := "modr-riar-stil";
for $phr in db:open($dbrhet)//*:phr
let $ana := tokenize($phr/@ana/string(), " ")
let $anacount := count($ana)
group by $anacount
order by $anacount descending
return element tr {
  element td { $anacount },
  element td { count($phr) }
}