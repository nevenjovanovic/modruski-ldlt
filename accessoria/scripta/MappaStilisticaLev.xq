(: mappa stilistica: get all phr elements annotated with style at level 1 :)
(: report how many have nested phr elements :)
(: display children level, descendant level :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $url1 := "https://croala.ffzg.unizg.hr/basex/nm-stil/nidificium/";
declare variable $heatmap := map { 
0: "#9ef738",
1: "#93e436",
2: "#7ec231",
3: "#689e2c",
4: "#598527",
5: "#527925",
6: "#4b6e23",
7: "#446221",
8: "#3d571e"
};
declare function local:notaeABC($seq){
  (: order terms in @ana alphabetically :)
  let $seqabc := string-join( for $s in tokenize($seq, " ")
  order by $s
  return $s (: replace($s, "-", "") :)
  , " ")
  return $seqabc
};
declare function local:makeurl($a){ 
element a { attribute href { $url1 || db:node-id($a) } , db:node-id($a) }
};
declare function local:nestlist($min) {
let $nestvalues :=
for $p in db:open($dbrhet)//*:text//*:s/*:phr
let $ana := local:notaeABC($p/@ana/string())
let $id := local:makeurl($p)
let $count := count($p//*:phr)
let $children := for $a in $p/*:phr/@ana return ( local:makeurl($a/parent::*) , element pre { local:notaeABC($a/string()) } )
let $childcount := count($children) div 2
let $desc := for $a in $p/*:phr//*:phr/@ana return  ( local:makeurl($a/parent::*) , element pre { local:notaeABC($a/string()) } )
let $desccount := count($desc) div 2
where $count >= $min and $desccount > 0
order by $ana
return element tr { 
 attribute style { "background-color:" || map:get($heatmap , count($p//*:phr)) },
element td { $id },
element td { $ana },
element td { $count },
element td { $childcount },
element td { $children },
element td { $desccount },
element td { $desc }
 }
return $nestvalues
};

local:nestlist(2)