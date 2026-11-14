| Test     | Request  | SQL dotaz  | SQL výsledek  | Status Code  | Výsledek testu  | 
| -------- | ------- | --------  | --------  | --------  | --------  |
| Název sloupce tabulky "id"  | GET : https://test-app.engeto.cz/students/39  |select id from students where id = 39  | 39 | 200 | Passed |
| Název sloupce tabulky "firstName"  | GET : https://test-app.engeto.cz/students/39  | select * from students where firstname = 'Jan'  | SQL Error [42703]: ERROR: column "firstname"  does not exist  | 200 | Failed |
| Název sloupce tabulky "lastname"  | GET : https://test-app.engeto.cz/students/39  | select * from students where lastname = 'ŽIŽKA'  | SQL Error [42703]: ERROR: column "lastname" does not exist  | 200 | Failed |
| Název sloupce tabulky "lastname"  | GET : https://test-app.engeto.cz/students/39  | select email from students where email = 'novak@example.com'  | novak@example.com  | 200 | Passed |

