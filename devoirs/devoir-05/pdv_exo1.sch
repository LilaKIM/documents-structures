<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="PDV-pour-sch.xml" prefix="pdv"/>

    <sch:pattern>
        <sch:rule context="fermeture">
            <sch:assert test="not(text())">L'élément <sch:name/> ne doit pas contenir de texte.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="ouverture">
            <sch:assert test="@debut and @fin">
                L'élément <sch:name/> doit contenir deux attributs @debut et @fin.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="pdv">
            <sch:report test="ouverture/@saufjour=''" role="warn">
                Les points de vente sont ouverts tous les jours, devraient prendre des vacances
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="ville">
            <sch:report test="not(text() = upper-case(text()))">
                Les noms des villes devraient être tous en majuscule pour la consistance
            </sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>