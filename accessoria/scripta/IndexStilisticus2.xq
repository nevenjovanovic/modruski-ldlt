(: get all phr elements annotated with style, as table :)
(: index phr/@ana, separate values :)
(: group by phr/@ana, return counts :)
declare variable $urn := "http://localhost:8984/";
declare variable $dbrhet := "modr-riar-stil";
let $base := db:open($dbrhet)//*:fileDesc/@xml:id
for $p in db:open($dbrhet)//*:text//*:phr
let $ana := $p/@ana
group by $ana
order by count($p) descending
return element tr { 
element td { $ana },
element td { count($p) }
}