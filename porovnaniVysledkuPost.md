## Porovnání výsledků POST - postup.

Budeme provádět 2 druhy testů:

1. Porovnání exportovaných dat z DB před testem a po testu. 
2. Porovnání generovaných kombinací a skutečně vytvořenými záznamy v DB.

<details>

<summary>Exportovaná data před a po testu</summary>

   Budeme porovnávat 2 sad dat exportovaných z databáze. Exportovaných před testem a exportovaných po testu <br>
   Všechny data jsou uložena ve složce [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/POST)
   <br><br>

   1. Před započetím testu si stáhneme data z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)  -- zamysli se jak to napsat
   2.  Stáhneme program na porovnávání výsledků [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md)
   3. Otevřeme soubor
   4. Na Listu "PROGRAM" do buňky A2 vyplníme adresu složky odkud budeme načítat data. Případně lze i vybrat složku klikem na Tlačítko "Složka".
   5. Klikneme na tlačítko "Načti - Porovnej - Ulož data". Jelikož program detekoval 2 soubory csv, které jsou generovány z téže tabulky, nepředpokládá se, že je třeba upravovat jednotlivé sloupce tabulky. Program tedy automaticky porovná data a uloží je do souboru dané složky s názvem složky+.xls. Soubor je uložen [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/results_tests/POST/POST.xlsx)
</details>

<details>

<summary>Porovnání generovaných kombinací a skutečně vytvořenými záznamy v DB.</summary>

   1. Před započetím testu si stáhneme data z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)
   2. Navážeme na postup [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/generuj%20GET_POST.md).
   Uložíme list "kombinatorika do samostatného souboru, pojmenovali jsme soubor kombinace.xlsx. Soubor uložíme do stejné složky, do které jsme uložili soubor csv v bodě 1.
   3. Stáhneme soubor [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/vyhledejId/vyhledejId.xlsm)
   
   
   
</details>


1. Stáhneme program na porovnávání výsledků [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md)
2. Otevřeme soubor
3. Na Listu "PROGRAM" do buňky A2 vyplníme adresu složky odkud budeme načítat data. Případně lze i vybrat složku klikem na Tlačítko "Složka".
   Vybereme složku odpovídající těmto [datům](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/GET)
4. Klikneme na tlačítko "Načti - Porovnej - Ulož data". Načtou se data na list "compare csv & json". Program nás vyzve, abychom upravili počet sloupců. Pro další porovnání musí být počet sloupců shodný.
5. Upravíme počet sloupců. Do buňky na řádku 2 vyplníme název námi přidaného sloupce. Přidaný sloupec můžeme ponechat prázdný.
6. Na Listu "PROGRAM" Stiskneme tlačítko "Porovnej csv & json". Program porovná data a uloží je do souboru dané složky s názvem složky+.xls. Soubor je uložen [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/results_tests/GET/GET.xlsx)
<br><br>
Manuál ve verzi pdf je zde : <br>
[Popis nástroje pro porovnávání výsledků testů](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/Porovn%C3%A1v%C3%A1n%C3%AD%20tabulek.pdf)
