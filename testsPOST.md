# Testy GET

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

Následně jsme pokračovali dle postupu zde, dle bodu 2
[porovnani probehlych testu](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/vysledky_POST_probehle.md)




