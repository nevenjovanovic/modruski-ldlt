(: Index lectionum: get all rdg/@type values, as table :)
(: group by rdg/@type, return counts :)
declare variable $urn := "http://localhost:8984/";
declare variable $dbrhet := "modr-riar-ldlt";
declare function local:indexlect(){
  element table {
    element thead { 
  element tr {
    element td { "Variationis typus"},
    element td { "Quot in editione (nexus ostendet ubi)"}
  }
},
    element tbody {
for $p in db:open($dbrhet)//*:text//*:rdg
let $type := $p/@type
group by $type
order by count($p) descending
return element tr { 
element td { $type },
element td { element a { 
attribute href { $urn || "nm-lectiones/" || $type } , count($p) } }
}
}
}
};
local:indexlect()