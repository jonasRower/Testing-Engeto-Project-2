# Testy GET

## Testování prázdné hodnoty (NULL)

id záznamu v DBeveru, který budeme testovat, zjistíme následujícím dotazem:
```SQL
SELECT MIN(id) FROM students WHERE last_name IS NULL
```
DBeaver vrací:
| min     |  
| -------- |
| 20 |

Do Postmanu zadáme url pro metodu GET
https://test-app.engeto.cz/students/20

Postman vrací response
vrací Response
```json
{
    "id": 20,
    "firstName": null,
    "lastName": null,
    "email": null,
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Data ověříme provedením SQL dotazů:

| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Hodnota sloupce tabulky "id" pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT id FROM students WHERE id = 20  | 20 | 200 | Passed |
| Název sloupce tabulky "first_Name"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT first_name FROM students WHERE id = 20  | [NULL]  | 200 | Passed |
| Název sloupce tabulky "last_name"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT last_name FROM students WHERE id = 20  | [NULL]  | 200 | Passed |
| Název sloupce tabulky "email"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT email FROM students WHERE id = 20  | [NULL]  | 200 | Passed |
| Název sloupce tabulky "is_Eu_Citizen"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT is_Eu_Citizen FROM students WHERE id = 20  | [NULL]  | 200 | Passed |
| Název sloupce tabulky "number_Of_Failed_Studies"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/39  | SELECT number_Of_Failed_Studies FROM students WHERE id = 20  | 0  | 200 | Passed |


## Testování nevyplněné hodnoty ('')

id záznamu v DBeveru, který budeme testovat, zjistíme následujícím dotazem:
```SQL
SELECT MIN(id) FROM students WHERE last_name = ''
```
DBeaver vrací:
| min     |  
| -------- |
| 116 |

Do Postmanu zadáme url pro metodu GET
https://test-app.engeto.cz/students/116

Postman vrací response
vrací Response
```json
{
    "id": 116,
    "firstName": "",
    "lastName": "",
    "email": "",
    "isEuCitizen": true,
    "numberOfFailedStudies": 0
}
```

Data ověříme provedením SQL dotazů:

| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Hodnota sloupce tabulky "id" pro "id" = 116  | GET : https://test-app.engeto.cz/students/20  | SELECT id FROM students WHERE id = 116  | 116 | 200 | Passed |
| Hodnota sloupce tabulky "first_Name"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/20  | SELECT first_name FROM students WHERE id = 20  | ''  | 200 | Passed |
| Hodnota sloupce tabulky "last_name"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/20  | SELECT last_name FROM students WHERE id = 20  | '' | 200 | Passed |
| Hodnota sloupce tabulky "email"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/20  | SELECT email FROM students WHERE id = 20  | '' | 200 | Passed |
| Hodnota sloupce tabulky "is_Eu_Citizen"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/20  | SELECT is_Eu_Citizen FROM students WHERE id = 20  | [NULL] | 200 | Passed |
| Hodnota sloupce tabulky "number_Of_Failed_Studies"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/39  | SELECT number_Of_Failed_Studies FROM students WHERE id = 116  | 0  | 200 | Passed |
