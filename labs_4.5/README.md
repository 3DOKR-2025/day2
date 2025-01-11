# Explication réseau : Conteneurs et communication

Ce readme décrit la communication entre les conteneurs **Spring Boot**, **Express.js**, **Flask**, **Redis**, et **PostgreSQL**, avec leurs ports et URL associés.

## Détails des conteneurs

### 1. **Spring Boot**
- **URL interne** :
- Communication avec Express : `http://express:3000`
- Communication avec Redis : `http://redis:6379`
- **Port exposé** :
- `http://localhost:8080` (hôte local).

### 2. **Express.js**
- **URL interne** :
- Communication avec Redis : `http://redis:6379`
- **Port exposé** :
- `http://localhost:3000` (hôte local).

### 3. **Flask**
- **URL interne** :
- Communication avec Redis : `http://redis:6379`
- Communication avec PostgreSQL : `http://postgres:5432`
- **Port exposé** :
- `http://localhost:5000` (hôte local).

### 4. **Redis**
- **URL interne** :
- Accessible via : `http://redis:6379`
- **Port exposé** :
- Pas de port exposé en externe.

### 5. **PostgreSQL**
- **URL interne** :
- Accessible via : `http://postgres:5432`
- **Port exposé** :
- Pas de port HTTP, accessible uniquement en interne via PostgreSQL client.

---

### Description de la communication

1. **Spring Boot** :
- Expose son API sur le port `8080`.
- Communique avec :
- `express:3000` pour récupérer des données HTTP.
- `redis:6379` pour interagir avec Redis.

2. **Express.js** :
- Expose son API sur le port `3000`.
- Utilise `redis:6379` pour stocker ou récupérer des données.

3. **Flask** :
- Expose son API sur le port `5000`.
- Communique avec :
- `redis:6379` pour le cache.
- `postgres:5432` pour des interactions avec la base de données.

4. **Redis** :
- Accessible via `redis:6379` pour :
- Spring Boot
- Express
- Flask

5. **PostgreSQL** :
- Accessible via `postgres:5432` uniquement pour Flask.

---

## Utilisation des ports

| Service           | Port Interne | Port Externe | URL d'accès (externe)  |
|----------------|--------------|--------------|------------------------|
| Spring Boot   | 8080         | 8080         | http://localhost:8080  |
| Express.js        | 3000         | 3000         | http://localhost:3000  |
| Flask               | 5000         | 5000         | http://localhost:5000  |
| Redis              | 6379         | -            | http://redis:6379 (interne uniquement) |
| PostgreSQL    | 5432         | -            | http://postgres:5432 (interne uniquement) |
