
## 📘 Diccionario de Datos – CLÍNICA



 **Tabla DOCTORES**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a       | Descripción                      |
|-------------------|--------------|--------|-----|-----|------|--------|---------------------------------|--------------------|----------------------------------|
| `NumDoctor `        | INT          | -      | ✅   | ❌   | ❌   | ✅     | -  | -                  | Identificador único del doctor   |
|` Nombre `           | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | -| -                  | Nombre del doctor                |
|` ApellidoPaterno`   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | -| -                  | Apellido paterno del doctor      |
| `ApellidoMaterno`   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | -| -                  | Apellido materno del doctor      |


 **Tabla PACIENTES**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a       | Descripción                      |
|-------------------|--------------|--------|-----|-----|------|--------|---------------------------------|--------------------|----------------------------------|
| `NumPaciente`       | INT          | -      | ✅   | ❌   | ❌   | ✅     | -    | -                  | Identificador único del paciente |
|` Nombre  `          | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -  | -                  | Nombre del paciente              |
| `ApellidoPaterno`   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | - | -                  | Apellido paterno del paciente    |
| `ApellidoMaterno`   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | -  | -                  | Apellido materno del paciente    |



 **Tabla ATENCION**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a            | Descripción                      |
|-----------------|--------------|--------|-----|-----|------|--------|---------------------------------|-------------------------|----------------------------------|
| `NumDoctor`       | INT          | -      | ✅   | ✅   | ❌   | ❌     | -     | DOCTORES(NumDoctor)     | ID del doctor que atiende        |
| `NumPaciente `    | INT          | -      | ✅   | ✅   | ❌   | ❌     |- |     PACIENTES(NumPaciente)  | ID del paciente atendido         |
| `Fecha`           | DATE         | -      | ❌   | ❌   | ❌   | ❌     | - | -                   | Fecha de la atención médica      |

