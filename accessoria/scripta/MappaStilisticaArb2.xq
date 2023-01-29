declare variable $dbrhet := "modr-riar-stil";
declare variable $url1 := "https://croala.ffzg.unizg.hr/basex/nm-stil/nidificium/";

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
declare function local:allnests(){
  element tbody {
for $p in db:open($dbrhet)//*:text//*:s/*:phr
let $ana := local:notaeABC($p/@ana/string())
let $id := local:makeurl($p)
let $child := $p/*:phr
let $childid := for $d in $child return local:makeurl($d)
let $childana := for $c in $child return element pre { local:notaeABC($c/@ana/string()) }
let $desc1 := $p/*:phr/*:phr
let $desc1id := for $d in $desc1 return local:makeurl($d)
let $desc1ana := for $d in $desc1 return element pre { local:notaeABC($d/@ana/string()) }
let $desc2 := $p/*:phr/*:phr/*:phr
let $desc2id := for $d in $desc2 return local:makeurl($d)
let $desc2ana := for $d in $desc2 return element pre { local:notaeABC($d/@ana/string()) }
return element tr { 
element td { $id },
element td { $ana },
element td { $childid } ,  element td { $childana },
element td { $desc1id } ,  element td { $desc1ana },
element td { $desc2id } , element td { $desc2ana }
 }
}
};
declare function local:filternest($f) {
  (: select only phr with descendants level $f, 1-4 :)
for $n in local:allnests()/tr
let $ff := $f * 2
where not($n/td[$ff]="")
return $n
};
count(local:filternest(4))