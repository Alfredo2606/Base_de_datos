# 📘 Diccionario de Datos – COMPANY

## 📘 Diccionario de Datos – EMPRESA


 **Tabla EMPLOYEE**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                   | Referencia a               | Descripción                           |
|---------------|--------------|--------|-----|-----|------|--------|-----------------------------------------|----------------------------|---------------------------------------|
| `EmployeeId `   | INT          | -      | ✅   | ❌   | ❌   | ✅     | -                                    | -                          | Identificador único del empleado      |
| `SSN `          | VARCHAR      | 15     | ❌   | ❌   | ❌   | ✅     | Solo dígitos, longitud = 9              | -                          | Número de seguro social               |
|` Name`          | VARCHAR      | 40     | ❌   | ❌   | ❌   | ❌     | -        | -                          | Segundo nombre del empleado           |
| `Firstname `    | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -        | -                          | Primer nombre del empleado            |
| `Lastname`      | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     |  -       | -                          | Apellido del empleado                 |
| `Salary `       | DECIMAL      | 10,2   | ❌   | ❌   | ❌   | ❌     | salario >= 0  | - | Sueldo mensual del empleado           |
| `Birthday `    | DATE         | -      | ❌   | ❌   | ❌   | ❌     |  - | -| Fecha de nacimiento del empleado      |
| `Address`       | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     |                                         | -                          | Dirección de residencia del empleado  |
| `Sex  `         | CHAR         | 1      | ❌   | ❌   | ❌   | ❌     | - | Valores permitidos: 'M', 'F'  | Sexo del empleado                     |
| `DepartmentId`  | INT          | -      | ❌   | ✅   | ❌   | ❌     | -| DEPARTMENT(IdDepartment)   | Departamento al que pertenece         |
| `ManagerId `    | INT          | -      | ❌   | ✅   | ❌   | ❌     | -  | EMPLOYEE(EmployeeId)       | ID del jefe directo (si se aplica)     |


 **Tabla DEPARTMENT**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK              | Referencia a               | Descripción                          |
|-----------------|--------------|--------|-----|-----|------|--------|------------------------------------|----------------------------|--------------------------------------|
|`  IdDepartment`     | INT          | -      | ✅   | ❌   | ❌   | ✅     | -   | -                          | Identificador único del departamento |
| ` NumDepartment`    | VARCHAR      | 50     | ❌   | ❌   | ❌   | ✅     |  -   | -                          | Código interno del departamento      |
| ` NameDepartment`   | VARCHAR      | 40     | ❌   | ❌   | ❌   | ❌     | -    | -                          | Nombre del departamento              |
| ` ManagerId `       | INT          | -      | ❌   | ✅   | ❌   | ❌     |   - | EMPLOYEE(EmployeeId)       | ID del jefe del departamento         |
| ` StartDate`        | DATE         | -      | ❌   | ❌   | ✅   | ❌     | - | -                          | Fecha de inicio del departamento     |



**Tabla DEPENDENT**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK            | Referencia a               | Descripción                          |
|---------------|--------------|--------|-----|-----|------|--------|----------------------------------|----------------------------|--------------------------------------|
| ` EmployeeId`     | INT          | -      | ✅   | ✅   | ❌   | ❌     |-                           | EMPLOYEE(EmployeeId)       | ID del empleado asociado             |
| ` Name `          | VARCHAR      | 50     | ✅   | ❌   | ❌   | ❌     |-  | -                          | Nombre del dependiente               |
| ` Sex  `          | CHAR         | 1      | ❌   | ❌   | ❌   | ❌     | Valores permitidos: 'M', 'F'     | -                          | Sexo del dependiente                 |
| ` Birthday `      | DATE         | -      | ❌   | ❌   | ❌   | ❌     | -       | -                          | Fecha de nacimiento del dependiente  |
| ` Relationship`   | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -   | -                          | Parentesco con el empleado           |



**Tabla WORKS_ON**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                          |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|--------------------------------------|
| ` EmployeeId`    | INT          | -      | ✅   | ✅   | ❌   | ❌     | -                         | EMPLOYEE(EmployeeId)       | ID del empleado                      |
|`  ProjectId`     | INT          | -      | ✅   | ✅   | ❌   | ❌     |-                        | PROJECT(ProjectId)         | ID del proyecto                      |
| ` Hours`         | DECIMAL      | 5,2    | ❌   | ❌   | ❌   | ❌     | -                          | -                          | Horas trabajadas en el proyecto      |



 **Tabla LOCATIONS**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                           |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|---------------------------------------|
| ` Location  `    | VARCHAR      | 100    | ✅   | ❌   | ❌   | ✅     |-  | Nombre de la ubicación                |
| ` IdDepartment`   | INT          | -      | -   | ✅   | ❌   | ❌     | -     | DEPARTMENT(IdDepartment)   | ID del departamento                   |
|`  EmployeeId `    | INT          | -      | -   | ✅   | ❌   | ❌     | -     | EMPLOYEE(EmployeeId)       | ID del empleado                       |



 **Tabla PROJECT**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a               | Descripción                          |
|-----------------|--------------|--------|-----|-----|------|--------|-------------------------------|----------------------------|--------------------------------------|
|`  ProjectId `       | INT          | -      | ✅   | ❌   | ❌   | ✅     |-                      | -                          | ID único del proyecto                |
| ` NombreProject`    | VARCHAR      | 30     | ❌   | ❌   | ❌   | ✅     | -| -                          | Nombre del proyecto                  |
| ` NumProject  `     | INT          | -      | ❌   | ❌   | ❌   | ❌     |-                        | -                          | Código interno del proyecto          |
|`  Location `        | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | -| -                          | Ubicación principal del proyecto     |
| ` DepartmentId`     | INT          | -      | ❌   | ✅   | ❌   | ❌     | -                          | DEPARTMENT(IdDepartment)   | Departamento responsable del proyecto|


