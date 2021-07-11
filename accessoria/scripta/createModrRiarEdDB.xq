(: create a db of editions of the Riario speech :)
let $path := replace(file:parent(static-base-uri()), '/accessoria/scripta/', '/data/nicolausmodrusiensis.oratioriario.croala-ldlt.xml') 
return db:create("modr-riar-ldlt", $path, (), map { 'ftindex': true(), 'intparse' : true(), 'chop' : false() })