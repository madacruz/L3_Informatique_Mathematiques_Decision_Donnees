import sys, os
from xml.dom.minidom import parse

def titreFilms (dom):
    titres = []
    for t in dom.getElementsByTagName("TITRE"):
      titres.append(t.childNodes[0].data)
    return titres

def anneeFilms (dom, annee):
    titres = []
    for film in dom.getElementsByTagName("FILM"):
        if film.getAttribute("Annee") == annee :
            titres.append(film.childNodes[1].childNodes[0].data)
    return titres

def resumeFilm (dom, titleFilm):
    resume = None
    for titre in dom.getElementsByTagName("TITRE"):
        if titre.childNodes[0].data == titleFilm :
            r = titre.parentNode.getElementsByTagName("RESUME")
            if not r.length == 0:
                resume = r[0].childNodes[0].data
    return resume

def titresAvecActor (dom, actorNom, actorPrenom):
    titres = []
    for role in dom.getElementsByTagName("ROLE"):
        actPr = role.getElementsByTagName("PRENOM")[0].childNodes[0].data
        actNom = role.getElementsByTagName("NOM")[0].childNodes[0].data
        if actPr == actorPrenom and actNom == actorNom:
            titres.append(role.parentNode.parentNode.getElementsByTagName("TITRE")[0].childNodes[0].data)
    return titres

def titreAvecResume (dom):
    titres = []
    for resume in dom.getElementsByTagName("RESUME"):
        titre = resume.parentNode.getElementsByTagName("TITRE")[0].childNodes[0].data
        titres.append(titre)
    return titres

def titreSansResume (dom):
    titres = []
    for film in dom.getElementsByTagName("FILM"):
        if film.getElementsByTagName("RESUME").length == 0:
            titres.append(film.getElementsByTagName("TITRE")[0].childNodes[0].data)
    return titres

def filmsPlusVieux (dom, annee):
    titres = []
    for film in dom.getElementsByTagName("FILM"):
        if int(film.getAttribute("Annee")) <= int(annee) :
            titres.append(film.childNodes[1].childNodes[0].data)
    return titres

def roleActor (dom, film, actorNom, actorPrenom):
    roleAct = None
    for titre in dom.getElementsByTagName("TITRE"):
        if (titre.childNodes[0].data == film):
            for role in titre.parentNode.getElementsByTagName("ROLE"):
                actPr = role.getElementsByTagName("PRENOM")[0].childNodes[0].data
                actNom = role.getElementsByTagName("NOM")[0].childNodes[0].data
                if actPr == actorPrenom and actNom == actorNom:
                    roleAct = role.getElementsByTagName("INTITULE")[0].childNodes[0].data
    return roleAct
    
def dernierFilm (dom):
    films = dom.getElementsByTagName("FILM")
    return films[films.length-1].getElementsByTagName("TITRE")[0].childNodes[0].data

def main():
    if len(sys.argv) != 2:
        print ("Usage: %s document.xml" % (sys.argv[0]))
        exit(0)
    xml_path=str((sys.argv[1]))
    dom = parse(xml_path)
    query1 = titreFilms (dom)
    query2 = anneeFilms (dom, "1990")
    query3 = resumeFilm (dom, "Alien")
    query4 = titresAvecActor (dom, "Willis", "Bruce")
    query5 = titreAvecResume (dom)
    query6 = titreSansResume (dom)
    query7 = filmsPlusVieux (dom, "1990")
    query8 = roleActor (dom, "Reservoir dogs", "Keitel", "Harvey")
    query9 = dernierFilm (dom)
    print("Requete 1: \n", query1)
    print("\n Requete 2: \n", query2)
    print("\n Requete 3: \n", query3)
    print("\n Requete 4: \n", query4)
    print("\n Requete 5: \n", query5)
    print("\n Requete 6: \n", query6)
    print("\n Requete 7: \n", query7)
    print("\n Requete 8: \n", query8)
    print("\n Requete 9: \n", query9)
if __name__ == "__main__":
    main()
    