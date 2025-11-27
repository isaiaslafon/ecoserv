-- Crear usuario y base para Wiki.js
CREATE USER wikijs WITH PASSWORD 'wikijs';
CREATE DATABASE wikijs OWNER wikijs;


-- Crear usuario y base para Forgejo
CREATE USER forgejo WITH PASSWORD 'forgejo';
CREATE DATABASE forgejo OWNER forgejo;

-- Grant básicos
GRANT ALL PRIVILEGES ON DATABASE wikijs TO wikijs;
GRANT ALL PRIVILEGES ON DATABASE forgejo TO forgejo;

