(: 
for $juicer in doc("file:/Users/lilakim/Desktop/M2_1/Documents_structures/documents-structures/04-XPath/xml/juicers.xml")/juicers/juicer
    let $id := $juicer/@id/data()
    return $id 
:)

(:
for $juicer in doc("file:/Users/lilakim/Desktop/M2_1/Documents_structures/documents-structures/04-XPath/xml/juicers.xml")/juicers/juicer
    let $id := $juicer/@id/data()
    let $prix := $juicer/cost
    group by $prix
    return $id
:)

for $juicer in doc("file:/Users/lilakim/Desktop/M2_1/Documents_structures/documents-structures/04-XPath/xml/juicers.xml")/juicers/juicer
    let $id := $juicer/@id/data()
    let $prix := xs:float($juicer/cost)
    let $nom := $juicer/name/text()
    where contains($nom, "Juicer")
    group by $prix
    return $id