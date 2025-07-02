# 📘 Diccionario de Datos – Doctores
## 📘 Diccionario de Datos – CLÍNICA



 **Tabla DOCTORES**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a       | Descripción                      |
|-------------------|--------------|--------|-----|-----|------|--------|---------------------------------|--------------------|----------------------------------|
| NumDoctor         | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                             | -                  | Identificador único del doctor   |
| Nombre            | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Nombre del doctor                |
| ApellidoPaterno   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Apellido paterno del doctor      |
| ApellidoMaterno   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Apellido materno del doctor      |


 **Tabla PACIENTES**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a       | Descripción                      |
|-------------------|--------------|--------|-----|-----|------|--------|---------------------------------|--------------------|----------------------------------|
| NumPaciente       | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                             | -                  | Identificador único del paciente |
| Nombre            | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Nombre del paciente              |
| ApellidoPaterno   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Apellido paterno del paciente    |
| ApellidoMaterno   | VARCHAR      | 60     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                  | Apellido materno del paciente    |



 **Tabla ATENCION**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a            | Descripción                      |
|-----------------|--------------|--------|-----|-----|------|--------|---------------------------------|-------------------------|----------------------------------|
| NumDoctor       | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                             | DOCTORES(NumDoctor)     | ID del doctor que atiende        |
| NumPaciente     | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                             | PACIENTES(NumPaciente)  | ID del paciente atendido         |
| Fecha           | DATE         | -      | ❌   | ❌   | ❌   | ❌     | >= '2000-01-01' AND <= CURRENT_DATE | -                   | Fecha de la atención médica      |

