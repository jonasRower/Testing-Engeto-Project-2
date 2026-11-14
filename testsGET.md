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
