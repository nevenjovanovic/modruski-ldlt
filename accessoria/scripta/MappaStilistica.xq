(: mappa stilistica: get all phr elements annotated with style at level 1 :)
(: report how many have nested phr elements :)
declare variable $dbrhet := "modr-riar-stil";
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
let $nestvalues :=
for $p in db:open($dbrhet)//*:text//*:s/*:phr
return element tr { element td { attribute style { "background-color:" || map:get($heatmap , count($p//*:phr)) }, count($p//*:phr) } }
return $nestvalues