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
| id    | first_name  | last_name  | email  | is_eu_citizen  |  number_of_failed_studies  |  
| ----- | ----------  | ---------  | -----  | -------------  |  ------------------------  |
| 428   | jonasR      | SOBOTAR    | jb.jb@sob2.jbR | True   |  0                         |
