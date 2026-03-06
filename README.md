# Benutzerverwaltung-Web-Service
Ein Web Service für das Anlegen, verwalten, authentifizieren und löschen von Benutzeraccounts. <br>
Implementiert in JS mit NodeJS und Docker.

# Aufbau
Benutzerverwaltung-Web-Service <br>
├── .dockerignore <br>
├── .env (Muss hinzugefügt werden, siehe .env.example) <br>
├── .env.example <br>
├── .gitignore <br>
├── docker-compose.yml <br>
├── Dockerfile <br>
├── README.md <br>
├── src <br>
│   ├── config <br>
│   │   └── config.js (Datenbank Config über .env) <br>
│   ├── index.js (Main Script) <br>
│   ├── models <br>
│   │   ├── index.js <br>
│   │   └── Users.js (Datenbank Modell von User) <br>
│   ├── package-lock.json <br>
│   ├── package.json <br>
│   ├── routes <br>
│   │   └── Users.js (Endpunkt Implementation) <br>
│   ├── utils <br>
│   │   ├── Inputvalidation (Validierungsfunktionen für Eingabefelder) <br>
│   │   │   ├── validateEmail.js <br>
│   │   │   ├── validatePassword.js <br>
│   │   │   └── validateUsername.js <br>
│   │   └── validateToken.js (Validierungsfunktion für JWT) <br>

# Endpunkte:
## Registrierung:
- Endpunkt zum registieren eines Benutzers. Der Benutzer wird noch nicht angemeldet und der Account ist noch nicht aktiviert, erhält jedoch einen Aktivierungscode.
- POST /Users/register -> {username: string, password: string, email: string} -> {success: true, activationcode: int} || {success: false, error: string}

## Aktivierung:
- Endpunkt zum Aktivieren eines Accounts mithilfe des verschickten Aktivierungscode. Account ist danach aktiviert, aber Benutzer wird noch nicht eingeloggt.
- POST /Users/activate -> {username: string, activationcode: int} -> {success: true} || {success: false, error: string}

## Login:
- Endpunkt um einen Benutzer einzuloggen. Sendet ein JWT zurück, welches gebraucht wird um auf die weiteren Endpunkte zuzugreifen.
- POST /Users/login -> {username: string, password: string} -> {success: true, accessToken: string} || {success: false, error: string}

## Auth:
- Endpunkt um einen Benutzer zu authentifizieren. Wenn der Benutzer eingeloggt ist werden Nutzerinfos zurückgeschickt.
- POST /Users/auth -> {accessToken: string} -> {success: true, username: string, userId: int, email: string} || {success: false, error: string}

## Change Username:
- Endpunkt zum ändern des Benutzernamen.
- PUT /Users/change_Username -> {accessToken: string, newName: string} -> {success: true} || {success: false, error: string}

## Change Password:
- Endpunkt zum ändern des Passwords.
- PUT /Users/change_Password -> {accessToken: string, newPassword: string} -> {success: true} || {success: false, error: string}

## Delete Account:
- Endpunkt zum löschen eines Nutzeraccounts.
- DELETE /Users/delete_Account -> {accessToken: string} -> {success: true} || {success: false, error: string}

# API starten:
1. Repository klonen
2. .env hinzufügen und konfigurieren, siehe .env.example
3. Projekt in Shell öffnen und Docker starten
4. docker compose up
