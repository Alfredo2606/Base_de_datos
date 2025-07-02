# 📘 Diccionario de Datos – COMPANY

## 📘 Diccionario de Datos – EMPRESA


 **Tabla EMPLOYEE**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                   | Referencia a               | Descripción                           |
|---------------|--------------|--------|-----|-----|------|--------|-----------------------------------------|----------------------------|---------------------------------------|
| EmployeeId    | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                                     | -                          | Identificador único del empleado      |
| SSN           | VARCHAR      | 15     | ❌   | ❌   | ❌   | ✅     | Solo dígitos, longitud = 9              | -                          | Número de seguro social               |
| Name          | VARCHAR      | 40     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3          | -                          | Segundo nombre del empleado           |
| Firstname     | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3          | -                          | Primer nombre del empleado            |
| Lastname      | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3          | -                          | Apellido del empleado                 |
| Salary        | DECIMAL      | 10,2   | ❌   | ❌   | ❌   | ❌     | >= 0                                    | -                          | Sueldo mensual del empleado           |
| Birthday      | DATE         | -      | ❌   | ❌   | ❌   | ❌     | Fecha entre 1900 y actual               | -                          | Fecha de nacimiento del empleado      |
| Address       | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     |                                         | -                          | Dirección de residencia del empleado  |
| Sex           | CHAR         | 1      | ❌   | ❌   | ❌   | ❌     | Valores permitidos: 'M', 'F'            | -                          | Sexo del empleado                     |
| DepartmentId  | INT          | -      | ❌   | ✅   | ❌   | ❌     | > 0                                     | DEPARTMENT(IdDepartment)   | Departamento al que pertenece         |
| ManagerId     | INT          | -      | ❌   | ✅   | ✅   | ❌     | > 0                                     | EMPLOYEE(EmployeeId)       | ID del jefe directo (si aplica)       |


 **Tabla DEPARTMENT**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK              | Referencia a               | Descripción                          |
|-----------------|--------------|--------|-----|-----|------|--------|------------------------------------|----------------------------|--------------------------------------|
| IdDepartment    | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                                | -                          | Identificador único del departamento |
| NumDepartment   | VARCHAR      | 50     | ❌   | ❌   | ❌   | ✅     | Solo letras A-Z, longitud >= 3     | -                          | Código interno del departamento      |
| NameDepartment  | VARCHAR      | 40     | ❌   | ❌   | ❌   | ✅     | Solo letras A-Z, longitud >= 3     | -                          | Nombre del departamento              |
| ManagerId       | INT          | -      | ❌   | ✅   | ✅   | ❌     | > 0                                | EMPLOYEE(EmployeeId)       | ID del jefe del departamento         |
| StartDate       | DATE         | -      | ❌   | ❌   | ✅   | ❌     | >= '1900-01-01' y <= fecha actual | -                          | Fecha de inicio del departamento     |



**Tabla DEPENDENT**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK            | Referencia a               | Descripción                          |
|---------------|--------------|--------|-----|-----|------|--------|----------------------------------|----------------------------|--------------------------------------|
| EmployeeId    | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                              | EMPLOYEE(EmployeeId)       | ID del empleado asociado             |
| Name          | VARCHAR      | 50     | ✅   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3   | -                          | Nombre del dependiente               |
| Sex           | CHAR         | 1      | ❌   | ❌   | ❌   | ❌     | Valores permitidos: 'M', 'F'     | -                          | Sexo del dependiente                 |
| Birthday      | DATE         | -      | ❌   | ❌   | ❌   | ❌     | Fecha entre 1900 y actual        | -                          | Fecha de nacimiento del dependiente  |
| Relationship  | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3   | -                          | Parentesco con el empleado           |



**Tabla WORKS_ON**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                          |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|--------------------------------------|
| EmployeeId   | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                           | EMPLOYEE(EmployeeId)       | ID del empleado                      |
| ProjectId    | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                           | PROJECT(ProjectId)         | ID del proyecto                      |
| Hours        | DECIMAL      | 5,2    | ❌   | ❌   | ❌   | ❌     | >= 0                          | -                          | Horas trabajadas en el proyecto      |



 **Tabla LOCATIONS**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                           |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|---------------------------------------|
| Location      | VARCHAR      | 100    | ✅   | ❌   | ❌   | ✅     | Solo letras A-Z, longitud >= 3 | -                         | Nombre de la ubicación                |
| IdDepartment  | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                           | DEPARTMENT(IdDepartment)   | ID del departamento                   |
| EmployeeId    | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                           | EMPLOYEE(EmployeeId)       | ID del empleado                       |



 **Tabla PROJECT**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                          |
|-----------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|--------------------------------------|
| ProjectId       | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                           | -                          | ID único del proyecto                |
| NombreProject   | VARCHAR      | 30     | ❌   | ❌   | ❌   | ✅     | Solo letras A-Z, longitud >= 3| -                          | Nombre del proyecto                  |
| NumProject      | INT          | -      | ❌   | ❌   | ❌   | ❌     | >= 0                          | -                          | Código interno del proyecto          |
| Location        | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -                          | Ubicación principal del proyecto     |
| DepartmentId    | INT          | -      | ❌   | ✅   | ❌   | ❌     | > 0                           | DEPARTMENT(IdDepartment)   | Departamento responsable del proyecto|


