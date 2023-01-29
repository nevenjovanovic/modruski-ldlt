(: join together all w content strings under phr :)
(: including the composite w :)
declare variable $dbrhet := "modr-riar-stil";
declare function local:compositum($compos){
  string-join($compos/*:w/string(), "")
};
for $compos in db:open($dbrhet)//*:text//*:w[@ana="compositum"]
return local:compositum($compos)