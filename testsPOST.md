# Testy GET

## Testování duplicitně přidané hodnoty email

vyhledáme první námi zadaný záznam s first_name = 'jonasR' v DBeaveru
```SQL
SELECT MIN(id) FROM students WHERE last_name IS NULL
```

DBeaver vrací:
| min     |  
| -------- |
| 428 |

První námi vytvořený záznam má tedy id = 428
