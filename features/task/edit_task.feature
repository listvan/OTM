# encoding: utf-8
# language: hu
@javascript
Jellemző: Feladat szerkesztése, kapcsolatok létrehozása
  Abból a célból, hogy a kitűzött feladatok helyesen szerepeljenek a rendszerben
  egyszerű felhasználóként
  tudnom kell a feldatatot, illetve a kapcsolatait szerkeszteni
  
  Forgatókönyv: Egy feladat szerkesztése
    Amennyiben a rendszerben van három példa feladat
    Ha a feladatokat listázó oldalra megyek
    És ráklikkelek a "Szerkesztés" linkre az Example Task című feladat sorában  
    Akkor az Example Task című feladat szerkesztésének az oldalán kell lennem
    
    Ha kiválasztom a "dependency[subject]" mezőből az "Example Task 1 (5)" feladatot
    És megnyomom a "Mentés" gombot a kik függenek tőlem formon belül
    Akkor sikeres választ kell kapnom
    És azt kell látnom a kik függenek tőlem feladatokban, hogy "Example Task 1"
    
    Ha kiválasztom a "dependency[object]" mezőből az "Example Task 2 (5)" feladatot
    És megnyomom a "Mentés" gombot a kiktől függök formon belül
    Akkor sikeres választ kell kapnom
    És azt kell látnom a kiktől függök feladatokban, hogy "Example Task 2"
        
    Ha kiválasztom a "task[children]" mezőből az "Example Task 1 (5)" feladatot
    És megnyomom a "Mentés" gombot a gyerek feladatok formon belül
    Akkor sikeres választ kell kapnom
    És azt kell látnom a gyerek feladatokban, hogy "Example Task 1"

    Ha begépelem a "task[title]" mezőbe az "Ez egy új feladat" szöveget
    És begépelem a "task[description]" mezőbe a "Nagyon fontos feladat!" szöveget
    És kiválasztom a "task[due_at]" mezőből a "2011-07-06" dátumot
    És kiválasztom a "task[priority]" mezőből a "3" opciót
    És kiválasztom a "task[parent_id]" mezőből az "Example Task 1 (5)" feladatot
    És megnyomom a "Mentés" gombot
    Akkor sikeres választ kell kapnom
    És azt kell látnom a szülő feladatban, hogy "Example Task 1"
    És azt kell látnom a megelőző feladatokban, hogy "Example Task 2"
    És azt kell látnom a követő feladatokban, hogy "Example Task 1"
    És azt kell látnom a gyerekek között, hogy "Example Task 1"

    Ha ráklikkelek a "Szerkesztés" linkre
    És ráklikkelek a "Törlés" linkre az Example Task 2 című megelőző feladat sorában
    Akkor sikeres választ kell kapnom
    De nem szabad látnom a kiktől függök feladatokban, hogy "Example Task 2"
    Ha megnyomom a "Mentés" gombot
    Akkor sikeres választ kell kapnom
    De nem szabad látnom a megelőző feladatokban, hogy "Exampla Task 2"


