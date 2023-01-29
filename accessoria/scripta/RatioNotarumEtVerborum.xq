(: Ratio notarum et verborum: get all phr elements annotated with style at level 1 below s (children of s) :)
(: calculate their ratio of annotations to words: annotations / words :)
declare variable $dbrhet := "modr-riar-stil";
let $nestvalues :=
for $p in db:open($dbrhet)//*:text//*:s/*:phr[*:phr]
let $ana := $p/@ana/string()
let $countnotes := count($p//*:phr)
let $countwords := count($p//*:w)
let $ratio := $countnotes div $countwords
let $id := db:node-id($p)
order by $ratio descending , $ana
return element tr { element td { $id } , element td { $ana } , element td {$countnotes}, element td {$countwords} , element td { $ratio } }
return element table { element thead {
  element tr {
    element td { "Phr ID numerus" },
    element td { "Annotatio stylistica"},
    element td { "Numerus notarum in nido"},
    element td { "Numerus verborum"},
    element td { "Ratio notarum et verborum"}
  }
} , element tbody { $nestvalues }
}