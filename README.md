# JavaCourseProjectIBM
Java EE Servlet App

PARA CREAR LA BASE DE DATOS EN MYSQL, AQUÍ ESTÁ EL SCRIPT: 
CREATE DATABASE cursos;
=====================================================================
USE cursos;

CREATE TABLE Usuario (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20),
    password_ VARCHAR(50),
    photoPath VARCHAR(255)
);

CREATE TABLE Curso (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    creditos INT
);

INSERT INTO Curso (nombre, creditos) VALUES
('Calculo diferencial', 10),
('Fundamentos de programacion', 8),
('Diseño de software', 8);

CREATE TABLE UsuarioCurso (
	usuarioId INT NOT NULL,
    cursoId INT NOT NULL,
    primary key(usuarioId, cursoId)
);
