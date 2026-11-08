
# Projekt: Testování REST API
## Přehled nástrojů - dle zadání
1. DBeaver- přístup do databáze
2. Postman - zasílaní požadavků na REST API
3. Textový editor - editace šablony pro projekt

## Přehled nástrojů - vytvořené zpracovatelem
1. [Generování requestů do Postmanu](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/Generov%C3%A1n%C3%AD%20request%C5%AF%20do%20Postmanu.pdf) <br> [Nástroj je zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/gen_requests_Postman.xlsm)
2. [Porovnávání tabulek](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/Porovn%C3%A1v%C3%A1n%C3%AD%20tabulek.pdf) <br> [Nástroj je zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm)

## Zadání
Cílem projektu je otestování REST rozhraní běžící na adrese https://test-app.engeto.cz/students.<br>
Rozhraní slouží pro manipulaci dat studentů. Otestuj metody GET, POST, PUT a DELETE. Tvým úkolem je ověřit, zda API rozhraní správně reaguje na chyby, úspěch, ale i to, jestli je konzistentní s databází. Nezapomeň aplikovat znalosti z lekcí 1 až 4 (testovací scénáře, defekt, status kódy, SQL dotazy,...).

Platí, že: <br>
1. metoda GET zobrazí data o existujícim studentovi
2. metoda POST založí záznam o studentovi
3. metoda PUT upraví záznam o studentovi
4. metoda DELETE smaže data o studentovi


## Podrobná dokumentace

<details>

<summary>GET</summary>

<br>
url: https://test-app.engeto.cz/students/{student_id}
<br>
Returns a single student identified by numeric ID.

### Parameters
| Name     | Description |
| -------- | ------- |
| student_id * (required) [integer]  | student_id    |

### Responses
| Code     | Description |
| -------- | ------- |
| 200  | Student found and returned.  |

Schema:
```json
  {
  "id": 0,
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

| Code     | Description |
| -------- | ------- |
| 401  | Missing or invalid bearer token.  |
| 404  | Student with the given ID was not found.|
| 422  | Validation Error.|

</details>

<details>

<summary>POST</summary>
<br>
url: https://test-app.engeto.cz/students/
<br>
Creates a new student using the provided payload.

### Parameters
No parameters

### Request body
```json
  {
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "isEuCitizen": true,
  "zipCode": "string",
  "numberOfFailedStudies": 0
}
```

### Responses
| Code     | Description |
| -------- | ------- |
| 200  | Student updated successfully.  |

Schema:
```json
  {
  "id": 0,
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```



| Code     | Description |
| -------- | ------- |
| 400  | Student with the same e-mail already exists.  |
| 401  | Missing or invalid bearer token.|
| 422  | Payload failed validation. |

</details>

<details>

<summary>PUT</summary>
<br>
url: https://test-app.engeto.cz/students/{student_id}
<br>
Updates an existing student using the supplied partial payload.

### Parameters
| Name     | Description |
| -------- | ------- |
| student_id * (required) [integer]  | student_id    |


### Request body
```json
  {
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "isEuCitizen": true,
  "zipCode": "string",
  "numberOfFailedStudies": 0
}
```

### Responses
| Code     | Description |
| -------- | ------- |
| 200  | Student updated successfully.  |

Schema:
```json
  {
  "id": 0,
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```



| Code     | Description |
| -------- | ------- |
| 401  | Missing or invalid bearer token.  |
| 404  | Student with the given ID was not found.|
| 422  | Validation Error.|

</details>


<details>

<summary>DELETE</summary>
<br>
url: https://test-app.engeto.cz/students/{student_id}
<br>
Deletes the student identified by the provided ID.

### Parameters
| Name     | Description |
| -------- | ------- |
| student_id * (required) [integer]  | student_id    |


### Responses
| Code     | Description |
| -------- | ------- |
| 200  | Delete operation completed (but data may not be deleted - bug for testing). |

Schema:
```json
  "string"
```

| Code     | Description |
| -------- | ------- |
| 400  | Student with the same e-mail already exists.  |
| 404  | Student with the given ID was not found.|
| 422  | Validation Error.|


</details>

## Testovací scénáře
### Ověření konzistence s DB
### Generování sady testů

Použili jsme vlastní nástroj: <br>
[Generování requestů do Postmanu](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/Generov%C3%A1n%C3%AD%20request%C5%AF%20do%20Postmanu.pdf) <br> [Nástroj je zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/gen_requests_Postman.xlsm)

<details>

<summary>GET</summary>

Před započetím testu si vyexportujeme tabulku z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)

Příprava testovacích dat, pro metody GET a POST je stejná, [postup](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/pripravaDatGETPOST.md) .

Postup, jakým jsme spustili testy v Postmanu je zde:
[Jak spustit Postman hromadne](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/jak_Spustit_Postman_Hromadne.md)


Samotné porovnání výsledků testu provedeme dle manuálu
[porovnani vysledku GET](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/porovnaniVysledkuGet.md)

[vysledky testu GET](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/vysledky_Testu_GET.md)

</details>


<details>

<summary>POST</summary>

Před započetím testu si vyexportujeme tabulku z DB, dle manuálu [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)

Příprava testovacích dat, pro metody GET a POST je stejná, [postup](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/pripravaDatGETPOST.md) .

Postup, jakým jsme spustili testy v Postmanu je zde:
[Jak spustit Postman hromadne](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/jak_Spustit_Postman_Hromadne.md)


Samotné porovnání výsledků testu provedeme dle manuálu
[porovnani vysledku POST](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/porovnaniVysledkuGet.md)

[vysledky testu POST](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/vysledky_Testu_GET.md)


</details>






