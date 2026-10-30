
# Projekt: Testování REST API
## Přehled nástrojů - dle zadání
1. DBeaver- přístup do databáze
2. Postman - zasílaní požadavků na REST API
3. Textový editor - editace šablony pro projekt

## Přehled nástrojů - vytvořené zpracovatelem
1. [Generování requestů do Postmanu](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/Generov%C3%A1n%C3%AD%20request%C5%AF%20do%20Postmanu.pdf) <br> [Nástroj je zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/gen_requests_Postman.xlsm)
2. [Porovnávání tabulek](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/Porovn%C3%A1v%C3%A1n%C3%AD%20tabulek.pdf) <br> [Nástroj je zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Compare%20csv%20%26%20json/jsons_Csv_Comparator.xlsm)

## Zadání
Cílem projektu je otestování REST rozhraní běžící na adrese https://test-app.engeto.cz/students.<br>
Rozhraní slouží pro manipulaci dat studentů. Otestuj metody GET, POST, PUT a DELETE. Tvým úkolem je ověřit, zda API rozhraní správně reaguje na chyby, úspěch, ale i to, jestli je konzistentní s databází. Nezapomeň aplikovat znalosti z lekcí 1 až 4 (testovací scénáře, defekt, status kódy, SQL dotazy,...).

Platí, že: <br>
1. metoda GET zobrazí data o existujícim studentovi
2. metoda POST založí záznam o studentovi
3. metoda PUT upraví záznam o studentovi
4. metoda DELETE smaže data o studentovi

```css
body {
  font-size: 16px;  /* comment */
}
```

<details>

<summary>Tips for collapsed sections</summary>

### You can add a header

You can add text within a collapsed section.

You can add an image or a code block, too.

```ruby
   puts "Hello World"
```

</details>

```diff
! This line is blue
```
