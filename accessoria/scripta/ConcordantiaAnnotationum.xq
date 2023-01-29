(: a list of stylistic annotations (@ana values) for concordance :)
declare variable $dbrhet := "modr-riar-stil";
declare function local:notaeABC($seq){
  (: order terms in @ana alphabetically :)
  let $seqabc := string-join( for $s in tokenize($seq, " ")
  order by $s
  return $s (: replace($s, "-", "") :)
  , " ")
  return $seqabc
};
for $s in db:open($dbrhet)//*:phr
let $n := db:node-id($s)
let $ana:= $s/@ana/string()
return ( $n || ": " || local:notaeABC($ana) || " \" )