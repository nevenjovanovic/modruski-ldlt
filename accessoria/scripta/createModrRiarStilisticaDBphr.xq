(: create / update a db of stylistic phr from the Riario speech :)
let $path := replace(file:parent(static-base-uri()), '/accessoria/scripta/', '/data/stilistica/nicolausmodrusiensis.oratioriario.croala-ldlt.phr.stilistica.xml') 
return db:create("modr-riar-stil-phr", $path, (), map { 'ftindex': true(), 'intparse' : true(), 'chop' : false() })