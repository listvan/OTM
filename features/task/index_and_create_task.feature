# encoding: utf-8
# language: hu

Jellemző: Feladatok listázása, létrehozása
  Abból a célból, hogy a kitűzött feladatokat be tudjuk tartani
  egyszerű felhasználóként
  listáznom kell tudni a feladatokat, illetve újakat kell tudnom létrehozni

  Forgatókönyv: Egy feladat létrehozása érvényes adatokkal
    Amennyiben a feladatok listázásának oldalán vagyok
    Ha ráklikkelek az "Új Feladat" létrehozása linkre
    Akkor azt kell látnom az új feladat létrehozásának opciói között, hogy "Cím"
    És azt kell látnom az új feladat létrehozásának opciói között, hogy "Leírás"
    És azt kell látnom az új feladat létrehozásának opciói között, hogy "Határidő"
    És azt kell látnom az új feladat létrehozásának opciói között, hogy "Prioritás"
    Ha begépelem a "task[title]" mezőbe az "Ez egy új feladat" szöveget
    És begépelem a "task[description]" mezőbe az "Nagyon fontos feladat!" szöveget
    És begépelem a "task[due_at]" mezőbe az "2011-05-16" szöveget
    És kiválasztom a "priority" mezőből a "10" opciót
    És megnyomom a "Mentés" gombot
    Akkor sikeres választ kell kapnom
    És azt kell látnom a státusz üzenetek között, hogy "Az új feladat mentése sikeresen megtörtént"
    És a feladatok listázásának oldalán kell lennem
    És látnom kell a feladatok között a következő feladatot:
      | Ez egy új feladat | 2011-05-16 | 10 |
