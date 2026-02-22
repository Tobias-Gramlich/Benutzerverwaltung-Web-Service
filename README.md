# Benutzerverwaltung-Web-Service
Ein Web Service zum verwalten von Benutzern

# Aufbau
Benutzerverwaltung-Web-Service
├── .dockerignore
├── .env
├── .env.example
├── .gitignore
├── docker-compose.yml
├── Dockerfile
├── README.md
├── src
│   ├── config
│   │   └── config.js
│   ├── index.js
│   ├── models
│   │   ├── index.js
│   │   └── Users.js
│   ├── package-lock.json
│   ├── package.json
│   ├── routes
│   │   └── Users.js
│   ├── utils
│   │   ├── Inputvalidation
│   │   │   ├── validateEmail.js
│   │   │   ├── validatePassword.js
│   │   │   └── validateUsername.js
│   │   ├── mailer.js
│   │   └── validateToken.js

# Endpunkte
POST /register -> {username: string, password: string, email: string} -> {success: boolean} || {error: string}

POST /activate -> {username: string, activationcode: int} -> {success: boolean} || {error: string}

POST /login -> {username: string, password: string} -> {success: boolean, accessToken: string} || {error: string}

POST /auth -> {accessToken: string} -> {success: boolean, username: string, userId: int, email: string} || {error: string}

PUT /change_Username -> {accessToken: string, newName: string} -> {success: boolean} || {error: string}

PUT /change_Password -> {accessToken: string, newPassword: string} -> {success: boolean} || {error: string}

DELETE /delete_Account -> {accessToken: string} -> {success: boolean} || {error: string}