# 📘 Diccionario de Datos – Cursos
## 📘 Diccionario de Datos – ESCUELA

---

**Tabla ESTUDIANTES**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK               | Referencia a            | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|-------------------------------------|-------------------------|------------------------------------|
| NumEstudiante    | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                                 | -                       | Identificador único del estudiante |
| Matricula        | VARCHAR      | 15     | ❌   | ❌   | ❌   | ✅     | Solo letras y números, longitud >= 3| -                       | Matrícula del estudiante           |
| Nombre           | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3      | -                       | Nombre(s) del estudiante           |
| ApellidoPaterno  | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3      | -                       | Apellido paterno                   |
| ApellidoMaterno  | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3      | -                       | Apellido materno                   |
| IdCiudad         | INT          | -      | ❌   | ✅   | ❌   | ❌     | > 0                                 | CIUDADES(IdCiudad)      | Ciudad de residencia del estudiante|



 **Tabla INSCRIPCION**

| Campo              | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK               | Referencia a            | Descripción                        |
|--------------------|--------------|--------|-----|-----|------|--------|-------------------------------------|-------------------------|------------------------------------|
| NumEstudiante      | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                                 | ESTUDIANTES(NumEstudiante)| Identificador del estudiante      |
| NumCurso           | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                                 | CURSO(NumCurso)         | Identificador del curso            |
| FechaInscripcion   | DATE         | -      | ❌   | ❌   | ❌   | ❌     | >= '2000-01-01' AND <= CURRENT_DATE | -                       | Fecha de inscripción al curso      |



 **Tabla CURSO**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK               | Referencia a            | Descripción                        |
|-----------------|--------------|--------|-----|-----|------|--------|-------------------------------------|-------------------------|------------------------------------|
| NumCurso        | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                                 | -                       | Identificador único del curso      |
| Codigo          | VARCHAR      | 50     | ❌   | ❌   | ❌   | ✅     | Solo letras y números, longitud >= 3| -                       | Código interno del curso           |
| Nombre          | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3      | -                       | Nombre del curso                   |

