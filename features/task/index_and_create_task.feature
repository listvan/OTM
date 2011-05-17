# encoding: utf-8
# language: hu
@javascript
Jellemző: Feladatok listázása, létrehozása
  Abból a célból, hogy a kitűzött feladatokat be tudjuk tartani
  egyszerű felhasználóként
  listáznom kell tudni a feladatokat, illetve újakat kell tudnom létrehozni

  Forgatókönyv: Egy feladat létrehozása érvényes adatokkal
    Amennyiben a rendszerben van egy példa feladat
    Ha a feladatokat listázó oldalra megyek
    Akkor látnom kell a feladatok között a következő feladatot:
      | Example Task | 5 |
    Ha begépelem a "task[title]" mezőbe az "A" szöveget
    És megnyomom a "Mentés" gombot
    Akkor hibát kell kapnom
    És azt kell látnom a hibaüzenetben, hogy "A címnek legalább 3 karaktert kell tartalmaznia!"
    És az új feladat létrehozásának az oldalán kell lennem
    Ha begépelem a "task[title]" mezőbe az "Ez egy új feladat" szöveget
    És begépelem a "task[description]" mezőbe a "Nagyon fontos feladat!" szöveget
    És kiválasztom a "task[due_at]" mezőből a "2011-07-06" dátumot
    És kiválasztom a "task[priority]" mezőből a "3" opciót
    És megnyomom a "Mentés" gombot
    Akkor sikeres választ kell kapnom
    És azt kell látnom a státusz üzenetek között, hogy "Az új feladat mentése sikeresen megtörtént"
    És a feladatokat listázó oldalon kell lennem
    És látnom kell a feladatok között a következő feladatot:
      | Ez egy új feladat | 3 |
