(: mappa stilistica: get all phr elements annotated with style at level 1 :)
(: report how many have nested phr elements :)
declare variable $dbrhet := "modr-riar-stil";
declare variable $heatmap := map { 
0: "#5bcc2a",
1: "#56bd29",
2: "#4ba126",
3: "#408323",
4: "#376d1f",
5: "#33621e",
6: "#2e561c",
7: "#000000"
};
let $nestvalues :=
for $p in db:open($dbrhet)//*:text//*:s/*:phr
return element tr { element td { attribute style { "background-color:" || map:get($heatmap , count($p/*:phr)) }, count($p/*:phr) } }
return $nestvalues