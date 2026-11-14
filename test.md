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

