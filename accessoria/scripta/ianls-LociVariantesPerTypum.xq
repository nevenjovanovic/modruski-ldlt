(: Index locorum ubi typus variationis occurrit: for a @type value, get all app passages, as table :)
declare variable $urn := "http://localhost:8984/";
declare variable $dbrhet := "modr-riar-ldlt";
declare variable $typus := "lexicographice";
declare function local:typuslect(){
  element table {
    element thead { 
  element tr {
    element td { "Variationis typus"},
    element td { "Ubi in editione"},
    element td { "Lemma"},
    element td { "Lectiones variantes"}
  }
},
    element tbody {
for $p in db:open($dbrhet)//*:text//*:app[*:rdg/@type=$typus]
return element tr { 
element td { $typus },
element td { db:node-id($p) },
element td { $p/*:lem },
element td { for $r in $p/*:rdg[@type=$typus]
return $r/@wit/string() || ": " || $r/string() } }
}
}

};
local:typuslect()