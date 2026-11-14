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
| Název sloupce tabulky "is_Eu_Citizen"  pro "id" = 20  | GET : https://test-app.engeto.cz/students/20  | SELECT is_Eu_Citizen FROM students WHERE id = 20  | False  | 200 | Passed |
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
| Hodnota sloupce tabulky "id" pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT id FROM students WHERE id = 116  | 116 | 200 | Passed |
| Hodnota sloupce tabulky "first_Name"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT first_name FROM students WHERE id = 116  | ''  | 200 | Passed |
| Hodnota sloupce tabulky "last_name"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT last_name FROM students WHERE id = 116  | '' | 200 | Passed |
| Hodnota sloupce tabulky "email"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT email FROM students WHERE id = 116  | '' | 200 | Passed |
| Hodnota sloupce tabulky "is_Eu_Citizen"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT is_Eu_Citizen FROM students WHERE id = 116  | True | 200 | Passed |
| Hodnota sloupce tabulky "number_Of_Failed_Studies"  pro "id" = 116  | GET : https://test-app.engeto.cz/students/116  | SELECT number_Of_Failed_Studies FROM students WHERE id = 116  | 0  | 200 | Passed |


## Testování zda email musí obsahovat '@'

id záznamu v DBeveru, který budeme testovat, zjistíme následujícím dotazem:
```SQL
SELECT min(id) FROM students where email not like '%@%'
```
DBeaver vrací:
| min     |  
| -------- |
| 35 |


Do Postmanu zadáme url pro metodu GET
https://test-app.engeto.cz/students/35

Postman vrací response
```json
{
    "id": 35,
    "firstName": "Marek",
    "lastName": "Novak",
    "email": "invalid",
    "isEuCitizen": true,
    "numberOfFailedStudies": 0
}
```

Data ověříme provedením SQL dotazů:

| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Hodnota sloupce tabulky "email" pro "id" = 35  | GET : https://test-app.engeto.cz/students/35  | SELECT email FROM students where id = 35  | invalid | 200 | Passed |




## Testování zda email může začínat znakem '@'

id záznamu v DBeveru, který budeme testovat, zjistíme následujícím dotazem:
```SQL
SELECT min(id) FROM students where email like '@%'
```
DBeaver vrací:
| min     |  
| -------- |
| 64 |


Do Postmanu zadáme url pro metodu GET
https://test-app.engeto.cz/students/64

Postman vrací response
vrací Response
```json
{
    "id": 64,
    "firstName": "Jakub",
    "lastName": "EDA",
    "email": "@eda.cz",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Data ověříme provedením SQL dotazů:

| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Hodnota sloupce tabulky "email" pro "id" = 64  | GET : https://test-app.engeto.cz/students/64  | SELECT email FROM students where id = 64  | @eda.cz | 200 | Passed |


## Testování zda email může končit znakem '@'

id záznamu v DBeveru, který budeme testovat, zjistíme následujícím dotazem:
```SQL
SELECT min(id) FROM students where email like '%@'
```
DBeaver vrací:
| min     |  
| -------- |
| 121 |


Do Postmanu zadáme url pro metodu GET
https://test-app.engeto.cz/students/121

Postman vrací response
vrací Response
```json
{
    "id": 121,
    "firstName": "TC_POST_06",
    "lastName": "EMAILVALIDATION",
    "email": "invalid.email@",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Data ověříme provedením SQL dotazů:

| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Hodnota sloupce tabulky "email" pro "id" = 121  | GET : https://test-app.engeto.cz/students/121  | SELECT email FROM students where id = 121  | invalid.email@ | 200 | Passed |


## Testování speciálních znaků

Pomocí SQL dotazů zjistíme existující záznamy v DB obsahující speciální znaky

| Speciální znak     | SQL dotaz     | nalezené id  | Request  | Klíč Response  | Hodnota Response  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  | --------  | --------  | --------  | --------  |
| ?  | SELECT min(id) FROM students WHERE email LIKE '%?%' or first_name LIKE '%?%' or last_name LIKE '%?%' | 187 | GET : https://test-app.engeto.cz/students/187  | email  | ?? Response  | SELECT email FROM students WHERE id = 187   | ?? | 200 | Passed |
| :  | SELECT min(id) FROM students WHERE email LIKE '%:%' or first_name LIKE '%:%' or last_name LIKE '%:%' | 200 | GET : https://test-app.engeto.cz/students/200  | firstname  | ?:_!/(  | SELECT first_name FROM students WHERE id = 200  | ?:_!/( | 200 | Passed |
| ;  | SELECT min(id) FROM students WHERE email LIKE '%;%' or first_name LIKE '%;%' or last_name LIKE '%;%' | 233 | GET : https://test-app.engeto.cz/students/233  | firstname  | '; DROP TABLE students;--  | SELECT firstname FROM students WHERE id = 233  |  | 200 | Passed |
| (  | SELECT min(id) FROM students WHERE email LIKE '%(%' or first_name LIKE '%(%' or last_name LIKE '%(%' | 200 | GET : https://test-app.engeto.cz/students/200  | firstname  | ?:_!/(  | SELECT first_name FROM students WHERE id = 200 |  | 200 | Passed |
| )  | SELECT min(id) FROM students WHERE email LIKE '%)%' or first_name LIKE '%)%' or last_name LIKE '%)%' | NULL |   | SELECT email FROM students WHERE id =    | Klíč Response  | Hodnota Response  |  | 200 | Passed |
| {  | SELECT min(id) FROM students WHERE email LIKE '%{%' or first_name LIKE '%{%' or last_name LIKE '%{%' | NULL |   | SELECT email FROM students WHERE id =    | Klíč Response  | Hodnota Response  |  | 200 | Passed |
| }  | SELECT min(id) FROM students WHERE email LIKE '%}%' or first_name LIKE '%}%' or last_name LIKE '%}%' | NULL |   | SELECT email FROM students WHERE id =    | Klíč Response  | Hodnota Response  |  | 200 | Passed |
| \  | SELECT min(id) FROM students WHERE email LIKE '%\%' or first_name LIKE '%\%' or last_name LIKE '%\%' | NULL |   | SELECT email FROM students WHERE id =    | Klíč Response  | Hodnota Response  |  | 200 | Passed |
| /  | SELECT min(id) FROM students WHERE email LIKE '%/%' or first_name LIKE '%/%' or last_name LIKE '%/%' | 200 | GET : https://test-app.engeto.cz/students/200  | firstname  | ?:_!/(  | SELECT first_name FROM students WHERE id = 200 |  | 200 | Passed |
| *  | SELECT min(id) FROM students WHERE email LIKE '%*%' or first_name LIKE '%*%' or last_name LIKE '%*%' | 148 | GET : https://test-app.engeto.cz/students/148  | email  | *>$ß¤×÷¨¸*>$ß¤×÷¨¸@seznam.  | SELECT email FROM students WHERE id = 148 |  | 200 | Passed |
| -  | SELECT min(id) FROM students WHERE email LIKE '%-%' or first_name LIKE '%-%' or last_name LIKE '%-%' | 41 | GET : https://test-app.engeto.cz/students/41  | firstName  | ' OR 1=1 --  | SELECT firstName FROM students WHERE id = 41   |  | 200 | Passed |
| +  | SELECT min(id) FROM students WHERE email LIKE '%+%' or first_name LIKE '%+%' or last_name LIKE '%+%' | NULL |   | SELECT email FROM students WHERE id =    | Klíč Response  | Hodnota Response  |  | 200 | Passed |

