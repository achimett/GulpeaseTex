# Documento scritto da Alessandro Chimetto <alessandro.chimetto.it@gmail.com>
# e rilasciato sotto licenza Unlicense <http://unlicense.org/>

import sys
import textract
import re

file = sys.argv[1]
testo = textract.process(file).decode('utf-8')

frasi = len(re.findall('([.]+\s)|([;]+\s)|([:]+\s)', testo))
lettere = len(re.findall('\w', testo))
parole = len(re.findall('\w+', testo))

indice_gulpease = round(89 + ((300 * frasi) - (10 * lettere)) / parole)

if indice_gulpease > 100:
    indice_gulpease = 100

print('***** Indice di Gulpease per il documento ' + file + ' *****')
print()
print('Numero di frasi: ' + str(frasi))
print('Numero di lettere: ' + str(lettere))
print('Numero di parole: ' + str(parole))
print()
print('Indice di Gulpease: ' + str(indice_gulpease))
