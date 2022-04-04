(: nidi stilistici: get all phr elements annotated with style at level 1 below s (children of s) :)
(: group them by number of phr descendants :)
declare variable $dbrhet := "modr-riar-stil";
let $nestvalues :=
for $p in db:open($dbrhet)//*:text//*:s/*:phr
let $count := count($p//*:phr)
let $id := db:node-id($p)
group by $count
order by $count descending
return element tr { element td { $count } , element td { count($id) } , element td { $id } }
return element table { element thead {
  element tr {
    element td { "Quot phr in nido" },
    element td { "Quot nidos habentes"},
    element td { "Qui nidos habeant (DB ID)"}
  }
} , element tbody { $nestvalues }
}