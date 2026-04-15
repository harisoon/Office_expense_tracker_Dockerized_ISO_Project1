
# RTTPP Projekat – Sprint 1

## 📌 Opis projekta
Web aplikacija za upravljanje korisnicima i autentifikaciju, razvijena pomoću **Flask** okvira i **PostgreSQL** baze podataka. Aplikacija omogućava administratoru da dodaje korisnike i upravlja pristupom sistemu. Korisnici se mogu prijaviti i koristiti funkcionalnosti dostupne prema svojim privilegijama.

---

## ⚙️ Setup uputstvo

1. Klonirati repozitorij:
   ```
   git clone https://github.com/ime-repozitorija.git
   ```
2. Ući u folder projekta:
   ```
   cd naziv-foldera
   ```
3. Kreirati virtualno okruženje:
   ```
   python -m venv venv
   source venv/bin/activate  # na Windows: venv\Scripts\activate
   ```
4. Instalirati zavisnosti:
   ```
   pip install -r requirements.txt
   ```
5. Pokrenuti aplikaciju:
   ```
   flask run
   ```

---

## ✅ Implementirane funkcionalnosti

- [x] Osnovna Flask struktura projekta
- [x] Kreirana i povezana PostgreSQL baza (djelimično migrirana)
- [x] Definisani user stories prema INVEST principima
- [x] Odluka da korisnike dodaje isključivo administrator radi sigurnosti
- [x] Početna login logika (u izradi)

---

## 📊 Status implementacije

| Funkcionalnost               | Status        | Zaduženi članovi              |
|-----------------------------|---------------|-------------------------------|
| Osnovni Flask setup         | ✅ Završeno   | Svi                          |
| Login logika                | ✅ Završeno   | Mujo Alić, Haris Vikalo      |
| PostgreSQL baza             | ✅ Završeno   | Mahir Halilović              |
| Dokumentacija & status      | ✅ Završeno   | Hasan Avdić (Scrum Master)   |
| User stories & Jira zadaci  | ✅ Završeno   | Ehlimana Beganović           |

---

## 🚧 Problemi u Sprintu 1

- Migracija baze u Flask aplikaciju nije prošla bez grešaka — u narednom sprintu će se raditi na rješavanju ovog problema.
- Login funkcionalnost još nije potpuno povezana s bazom.

---

## 📅 Sprint sastanci

- **06.04.2025** – Inicijalni sastanak, raspodjela zadataka
- **08.04.2025** – Detaljna razrada taskova
- **10.04.2025** – Redefinisanje korisničkih zahtjeva, plan za dalji razvoj

---

## 📍 Plan za naredni sprint

- Završetak login funkcionalnosti
- Puna migracija baze u aplikaciju
- Početak razvoja admin dashboarda
- Dodavanje testova za postojeće funkcionalnosti
