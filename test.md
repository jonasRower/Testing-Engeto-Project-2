## Existence názvů sloupců tabulky students v DBeaver

Request
GET : https://test-app.engeto.cz/students/39

vrací Response
```json
  {
    "id": 39,
    "firstName": "Jan",
    "lastName": "ŽIŽKA",
    "email": "oko1@trocnov.cz",
    "isEuCitizen": true,
    "numberOfFailedStudies": 55
}
```

Očekávám názvy sloupců tabulky students v DBeaveru shodné s názvy klíčů odezvy.


| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Název sloupce tabulky "id"  | GET : https://test-app.engeto.cz/students/39  |select id from students where id = 39  | 39 | 200 | Passed |
| Název sloupce tabulky "firstName"  | GET : https://test-app.engeto.cz/students/39  | select * from students where firstname = 'Jan'  | SQL Error [42703]: ERROR: column "firstname"  does not exist  | 200 | Failed |
| Název sloupce tabulky "lastname"  | GET : https://test-app.engeto.cz/students/39  | select * from students where lastname = 'ŽIŽKA'  | SQL Error [42703]: ERROR: column "lastname" does not exist  | 200 | Failed |
| Název sloupce tabulky "email"  | GET : https://test-app.engeto.cz/students/39  | select email from students where email = 'oko1@trocnov.cz'  | oko1@trocnov.cz  | 200 | Passed |
| Název sloupce tabulky "isEuCitizen"  | GET : https://test-app.engeto.cz/students/39  | select * from students where isEuCitizen = True  | SQL Error [42703]: ERROR: column "iseucitizen" does not exist  | 200 | Failed |
| Název sloupce tabulky "isEuCitizen"  | GET : https://test-app.engeto.cz/students/39  | select * from students where numberOfFailedStudies = 0  | SQL Error [42703]: ERROR: column "numberoffailedstudies" does not exist  | 200 | Failed |

<br><br>

## Existence dat v jednotlivých záznamech v tabulce students v DBeaveru

Počet záznamů zjistíme SQL dotazem
```SQL
select MAX(id) from students;
```
DBeaver vrací:
| max     |  
| -------- |
| 467 |

Databáze tedy v současnosti obsahuje 467 záznamů. Testujeme 2 dotazy pro jednotlivé sloupce tabulky.
<br>
SQL dotaz 1
```SQL
SELECT COUNT([název sloupce]) FROM students WHERE [název sloupce]) IS NOT NULL
```
SQL dotaz 2
```SQL
SELECT COUNT([název sloupce]) FROM students WHERE [název sloupce]) = ''
```
Předmětem pečlivějšího následného prověřování mohou být názvy sloupců, kde počet prázdných (příp. nevyplněných) hodnot dosahují počtu záznamů.

| Test      | SQL dotaz 1  | SQL výsledek 1  | Vyhodnocení 1  | SQL dotaz 2  | SQL výsledek 2   | Vyhodnocení 2  |
| -------- | --------  | --------  | --------  | --------  | --------  | --------  |  
| Počet záznamů "id"  | SELECT COUNT(id) FROM students WHERE id IS NOT NULL  | 467 | neexistuje prázdná hodnota | SELECT COUNT(id) FROM students WHERE id = 0  | 0 | neexistuje nevyplněná hodnota |
| Počet záznamů "first_name"  | SELECT COUNT(first_name) FROM students WHERE first_name IS NOT NULL | 467 | neexistuje prázdná hodnota | SELECT COUNT(first_name) FROM students WHERE first_name = ''  | 21 | existují nevyplněné hodnoty |
| Počet záznamů "last_name"  | SELECT COUNT(last_name) FROM students WHERE last_name IS NOT NULL  | 398 | některé záznamy obsahují prázdné hodnoty | SELECT COUNT(last_name) FROM students WHERE last_name = ''  | 5 | existují nevyplněné hodnoty |
| Počet záznamů "email"  | SELECT COUNT(email) FROM students WHERE email IS NOT NULLL  | 395 | některé záznamy obsahují prázdné hodnoty | SELECT COUNT(email) FROM students WHERE email = ''  | 20 | existují nevyplněné hodnoty |
| Počet záznamů "is_eu_citizen"  | SELECT COUNT(is_eu_citizen) FROM students WHERE is_eu_citizen IS NOT NULL  | 467 | neexistuje prázdná hodnota | SELECT COUNT(is_eu_citizen) FROM students WHERE is_eu_citizen = false  | 217 | existují nevyplněné hodnoty |
| Počet záznamů "zip_code"  | SELECT COUNT(zip_code) FROM students WHERE zip_code IS NOT NULL  | 467 | neexistuje prázdná hodnota | SELECT COUNT(zip_code) FROM students WHERE zip_code = ''  | 467 | neexistuje vyplněná hodnota |
| Počet záznamů "number_of_failed_studies"  | SELECT COUNT(number_of_failed_studies) FROM students WHERE number_of_failed_studies IS NOT NULL  | 467 | neexistuje prázdná hodnota | SELECT COUNT(number_of_failed_studies) FROM students WHERE number_of_failed_studies = 0  | 338 | existují nevyplněné hodnoty |








