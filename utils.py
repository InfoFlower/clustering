def texte_sans_accent(fichier):
    """ crée un nouveau fichier txt sans accent """
    out=""
    def supprime_accent(ligne):
        """ supprime les accents du texte source """
        out = ""
        for mot in ligne:
            for c in mot:
                if c == 'é' or c == 'è' or c == 'ê' or c=='Ã©' or c=='Ã¨':
                    print('AAAAAAAAAAAAAA')
                    c = 'e'
                elif c == 'à':
                    c = 'a'
                elif c == 'ù' or c == 'û':
                    c = 'u'
                elif c == 'î':
                    c = 'i'
                elif c == 'ç':
                    c = 'c'
                out += c
        return out
    # ouvrir le fichier source
    fs = open(fichier, 'r')
    while 1:
        ligne = fs.readline()
        if ligne == "":
            break
        out += supprime_accent(ligne) + '\n'
    return out



"""
a_regrouper={}
for i in df.columns[1:]:
    for z in df[i].unique():
        if z is not None :
            if df[i].value_counts()[z]<sum(df[i].value_counts())*0.05:
                if i in a_regrouper.keys():
                    a_regrouper[i].append(z)
                else:
                    a_regrouper[i]=[z]
ensemble={}
for i in df.columns[1:]:
    for z in df[i].unique():
        if z is not None :
            if i in ensemble.keys():
                ensemble[i].append(z)
            else:
                ensemble[i]=[z]
"""