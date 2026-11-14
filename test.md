| Test     | Request  | SQL dotaz  | SQL výsledek  |
| -------- | ------- | --------  | --------  |
| Název sloupce tabulky "id"  | GET : https://test-app.engeto.cz/students/39  |select id from students where id = 39  | 39 |
| Název sloupce tabulky "firstName"  | GET : https://test-app.engeto.cz/students/39  | select * from students where firstname = 'Jan'  | SQL Error [42703]: ERROR: column "firstname" does not exist  |
| 404  | Student with the given ID was not found.|
| 422  | Validation Error.|
