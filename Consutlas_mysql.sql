/* Daremos un breve repaso de los concepts de MYSQL, esto para llegar dar una entrevista */


/* Clausuala WHERE MySQL: Consultas condicioonales en base de datos

/* Sintaxis default de las clausulas */

SELECT campo1, campo2
FROM tabla1, tabla2
[WHERE condicion1 [AND [OR]] condicion2 ]

/* Operadores condicionales de la cláusula WHERE MySQL
  '=' El operador es igual
  '!=' El operador es diferente
  '>' El operador es mayor que
  '<' El operador es menor
  '>=' el operador es mayor o igual
 */
 
 SELECT nombre, apellidos
 FROM empleados
 WHERE pais = 'México';
 
 /* En el ejemplo superior estamos seleccionado el nombre y apellidos de los empleados que sean de México. */
 
 SELECT nombre, apellidos
 FROM empleados
 WHERE edad = 40;
 
 # En el ejemplo superior estamos seleccionando el nombre y apellidos de los empleados que tenga 40 años
 
 SEELCT nombre, apellidos
 FROM empleados
 WHERE edad <= 40;
 
 SELECT nombre, apellidos
 FROM empleados
 WHERE edad >= 40;
 
 # Las 2 anteriores comsultas seleccionan a los empleados con menor e igual o mayor e igual a 40 años de edad
 
 /* Realizar varias condicionantes con OR y/o AND 
Hasta ahora os he puesto ejemplos básicos con una única condicion, os muestro varios ejemplos para realizar mas condiciones con
OR/AND */

SELECT nombre, apellidos
FROM empleados
WHERE edad <= 40 AND edad >= 50;

# En el ejemplo superior estamos seleccionando el nombre y apellidos de los empleados que tenga 40 años o menos y los qe tengan
# 50 o mas años

SELECT nombre, apellidos
FROM empleados
WHERE pais = 'Mexico' AND edad > 30;

# En el ejemplo superior esamos seleccionando el nombre y apellidos de los empleados que sean de México y que tengan mas de 30 años.

SELECT nombre, apellidos
FROM empleados
WHERE pais != 'Mexico' OR ead = 50;

SELECT nombre, apellidos
FROM empleados
WHERE pais != 'Mexico' OR edad > 30 AND antiguedad > 10;


/* MySQl ORDER BY
Ordenacion de consultas SELECT por columnas

Repaso a la clausula de MYSQL ORDER BY que tine 
*/

# La sintaxis oficial es la siguiente:

SELECT * FROM nombre_tabla
ORDER BY campo1, campo2;

# Ordenacion de una tabla por 2 campos

SELECT * FROM nombre_tabla
WHERE campo1 = condicionante
ORDER BY campo_ordenacion;

SELECT * FROM nombre_tabla
ORDER BY campo_ordenacion1 DESC, campo_ordenacion2 DESC;

# Ordenacion de una tabla por 2 campos. Con la cláusula DESC definimos la ordenacion del resultado de manera descendente.

SELECT * FROM nombre_tabla
WHERE campo = condicionante
ORDER BY campo_ordenacion1 DESC, campo_ordenacion2 DESC;

# Ordenacion de una tabla por 2 campos. Con la clausula DESC definimos la ordenacion del resultado de manera descendente 
# y ademas con WHERE realizamos la consulta condicional.

SELECT * FROM nombre_tabla
WHERE campo1 > condicionante
ORDER BY campo_ordenacion ASC;

# Ordenacion de una tabla por un campo con consulta condicional WHERE, ordenacuon de campos con ASC que ordena de manera ascendente

SELECT * FROM nombre_tabla
WHERE campo_ordenacion = condicionante AND campo_ordenacon2 > condicionante2
ORDER BY campo_ordenacion;

# Ordenacion de una tabla con 2 condicionantes WHERE y un campo de ordenacion


# Ejmplos practicos

SELECT * FROM empleados
ORDER BY edad, antiguedad;

# Consulta SELECT para extraer todos los empleados ordenados por edad y antiguedad

SELECT * FROM  empleados
WHERE sexo = 'mujer'
ORDER BY edad;

# Consulta SELECT para extraer todos los empleados cuyo sexo sea mujer, la ordenacion sera por edad

SELECT * FROM empleados
ORDER BY edad DESC, antiguedad DESC;

# Consulta SELECT para extraer todos los empleados y la ordenacion sera por el campo edad de manera descendente y el campo antiguedad de manera
# descendente.

SELECT * FROM empleados
WHERE sexo = 'hombre'
ORDER BY antiguedad DESC, edad DESC;

# Consulta SELECT para extraer todos los empleados y la ordenacion sera por el campo edad de manera descendente y el campo antiguedad
# de manera descendente

SELECT * FROM empleados
WHERE edad > 35
ORDER BY nombre ASC;

# Consulta de SELECT  de la tabla de empleados de edad mayor a 35 ordenados por el nombre ascendente

SELECT * FROM empleados
WHERE edad = 40 AND antguedad > 5
ORDER BY apellidos;

# Consulta SELECT para extraer todos los empleados cuya edad sea 40 años y antiguedad mayor de 5 años en la empresa
# odenacion por el campo apellidos.

/* MySQL LIKE Busqueda de patrones en tabla usando comodines

Seccion para repasar la clausula de MYSQL, su funcionalidad es la de realizar busquedas de patrones en las tablas mediante el uso de comodines.

Anterioremente vimos como realizar busquedas con WHERE, estas son exactas, ahora veremos como hacerlo con LIKE donde se buscara en las columnas con ciertos
caracteres o cadenas.

*/

# Sintaxis de MySQL

#Con comodin  %
SELECT * FROM nombre_tabla WHERE nombre_columna LIKE '%PATRON%';

#Con Comodin _
SELECT * FROM nombre_tabla WHERE nombre_columna LIKE '_%CARACTER_';

/* Breve explicacion
- En la primer sintaxis estamos realizando un SELECT con el comodin %, este tiene como finalidad ignorar todos los caracteres que esten antes y/o despues del patron
- En la segunda sintaxis estamos realizando un SELECT con el comodin '_', este tiene como finalidad ignorar un unico caracter por cada _ que este antes y/o despues del patron
*/

# Ejemplos

SELECT * FROM clientes WHERE nombre LIKE '%m%';

# En el codigo superior estamos buscando los clientes que cotnengan una 'm' en el nombre

SELECT * FROM clientes WHERE nombre LIKE 'M%';

# En el codigo superior estamos buscando los clientes cuyo nombe comienza con 'M'

SELECT * FROM clientes WHERE nombre LIKE '%a';

#  Estamos buscando los clientes cuyo nombre termina en 'a'.

SELECT * FROM clientes WHERE nombre LIKE '_a%';

# Estamos buscando los clientes cuyo nombre tiene como segundo caracter la 'a'

SELECT * FROM clientes WHERE nombre LIKE '_______';

# Buscamos los clientes cuyo nombre tiene 7 caracteres de longitud

SELECT * FROM clientes WHERE nombre LIKE '%a%' OR nombre LIKE '%r%';

Busca los clientes con nombre que tengan una 'a' o una 'r'


/* MYSQL COUNT() Obetener el número de resultados de una setencia SELECT 

MySQL COUNT() nos devuelve el numero de resultados de una sentencia SELECT

*/

# Sintaxis de MySQL COUNT()

SELECT COUNT(nombre_columnas) FROm nombre_tablas;

/* Tal y como vemos en el codigo, vemos dos valores a rellenar

- nombre_columna: aqui determinaos el nombre de la columna o columnas que queremos recuperar en la sentencia
- nombre_tablas Nombre de la tabla o tablas de donde queremos recuperar la informacion
*/

# Ejmeplos.

SELECT COUNT(*) FROM clientes;

# Obtenemos el numero TOTAL de registros que hay en la tabla 'clientes'

SELECT COUNT(*) FROM clientes WHERE antguedad > 5;

# Obtenermos el numero TOTAL de registros que hay en la tabla 'clientes' cuya antiguedad sea mayor a 5

SELECT sexo COUNT(*) FROM clientes WHERE antiguedad = 5 GROUP BY sexo;

# Obtenemos el numero de clientes que hay en la tabla 'clientes' con una antiguedad mayor a 5 y ademas los agrupamos por sexo
# de esta manera obtenemos el numero de clientes por sexo.

/* MySQL ORDER BY Ordenacion de consultas SELECT por columnas

Tiene como finalidad ordenar los resultados de las consultas por columnas en vez del campo indicie por defecto */

# Sintaxis dem MySQL ORDER BY

SELECT * FROM nombre_tabla;
ORDER BY campo1, campo2;

# Ordenacion de una tabla en 2 campos

SELECT * FROM nombre_tabla
WHERE campo1 = condicionante
ORDER BY campo_ordenacion;

# Ordenacion de una tabla con na condicion WHERE

SELECT * FROM nombre_tabla
ORDER BY campo_ordenacion1 DESC, campo_ordenacion2 DESC;

# Ordenacion de manera descendente

















 
