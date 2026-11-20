# Testy GET

## Úspěšně přidaný záznam do DB

Úspěšně přidaný záznam, znamená, že pomocí metody POST se zapíší data do DB.

Tělo requestu je:

```json
{
  "firstName": "jonasR1001",
  "lastName": "SOBOTAR101",
  "email": "jb.jb@sob2.jbR6001 ",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

Postman vypíše odezvu:

```json
{
    "id": 472,
    "firstName": "jonasR1001",
    "lastName": "SOBOTAR101",
    "email": "jb.jb@sob2.jbR6001 ",
    "isEuCitizen": true,
    "numberOfFailedStudies": 0
}
```
Přidanému záznamu bylo přiřazeno id = 472. Dle přiřazeného id dohledáme ostatní data záznamu v DBeveru.
```SQL
SELECT * FROM students WHERE id = 472
```
DBeaver vrací:

| id    | first_name  | last_name  | email  | is_eu_citizen  |  number_of_failed_studies  |  
| ----- | ----------  | ---------  | -----  | -------------  |  ------------------------  |
| 472   | jonasR1001      | SOBOTAR101    | jb.jb@sob2.jbR6001  | True   |  0                         |

Status Code : 201 201 Created <br>
A new resource was created successfully.
<br<br>
Záznam byl přidán úspěšně
<br<br>

## Neúspěšně přidaný záznam do DB

Opakujeme request znovu, Tělo requestu je stejné:

```json
{
  "firstName": "jonasR1001",
  "lastName": "SOBOTAR101",
  "email": "jb.jb@sob2.jbR6001 ",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

Postman vypíše odezvu:

```json
{
    "detail": "Student with the same e-mail already exists",
    "code": "STUDENT_EMAIL_EXISTS"
}
```



## Testování duplicitně přidané hodnoty email

Vyhledáme první námi zadaný záznam s first_name = 'jonasR' v DBeaveru
```SQL
SELECT MIN(id) FROM students WHERE last_name IS NULL
```

DBeaver vrací:
| min     |  
| -------- |
| 428 |

První námi vytvořený záznam má tedy id = 428

Vyhledáme tedy všechny hodnoty záznamu s id = 428
```SQL
SELECT * FROM students WHERE id = 428
```
DBeaver vrací:

| id    | first_name  | last_name  | email  | is_eu_citizen  |  number_of_failed_studies  |  
| ----- | ----------  | ---------  | -----  | -------------  |  ------------------------  |
| 428   | jonasR      | SOBOTAR    | jb.jb@sob2.jbR | True   |  0                         |

Dle dokumentace k testům [zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Testovani%20REST%20API.md), vložíme tělo requestu :

```json
{
  "firstName": "jonasR",
  "lastName": "SOBOTAR",
  "email": "jb.jb@sob2.jbR",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

Odezva requestu je následující:
```json
{
    "detail": "Student with the same e-mail already exists",
    "code": "STUDENT_EMAIL_EXISTS"
}
```

Request vrací status code = 400 - Bad Request

Přípravou testovacích dat, se zabývá dokumentace zde [priprava testovacich dat](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/generuj%20GET_POST.md) , podkapitola "Kombinatorika jedinečných hodnot"

Následně jsme pokračovali dle postupu zde, dle bodu 2,
[porovnani probehlych testu](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/vysledky_POST_probehle.md)

Níže uvádíme tabulku vyhodnocení testů:

| first_name  | last_name  | email  |  poznámka |  Status code  | Výsledek testu  |
| ----------  | ---------  | -----  | -----------------------  |  ------  |  ------  |
| jonasR101      | SOBOTAR101    | jb.jb@sob2.jbR | pouze hodnota email je duplicitní, ostatní jsou unikátní | 400 |  Failed  |
| jonasR201      | SOBOTAR201    | jb.jb@sob2.jbR101 | všechny hodnoty jsou unikátní | 201 |  Passed  |
| jonasR101      | SOBOTAR101    | jb.jb@sob2.jbR601 |  pouze hodnota email je unikátní, ostatní jsou duplicitní | 201 |  Passed  |



