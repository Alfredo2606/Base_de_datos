# 📘 Diccionario de Datos – Veihculos

**Tabla cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > -                                      | -                                | Identificador del cliente               |
| `Nombre`        | nVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -            | -                                | Nombre completo del cliente             |
| `apellido1`          | nVarchar      | 20      | ❌  | ❌  | ❌   | ❌     |-   | -                                | Apellido del cliente                        |
| `apellido2`        | nVARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | -               | -                                | Apellido 2 del cliente                 |
| `curp`        | nVARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | -               | -                                | Apellido 2 del cliente                 |
