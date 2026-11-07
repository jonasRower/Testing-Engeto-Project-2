## Provedení testu GET

Postupujeme následujícími kroky: <br>
1. Před započetím testu, exportujeme tabulku z DB 
   [export DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)
   <br>
   Tabulka je uložena
   [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/results_tests/GET/students_202609101730.csv)
   <br>
2. Otevřeme Postman a nahrajeme příslušné requesty. Postupovali jsme dle návodu, [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/import_Json_Postman.md)
   <br>
   Requesty jsou uložené [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Requests%20Postman/GET_POST.json) .
   <br>
3. Provedeme všechny requesty GET
4. Uložíme všechny odezvy proběhnutých requestů, do stejné složky, kam jsme uložili export z DB z bodu 1. <br> Příslušná složka je [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/GET)
5. Stáhneme program na porovnávání výsledků [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm). Před spuštěním je potřeba odblokovat makra, můžeme postupovat dle manuálu [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md)
   
