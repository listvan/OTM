# encoding: utf-8
# language: hu
@javascript
Jellemző: Folyamatok létrehozása, frissítése
  Abból a célból, hogy a kitűzött feladatok elkészítésénél tudjam hogy milyen részekből épültek fel
  egyszerű felhasználóként
  folyamatokat kell tudnom indítani és megállítani
  
  Forgatókönyv: Folyamat indítása, megállítása
    Amennyiben a rendszerben van egy példa feladat
    Ha a feladatokat listázó oldalra megyek
    És ráklikkelek az "Example Task" linkre
    Akkor az Example Task című feladat részletes oldalán kell lennem
    
    Ha megnyomom a "Start" gombot
    És megnyomom a "Finish" gombot
    Akkor hibát kell kapnom
    És azt kell látnom a hibaüzenetben, hogy "Meg kell adnia a folyamat leírását!"

    Ha begépelem a "task_process[description]" mezőbe a "Ez egy jó folyamat" szöveget
    És megnyomom a "Finish" gombot
    Akkor sikeres választ kell kapnom
    És azt kell látnom a státusz üzenetek között, hogy "Az új folyamat mentése sikeresen megtörtént"

    És azt kell látnom a folyamatok között, hogy "Ez egy jó folyamat"
