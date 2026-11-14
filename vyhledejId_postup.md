## Vyhodnocení proběhlých testů kombinatoriky.

Nástroj pro vyhodnocení proběhlých testů stáhneme [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/vyhledejId/vyhledejId.xlsm)

Je potřeba odblokovat makra:
[Jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md) <br>

Nástroj obsahuje jediný list s názvem "PROGRAM"
![nástroj](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/vyhledejId.png)

<br>
Do buňky A2 vyplníme cestu ke složce s daty, příp. můžeme výběr provést pomocí tlačítka "Složka ..." <br>

Daná složka obsahuje soubor xlsx a tabulku csv.<br>
Tabulku csv získáme exportem dat z DB, jak je popsáno: [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)

![explorer](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/kombinatorikaExplorer.png)

Soubor kombinace.xlsx obsahuje data:
![kombinaceXlsx](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/kombinaceXlsx.png)

soubor jsme vytvořili manuálně, kde jsme pouze překopírovali data ze souboru získaného dle návodu [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/generuj%20GET_POST.md)

<br>
Po stisku tlačítka "Vyhledej Id a zapis do xlsx", program vytvoří složku Comparison v zadané složce s daty.

![comparison](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/kombinatorikaExplorerComp.png)


---- ?? Řádky červené, neproběhly ??----

<br>
Výstupem programu je vygenerování xlsx a csv souboru. <br>
Xlsx soubor obsahuje barevně označené neproběhlé testy. <br>
Csv soubor pak slouží pro následovné porovnání dalším testem.

![comparison](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/ComparisonExplorer.png)

