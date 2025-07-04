## 📘 Diccionario de Datos – Biblioteca

 Tabla: Lectores

| Campo              | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                           | Referencia a                    | Descripción                          |
|--------------------|--------------|--------|-----|-----|------|--------|-------------------------------------------------|---------------------------------|--------------------------------------|
| `Num_Lector`        | INT          | -      | ✅   | ❌   | ❌   | ✅     |  -                                           | -                               | Identificador del lector             |
| ` Nombre `            | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     |  - | -                               | Nombre del lector                    |
| ` ApellidoPaterno`      | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -   | -     | Apellido paterno del lector          |
| `ApellidoMaterno`      | VARCHAR      | 50     | ❌   | ❌   | ✅   | ❌     | -     | -     | Apellido materno del lector (opcional)|
| `Edad`                | INT          | -      | ❌   | ❌   | ❌   | ❌     |CHECK (Edad >= 18 AND Edad <= 120)  | - | Edad del lector                      |
| `Correo`               | VARCHAR      | 150    | ❌   | ❌   | ❌   | ✅     | - | -| Correo electrónico del lector        |
| `Num_Membresia`        | INT          | -      | ❌   | ✅   | ❌   | ❌     | -  |-       | Número de membresía del lector       |


Tabla: Libros

| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                          | Referencia a        | Descripción                          |
|----------------|--------------|--------|-----|-----|------|--------|-----------------------------------------------|---------------------|--------------------------------------|
| `Num_Libro`        | INT          | -      | ✅   | ❌   | ❌   | ✅     | - | - | Identificador del libro              |
| `NumISBN`        | NVARCHAR     | 100    | ❌   | ❌   | ❌   | ✅     | -| - | Código ISBN del libro                |
| `Titulo`         | VARCHAR      | 150    | ❌   | ❌   | ❌   | ✅     | -  | -| Título del libro                     |
| `Autor`          | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z -| - |Nombre del autor del libro     
| `Cantidad`       | INT          | -      | ❌   | ❌   | ❌   | ❌     | CHECK (Cantidad >= 1 AND Cantidad <= 20)   | - | Existencia disponible de ese libro |



 Tabla: Presta

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                | Referencia a          | Descripción                          |
|------------------|--------------|--------|-----|-----|------|--------|--------------------------------------|-----------------------|--------------------------------------|
| `Num_Lector`       | INT          | -      | ❌   | ✅   | ❌   | ❌     |  - | Lectores(Num_Lector)  | Identificador del lector             |
| `Num_Libro`        | INT          | -      |❌   | ✅   | ❌   | ❌     |  - | Libros(Num_Libro)     | Identificador del libro              |
| `Fecha_Prestamo`   | DATE         | -      | ❌   | ❌   | ❌   | ❌     |-| -| Fecha en que se presta el libro      |
| `Fecha_Devolucion` | DATE         | -      | ❌   | ❌   | ✅   | ❌     | -  | - | Fecha en que se devuelve el libro    |

