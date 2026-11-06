## Generování requestů GET + POST
Stáhneme soubor
[zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/Tools/Gen%20Request/gen_requests_Postman.xlsm) <br>
Je potřeba odblokovat makra:
[Jak odblokovat makra](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/odblok_Makro_VBA.md) <br>
Otevřeme stažený soubor.<br>
<br>

<details>
<summary>list "info"</summary>
 
<br>
Vyplníme hodnoty do buněk A2 a A5

![infoVBA](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/infoVBA.png)

</details>



<details>
<summary>list "request"</summary>

List request vyplníme podle vzoru viz obrázek níže:
![VBArequest](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/request.png) <br>
 <br>
kde jsme barevně zarámovali vstupní hodnoty. Stejnou barvou jsou zarámované hodnoty v Postmanu
![reqestColPost](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/requestColorPostman.png)

</details>


<details>
<summary>list "POST - body"</summary>

### Vyplnění sloupců A , B , C
Vyplníme list POST - body dle vzoru níže:
![postBodyVBA](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/POST-bodyVBA.png)

Kde sloupce B a C odpovídají tělu requestu v Postmanu. Sloupec A odpovídá atributům z DB.
![bodyPostman](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/postManBodyVzor.png) <br>
<br>

### Vytvoření sady jedinečných hodnot
Pro testování je však zapotřebí vytvořit jedinečnou sadu hodnot. Je potřeba tedy ověřit, že data ve sloupci C nejsou duplicitní k datům exportovaným z DB. 

<details>
<summary>Nastavení složky s daty z DB</summary>
<br>
Postup exportování dat z DB popisujeme
[zde](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/export_DB.md) <br>

Poté je potřeba nastavit složku s cestou s exportovanými csv soubory. Lze zadat jakoukoliv nadřazenou složku. Program vyhledá všechny csv soubory, které jsou názvu [název tabulky]_datum čas.csv. <br>
Adresu nadřazené složky můžeme překopírovat pomocí Ctrl+C a Ctrl+V z průzkumníku složek, nebo složku vybrat pomocí tlačítka
 ![slozkaButt](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/slozkaButtt.png)
 
</details>

<details>
<summary>Ověření duplicitnícxh dat</summary>
<br>
Po stisku tlačítka "Vytvor unikatni testovaci data" se záznamy všech těchto tabulek, uloženými na adrese výše, porovnají s hodnotami ve sloupci C.
Nalezne-li program shodná data ve sloupci C s daty vyexportovanými z DB, pak se zeptá uživatele, zda hodnotu smí přečíslovat. Po stisku na tlačítko "Ano" se hodnota přečísluje.
 
![precisluj](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/unikatniDataTest.png)
<br>
Potvrdili jsme "Ano" a duplicitní hodnoty se přečíslovali, viz obr níže, sloupec C.
![precisl](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/hodnZmenene.png)

</details>

### Kombinatorika jedinečných hodnot
Stisknutím tlačítka "Kombinuj requesty POST" se vytvoří kombinace jednotlivých requestů metody POST. Všechny vytvořené kombinace jsou vygenerovány na list "kombinatorika"
![kombinatorika](https://github.com/jonasRower/Testing-Engeto-Project-2/blob/main/MD/png/kombinatorika.png)

