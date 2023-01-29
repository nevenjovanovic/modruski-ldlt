(: for term, retrieve all nodes :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $id := (19311);
declare variable $term := "#epanalepsis";
declare function local:opennode($id) { 
for $i in $id
for $phr in db:open-id($dbrhet, $i)
return element tr { 
element td { $i } , 
element td { $phr/@ana/string()},
element td { normalize-space($phr) } }
};
declare function local:getallnodes($term){
  for $t in $term
let $phr := db:open($dbrhet)//*:phr[matches(@ana, $t)]
return local:opennode(db:node-id($phr))
};
local:getallnodes($term)