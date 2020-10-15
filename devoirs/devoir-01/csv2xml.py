from lxml import etree
import os

def open_file(chemin_input):
    lignes=[]
    with open(chemin_input, "r", encoding="UTF-8") as f :
        fichier = f.read()
        for ligne in fichier.split("\n"):
            if ligne == "": continue
            lignes.append(tuple(ligne.split(";")))
    return lignes


def csv2xml(input_f, output_f, dtd):
    repertoire = os.getcwd()
    toilettes = etree.Element("toilettes")

    lignes = open_file(repertoire+'/'+input_f)
    
    for l in lignes[1:] :
        toilette = etree.SubElement(toilettes, "toilette")
        toilette.set(lignes[0][0].lower(), l[0])
        if l[1]!="" : toilette.set(lignes[0][1].lower(), l[1])
        adresse = etree.SubElement(toilette, lignes[0][2].lower())
        libelle = etree.SubElement(adresse, "libelle")
        libelle.text = l[2]
        arrond = etree.SubElement(adresse, lignes[0][3].lower())
        arrond.text = l[3]
        horaire = etree.SubElement(toilette, lignes[0][4].lower())
        horaire.text = l[4]
        services = etree.SubElement(toilette, "services")
        acces_pmr = etree.SubElement(services, lignes[0][5].lower())
        acces_pmr.text = l[5]
        relais_bebe = etree.SubElement(services, lignes[0][6].lower())
        relais_bebe.text = l[6]
        equipement = etree.SubElement(toilette, "equipement")
        equipement.text = l[7]

    tree = etree.ElementTree(toilettes)
    tree.write(repertoire+'/'+output_f, pretty_print=True, encoding="UTF-8", xml_declaration=True, doctype="<!DOCTYPE toilettes SYSTEM \""+dtd+"\">")


if __name__ == "__main__":
    csv2xml('sanisettesparis.csv', 'toilettes-paris.xml', 'wc.dtd')