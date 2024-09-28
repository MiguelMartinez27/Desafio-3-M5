-- 1. Crear una base de datos llamada películas.
CREATE DATABASE peliculas;

-- 2. Cargar ambos archivos a su tabla correspondiente.
--crear tablas
CREATE TABLE peliculas (id INTEGER, pelicula VARCHAR, ano_estreno INTEGER, director VARCHAR);
CREATE TABLE reparto (id_pelicula INTEGER, actor VARCHAR);
--importar datos
\COPY peliculas FROM 'ruta/al/archivo.csv' csv header;
-- mi caso \COPY peliculas FROM 'C:/Users/JESHU/Documents/documentostd/M5/desafio 3/Top 100/peliculas.csv' CSV HEADER;
\COPY reparto FROM 'ruta/al/archivo.csv' csv header;
--mi caso \COPY reparto FROM 'C:/Users/JESHU/Documents/documentostd/M5/desafio 3/Top 100/reparto.csv' CSV HEADER;

--3. Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic'
-- id
------
--  2
--(1 fila)

--4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT reparto.actor FROM reparto JOIN peliculas ON peliculas.id = reparto.id_pelicula WHERE peliculas.pelicula = 'Titanic';
--       actor
-------------------
-- Leonardo DiCaprio
-- Kate Winslet
-- Billy Zane
-- Kathy Bates
-- Frances Fisher
-- Bernard Hill
-- Jonathan Hyde
-- Danny Nucci
-- David Warner
-- Bill Paxton
-- Gloria Stuart
-- Victor Garber
-- Suzy Amis
--(13 filas)

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT reparto.actor, COUNT(*) FROM peliculas JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE reparto.actor = 'Harrison Ford' GROUP BY reparto.actor;
--     actor     | count
-----------------+-------
-- Harrison Ford |     8
--(1 fila)

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE ano_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;
-- id |                  Pelicula                  | Año estreno |       Director        
------+--------------------------------------------+-------------+-----------------------
-- 76 | American Beauty                            |        1999 | Sam Mendes
-- 20 | American History X                         |        1998 | Tony Kaye
--  9 | Braveheart                                 |        1995 | Mel Gibson
--  7 | Cadena perpetua                            |        1994 | Frank Darabont
-- 12 | Eduardo Manostijeras                       |        1990 | Tim Burton
-- 68 | El Padrino. Parte III                      |        1990 | Francis Ford Coppola
-- 27 | El club de la pelea                        |        1999 | David Fincher
-- 75 | El profesional                             |        1994 | Luc Besson
-- 22 | El sexto sentido                           |        1999 | M. Night Shyamalan
-- 45 | El show de Truman                          |        1998 | Peter Weir
-- 25 | El silencio de los corderos                |        1991 | Jonathan Demme
-- 61 | Entrevista con el vampiro                  |        1994 | Neil Jordan
--  1 | Forest Gump                                |        1994 | Robert Zemeckis
-- 42 | Hombres de negro                           |        1997 | Barry Sonnenfeld
-- 10 | La lista de Schindler                      |        1993 | Steven Spielberg
-- 31 | La milla verde                             |        1999 | Frank Darabont
-- 30 | Matrix                                     |        1999 | Andy y Lana Wachowski
-- 89 | Mejor... imposible                         |        1997 | James L. Brooks
-- 29 | Parque Jurásico                            |        1993 | Steven Spielberg
-- 47 | Pesadilla antes de navidad                 |        1993 | Henry Selick
-- 23 | Pulp Fiction                               |        1994 | Quentin Tarantino
-- 14 | Salvar al soldado Ryan                     |        1998 | Steven Spielberg
-- 39 | Seven                                      |        1995 | David Fincher
-- 86 | Star Wars. Episodio I: La amenaza fantasma |        1999 | George Lucas
-- 40 | Terminator 2: el juicio final              |        1991 | James Cameron
--  2 | Titanic                                    |        1997 | James Cameron
-- 11 | Toy Story                                  |        1995 | John Lasseter
-- 46 | Toy Story 2                                |        1999 | John Lasseter
-- 79 | Trainspotting                              |        1996 | Danny Boyle
-- 98 | Uno de los nuestros                        |        1990 | Martin Scorsese
--(30 rows)

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas LIMIT 30;
--                      Pelicula                      | longitud_titulo 
----------------------------------------------------+-----------------
-- Forest Gump                                        |              11
-- Titanic                                            |               7
-- El Padrino                                         |              10
-- Gladiator                                          |               9
-- El Señor de los anillos: El retorno del rey        |              43
-- El caballero oscuro                                |              19
-- Cadena perpetua                                    |              15
-- Piratas del Caribe: La maldición de la Perla Negra |              50
-- Braveheart                                         |              10
-- La lista de Schindler                              |              21
-- Toy Story                                          |               9
-- Eduardo Manostijeras                               |              20
-- El Señor de los anillos: La comunidad del anillo   |              48
-- Salvar al soldado Ryan                             |              22
-- Regreso al futuro                                  |              17
-- Monstruos S.A.                                     |              14
-- Buscando a Nemo                                    |              15
-- El Señor de los anillos: Las dos torres            |              39
-- Harry Potter y el Prisionero de Azkaban            |              39
-- American History X                                 |              18
--(20 rows)

8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT pelicula, LENGTH(pelicula) FROM peliculas ORDER BY LENGTH(pelicula) DESC LIMIT 1;
--                       Pelicula                       | longitud_titulo
--------------------------------------------------------+-----------------
-- Sweeney Todd: El barbero diabólico de la calle Fleet |              52