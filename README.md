# Testing-Engeto-Project-2
Testování API

Složka Tools obsahuje nástroje pro vytváření Requestů a porovnání tabulek: <br>
[Projekt Github](https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/Tools)

Popis vytváření Requestů je zde:  <br>
[Popis nástroje pro vytváření requestů](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/Generov%C3%A1n%C3%AD%20request%C5%AF%20do%20Postmanu.pdf)

Popis porovnávání tabulek je zde:  <br>
[Popis nástroje pro porovnávání výsledků testů](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/Porovn%C3%A1v%C3%A1n%C3%AD%20tabulek.pdf)

Tomu samozřejmě odpovídají soubory Excelu s makry ve VBA: <br>
[Generování requestů - VBA](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/gen_requests_Postman.xlsm) <br>
[Porovnávání výsledků testů - VBA](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm)

Requesty lze importovat do Postmanu, jsou uložené zde: <br>
GET + POST   https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Requests%20Postman/GET_POST.json <br>
UPDATE       https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Requests%20Postman/UPDATE.json

Exportované responses z API tetů v Postman testu GET jsou ve složce zde. Je zde i přiložen soubor csv obsahující data z DB: <br>
https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/GET
Soubor GET.xlsx v dané složce dokumentuje porovnání dat z testu <br>
https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/results_tests/GET/GET.xlsx <br>

Obdobně jsou i uložena data pro test POST. Avšak zde byla data pouze exportována z DB a to před a po testu. Tomu odpovídá dvojice csv. <br>
https://github.com/jonasRower/Testing-Engeto-Project-2/tree/main/results_tests/POST




