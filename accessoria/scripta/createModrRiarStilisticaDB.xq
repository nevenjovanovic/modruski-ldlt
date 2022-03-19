(: create / update a db of lemmata from the Riario speech :)
let $path := replace(file:parent(static-base-uri()), '/accessoria/scripta/', '/data/stilistica/nicolausmodrusiensis.oratioriario.croala-ldlt.verba.stilistica.xml') 
return db:create("modr-riar-stil", $path, (), map { 'ftindex': true(), 'intparse' : true(), 'chop' : false() })