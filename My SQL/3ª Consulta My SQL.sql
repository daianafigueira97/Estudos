-- Criando Bancos de dados  e tabelas
CREATE DATABASE IF NOT EXISTS db_exemplo;
USE db_exemplo;

CREATE TABLE dAlunos(
			Id_Aluno INT,
            Nome_Aluno VARCHAR(100),
            Email VARCHAR(100)
					);
                    
CREATE TABLE IF NOT EXISTS dCursos(
						   Id_Curso INT,
                           Nome_Curso VARCHAR(100),
                           Preco_curso DECIMAL(6,2)
									);
							
CREATE TABLE IF NOT EXISTS fMatriculas(
						   Id_Matricula INT,
						   Id_Aluno INT,
                           Id_Curso INT,
                           Data_Cadastro DATE
									);
  SHOW TABLES; -- Serve para verificar todas as tabelas daquele bando de dados
  
  DROP TABLE dCursos;