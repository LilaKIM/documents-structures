(:
declare function local:get-texte() as xs:string* {
let $directory := "/Users/Lara/Desktop/M2S1/DocumentsStructures/documents-structures/07-XQuery"
let $filename := "apollinaire.txt"
let $data := unparsed-text($directory || '/' || $filename)
return $data
};

local:get-texte() => local:normalise-texte()
:)

declare namespace local = "documents-structures-fonctions";

declare function local:normalise-texte($texte as xs:string) as xs:string* {
    let $ponctuations := "?!;.,'\n"
    return translate($texte, $ponctuations, "") => lower-case() => tokenize(' ')
};

declare function local:compteur-mot($list_texte) as element(mot)* {
    for $mot in distinct-values($list_texte)
    let $frequence := count($list_texte[. = $mot])
    let $element := element mot {attribute frequence {$frequence}, $mot}
    return $element
};

local:compteur-mot(local:normalise-texte(doc("file:/Users/lilakim/Desktop/M2_1/Documents_structures/documents-structures/07-XQuery/exercice3.xml")))

(:Le retour à la ligne "\n" n'est pas détecté...:)