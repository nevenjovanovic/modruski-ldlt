(: mappa stilistica: get all phr elements with x levels of descendants :)
(: display each descendant level separately :)
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
declare function local:levels($level){ string-join( for $n in 1 to $level
(: create a descendant string to a given number of levels :)
return "*:phr", "/" ) };

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
let $phrlevel := local:levels($min)
for $p in db:open($dbrhet)//*:text//*:s/*:phr[ ( $phrlevel ) ]
let $ana := local:notaeABC($p/@ana/string())
let $id := local:makeurl($p)

order by $ana
return element tr { 
element td { $id },
element td { $ana }
 }
return $nestvalues
};

local:nestlist(5)