## Porovnání výsledků GET - postup.

Budeme porovnávat export z databáze a sadu souborů json obsahující jednotlivé odezvy z jednotlivých requestů. <br>
Všechny data jsou uložena ve složce [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/GET)
<br><br>

1. Stáhneme program na porovnávání výsledků [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md)
2. Otevřeme soubor
3. Na Listu "PROGRAM" do buňky A2 vyplníme adresu složky odkud budeme načítat data. Případně lze i vybrat složku klikem na Tlačítko "Složka".
   Vybereme složku odpovídající těmto [datům](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/GET)
4. Klikneme na tlačítko "Načti - Porovnej - Ulož data". Načtou se data na list "compare csv & json". Program nás vyzve, abychom upravili počet sloupců. Pro další porovnání musí být počet sloupců shodný.
5. Upravíme počet sloupců. Do buňky na řádku 2 vyplníme název námi přidaného sloupce. Přidaný sloupec můžeme ponechat prázdný.
6. Na Listu "PROGRAM" Stiskneme tlačítko "Porovnej csv & json". Program porovná data a uloží je do souboru dané složky s názvem složky. Soubor je uložen 


