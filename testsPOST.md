# Testy POST

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
Status Code : <br>
201 Created <br>
A new resource was created successfully.
<br><br>

Přidanému záznamu bylo přiřazeno id = 472. Dle přiřazeného id dohledáme ostatní data záznamu v DBeveru.
```SQL
SELECT * FROM students WHERE id = 472
```
DBeaver vrací:

| id    | first_name  | last_name  | email  | is_eu_citizen  |  number_of_failed_studies  |  
| ----- | ----------  | ---------  | -----  | -------------  |  ------------------------  |
| 472   | jonasR1001      | SOBOTAR101    | jb.jb@sob2.jbR6001  | True   |  0                         |


Záznam byl přidán úspěšně
<br><br>

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
Status Code : <br>
400 Bad Request <br>
The server could not understand the request. Maybe a bad syntax?

Exportováním dat z DBeveru před a po testu a porovnáním, se můžeme přesvědčit, že skutečně žádná jiná data přidána do DB nejsou.
Manuál je zde: [export z DB](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md)
<br><br>

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


## Testování konzistence request / response

V Postmanu vložíme request s tělem:
```json
{
  "firstName": "jonasR2001",
  "lastName": "sobota101",
  "email": "jb.jb@sob2.jbR8001 ",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

Odezva requestu je následující:
```json
{
    "id": 474,
    "firstName": "jonasR2001",
    "lastName": "SOBOTA101",
    "email": "jb.jb@sob2.jbR8001 ",
    "isEuCitizen": true,
    "numberOfFailedStudies": 0
}
```

Porovnání zobrazíme v tabulce

| klíč  | hodnota request  | hodnota response  |  Výsledek testu | 
| ----------  | ---------  | ----------------  | --------------  |
| firstName  | jonasR2001  | jonasR2001  | Passed  |
| lastName  | sobota101  | SOBOTA101  | Failed  |
| email  | jb.jb@sob2.jbR8001  | jb.jb@sob2.jbR8001  | Passed  |
| isEuCitizen  | true  | true  | Passed  |
| numberOfFailedStudies  | 0  | 0  | Passed  |

Níže testujeme, zda se převádí opravdu všechna písmena základní abecedy
```json
{
  "firstName": "abcdefghijklmnopqrstuvwxyz",
  "lastName": "abcdefghijklmnopqrstuvwxyz",
  "email": "jb.jb@sob2.abc ",
  "isEuCitizen": true,
  "numberOfFailedStudies": 0
}
```

Odezva requestu je následující:
```json
{
    "id": 475,
    "firstName": "abcdefghijklmnopqrstuvwxyz",
    "lastName": "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "email": "jb.jb@sob2.abc ",
    "isEuCitizen": true,
    "numberOfFailedStudies": 0
}
```
Skutečně, všechna písmena základní abecedy se převádí na velká písmena


## Testování konzistence request / DBeaver

Vyhledáme v DBeveru záznam s id = 474
```SQL
SELECT * FROM students WHERE id = 474
```

DBever vrací data:
| id    | first_name  | last_name  | email  | is_eu_citizen  |  number_of_failed_studies  |  
| ----- | ----------  | ---------  | -----  | -------------  |  ------------------------  |
| 474   | jonasR2001      | SOBOTA101    | jb.jb@sob2.jbR8001  | True   |  0              |

Vyhodnocení testu zobrazíme v tabulce:

| klíč  | hodnota request  | hodnota DB  |  Výsledek testu | 
| ----------  | ---------  | ----------------  | --------------  |
| firstName  | jonasR2001  | jonasR2001  | Passed  |
| lastName  | sobota101  | SOBOTA101  | Failed  |
| email  | jb.jb@sob2.jbR8001  | jb.jb@sob2.jbR8001  | Passed  |
| isEuCitizen  | true  | true  | Passed  |
| numberOfFailedStudies  | 0  | 0  | Passed  |

Výsledek testu vychází stejně jako při vyhodnocení testu konzistence request / response.

## Testování speciálních znaků

Testování závorek. Tělo requestu:
```json
{
  "firstName": "(){}",
  "lastName": "(){}",
  "email": "(){}",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 476,
    "firstName": "(){}",
    "lastName": "(){}",
    "email": "(){}",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code 201
<br><br>

Testování vložení requestu s již existujícími hodnotami v DB. Vkládají se speciální znaky. Existující záznam má id = 200.
```json
{
  "firstName": "?:_!/(",
  "lastName": "?:_!/(",
  "email": "?:_!/(",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 477,
    "firstName": "?:_!/(",
    "lastName": "?:_!/(",
    "email": "?:_!/(",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code 201
<br><br>


Testování vložení requestu s již existujícími hodnotami v DB. Vkládají se speciální znaky. Existující záznam má id = 148.
```json
{
  "firstName": ">$ß¤×÷¨¸>$ß¤×÷¨¸@seznam.",
  "lastName": ">$ß¤×÷¨¸>$ß¤×÷¨¸@seznam.",
  "email": "musi byt neco jineho, jinak to nefunguje2",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 480,
    "firstName": ">$ß¤×÷¨¸>$ß¤×÷¨¸@seznam.",
    "lastName": ">$SS¤×÷¨¸>$SS¤×÷¨¸@SEZNAM.",
    "email": "musi byt neco jineho, jinak to nefunguje2",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code 201
<br><br>

Testování tabulátoru. Request:
```json
{
  "firstName": "    ",
  "lastName": " ",
  "email": "    ",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 482,
    "firstName": "    ",
    "lastName": " ",
    "email": "    ",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code 201
<br><br>

Testování speciálního znaku ASCII 9 viz zde: [ASCII 9](https://www.ascii-code.com/9)
```json
{
  "firstName": "	",
  "lastName":  "	",
  "email":  "	",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}

```

Odezva:
```json
{
    "detail": "body -> 19: JSON decode error",
    "code": "VALIDATION_ERROR"
}
```

Status Code: 
422 Unprocessable Entity (WebDAV) (RFC 4918)
The request was well-formed but had semantic errors.
<br><br>


Testování vložení requestu s již existujícími hodnotami v DB. Vkládají se speciální znaky. Existující záznam má id = 41.
```json
{
  "firstName": "' OR 1=1 --",
  "lastName": "' OR 1=1 --",
  "email": "' OR 1=1 --",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 478,
    "firstName": "' OR 1=1 --",
    "lastName": "' OR 1=1 --",
    "email": "' OR 1=1 --",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code: 201
<br><br>

Přehlasovaná písmena
```json
{
  "firstName": " ä, ö, ü Ä, Ö, Ü, ë, ï, ÿ",
  "lastName": " ä, ö, ü Ä, Ö, Ü, ë, ï, ÿ",
  "email": " ä, ö, ü Ä, Ö, Ü, ë, ï, ÿ",
  "isEuCitizen": false,
  "numberOfFailedStudies": 0
}
```

Odezva:
```json
{
    "id": 483,
    "firstName": " ä, ö, ü Ä, Ö, Ü, ë, ï, ÿ",
    "lastName": " Ä, Ö, Ü Ä, Ö, Ü, Ë, Ï, Ÿ",
    "email": " ä, ö, ü Ä, Ö, Ü, ë, ï, ÿ",
    "isEuCitizen": false,
    "numberOfFailedStudies": 0
}
```

Status Code 201
<br><br>

