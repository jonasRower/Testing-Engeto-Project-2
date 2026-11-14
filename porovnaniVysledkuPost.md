## Porovnání výsledků POST - postup.

Budeme provádět 2 druhy testů:

1. Porovnání exportovaných dat z DB před testem a po testu. 
2. Porovnání generovaných kombinací a skutečně vytvořenými záznamy v DB.

<details>

<summary>Exportovaná data před a po testu</summary>

   Budeme porovnávat 2 sad dat exportovaných z databáze. Exportovaných před testem a exportovaných po testu <br>
   Všechny data jsou uložena ve složce [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/POST)
   <br><br>

   1. Před započetím testu si stáhneme data z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)
   2.  Test provedeme hromadným suštěním requestů dle návodu [hromadne spustit testy](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/jak_Spustit_Postman_Hromadne.md)
   3.  Po ukončení testu opět exportujeme aktuální data z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md) 
   4.  Stáhneme program na porovnávání výsledků [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md)
   5. Otevřeme soubor
   6. Na Listu "PROGRAM" do buňky A2 vyplníme adresu složky odkud budeme načítat data. Případně lze i vybrat složku klikem na Tlačítko "Složka".
   7. Klikneme na tlačítko "Načti - Porovnej - Ulož data". Jelikož program detekoval 2 soubory csv, které jsou generovány z téže tabulky, nepředpokládá se, že je třeba upravovat jednotlivé sloupce tabulky. Program tedy automaticky porovná data a uloží je do souboru dané složky s názvem složky+.xls. Soubor je uložen [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/results_tests/POST/POST.xlsx)
<br>

Manuál ve verzi pdf je zde : <br>
[Popis nástroje pro porovnávání výsledků testů](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/Porovn%C3%A1v%C3%A1n%C3%AD%20tabulek.pdf)
</details>

<details>

<summary>Porovnání generovaných kombinací a skutečně vytvořenými záznamy v DB.</summary>

   1. Před započetím testu si stáhneme data z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)
   2. Navážeme na postup [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/generuj%20GET_POST.md).
   Uložíme list "kombinatorika do samostatného souboru, pojmenovali jsme soubor kombinace.xlsx. Soubor uložíme do stejné složky, do které jsme uložili soubor csv v bodě 1.
   3. Stáhneme soubor [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/vyhledejId/vyhledejId.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md).
   4. Manuál pro vyhledání id je [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/vyhledejId_postup.md)
   5. Program nám vyhledal jednotlivá id záznamů z exportované tabulky z DB. Řádky, pro které příslušná id, nebyla dohledána, neuskutečněné requesty. Soubor kombinace.xlsx byl tedy přepsán a uložen [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/POST_kombinace)
   
   
   
</details>

