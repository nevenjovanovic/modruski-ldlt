declare variable $urn := "http://localhost:8984/";
declare variable $db := "modr-riar-ldlt";
let $base := db:open($db)//*:fileDesc/@xml:id
let $d := db:open("modr-riar-ldlt")//*:front/*:div/*:div[@xml:id="preface-section-2"]
for $i in $d//*:interp
let $ref := $i/@corresp
let $ref2 := substring-after($ref, "#")
let $target := db:open($db)//*:body//*:p[@xml:id=$ref2]
let $a := path($target)
let $aid := db:node-id($target)
let $a2 := replace($a, "Q\{http://www.tei-c.org/ns/1.0\}", "")
return element tr { 
element td { $i/string() },
element td { $ref/string() } ,
element td { 
element a {
  attribute href { $urn || $base/string() || "/" || $aid } ,
   $base || $a2 } }
}