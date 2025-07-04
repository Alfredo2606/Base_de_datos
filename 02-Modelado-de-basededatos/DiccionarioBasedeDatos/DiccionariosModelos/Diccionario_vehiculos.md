# 📘 Diccionario de Datos – vehiculos



 **Tabla CLIENTES**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
|  `NumCliente`    | INT      | -      | ✅   | ❌   | ❌   | ✅     |   - | -                   | Identificador único del cliente    |
| `Nombre `           | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | -  | -                   | Nombre del cliente                 |
| `ApellidoPaterno`  | NVARCHAR     | 20     | ❌   | ❌   | ❌   | ❌     | -  | -                   | Apellido paterno del cliente       |
|` ApellidoMaterno`  | VARCHAR      | 150    | ❌   | ❌   | ❌   | ❌     | - | -                   | Apellido materno del cliente       |
| `CURP `            | VARCHAR      | 18     | ❌   | ❌   | ❌   | ✅     | -          | -                   | CURP del cliente                   |
| `Telefono `        | VARCHAR      | 15     | ❌   | ❌   | ❌   | ❌     | -   | -                   | Teléfono del cliente               |
|` Calle `           | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -                               | -                   | Calle de domicilio del cliente     |
| `Num  `            | VARCHAR      | 10     | ❌   | ❌   | ❌   | ❌     | -  | -                   | Número exterior/interior domicilio |
|` Ciudad`           | VARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -  | -                   | Ciudad de residencia               |



 **Tabla VEHICULO**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
|` NumVehiculo `     | INT          | -      | ✅   | ❌   | ❌   | ✅     | -                             | -                   | Identificador único del vehículo  |
| `Marca`            | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Marca del vehículo                |
| `Año `             | INT          | -      | ❌   | ❌   | ❌   | ❌     |-| - | Año de fabricación del vehículo   |
| `Modelo `          | VARCHAR      | 150    | ❌   | ❌   | ❌   | ❌     | - | -   | Modelo del vehículo               |
| `Placa `           | VARCHAR      | 10     | ❌   | ❌   | ❌   | ✅     | -      | -  | Placas del vehículo               |
|` NumSucursal`      | INT          | -      | ❌   | ✅   | ❌   | ❌     | - | SUCURSAL(NumSucursal)| Sucursal a la que pertenece       |



 **Tabla SUCURSAL**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
| `NumSucursal `     | INT          | -      | ✅   | ❌   | ❌   | ✅     | -                            | -                   | Identificador único de la sucursal |
| `Nombre`           | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | - | - | Nombre de la sucursal             |
| `Ubicacion `       | VARCHAR      | 100    | ❌   | ❌   | ❌   | ❌     | - | -   | Ubicación de la sucursal          |



 **Tabla RENTA**

| Campo              | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK               | Referencia a        | Descripción                        |
|--------------------|--------------|--------|-----|-----|------|--------|-------------------------------------|---------------------|------------------------------------|
| `NumCliente`         | INT          | -      | ✅   | ✅   | ❌   | ❌     | -   | CLIENTES(NumCliente) | Cliente que realiza la renta       |
| `NumVehiculo`        | INT          | -      | ✅   | ✅   | ❌   | ❌     | -                             | VEHICULO(NumVehiculo)| Vehículo rentado                   |
| `NumDiasPrestados`   | INT          | -      | ❌   | ❌   | ❌   | ❌     | - | -                   | Número de días de la renta         |
| `FechaInicio`        | DATE         | -      | ❌   | ❌   | ❌   | ❌     | - | -                   | Fecha de inicio de la renta        |
| `FechaTermino `      | DATE         | -      | ❌   | ❌   | ❌   | ❌     | -| -   | Fecha de término de la renta       |

