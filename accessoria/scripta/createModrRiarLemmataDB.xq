(: create / update a db of lemmata from the Riario speech :)
let $path := replace(file:parent(static-base-uri()), '/accessoria/scripta/', '/data/morphosyntax/nicolausmodrusiensis.oratioriario.croala-ldlt.verba.lemmata.xml') 
return db:create("modr-riar-lemm", $path, (), map { 'ftindex': true(), 'intparse' : true(), 'chop' : false() })