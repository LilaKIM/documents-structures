declare namespace local = "documents-structures";

declare function local:louchebem($mot as xs:string) as xs:string {
let $first_letter := substring($mot, 1, 1)
let $vowel := ("e", "y", "u", "i", "o", "a")
return if (
$first_letter = $vowel) 
then "l" || $mot || "bem" 
else "l" || substring($mot, 2) || $first_letter || "em"
};

declare function local:sentence-louchebem($sentence as xs:string) as xs:string* {
    for $mot in tokenize($sentence, " ")
        return local:louchebem($mot)
};

for $mot in doc('exercice1.xml')/vocabulaire/mot
    return local:louchebem($mot/text())

(: for $sentence in doc('exercice1.xml')/vocabulaire/sentence
    return local:sentence-louchebem($sentence) :)