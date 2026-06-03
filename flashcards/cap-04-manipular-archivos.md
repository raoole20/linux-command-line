# Cap 4 — Manipular archivos y directorios (`cp`, `mv`, `mkdir`, `rm`, `ln`)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-06-03
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## ⭐ Punto clave de estudio — Comodines (Wildcards)

Los comodines se usan muchísimo con `cp`, `mv`, `rm`, etc. para seleccionar varios archivos a la vez (la shell los expande antes de ejecutar el comando).

**Tabla 4-1: Wildcards**

| Comodín | Significado |
|---------|-------------|
| `*` | Coincide con cualquier número de caracteres (incluso ninguno). |
| `?` | Coincide con **un** solo carácter cualquiera. |
| `[caracteres]` | Coincide con cualquier carácter que sea **miembro del conjunto** `caracteres`. |
| `[!caracteres]` | Coincide con cualquier carácter que **NO** sea miembro del conjunto `caracteres`. |
| `[[:clase:]]` | Coincide con cualquier carácter que sea miembro de la **clase** especificada (ej. `[:alpha:]`, `[:digit:]`, `[:upper:]`, `[:lower:]`). |

**Tabla 4-2: Clases de caracteres (character classes)**

| Clase | Significado |
|-------|-------------|
| `[:alnum:]` | Cualquier carácter **alfanumérico** (letras o dígitos). |
| `[:alpha:]` | Cualquier carácter **alfabético** (letra). |
| `[:digit:]` | Cualquier **numeral** (dígito). |
| `[:lower:]` | Cualquier letra **minúscula**. |
| `[:upper:]` | Cualquier letra **mayúscula**. |

**Tabla 4-3: Ejemplos de comodines (Wildcard Examples)**

| Patrón | Empareja |
|--------|----------|
| `*` | Todos los archivos. |
| `g*` | Cualquier archivo que **empiece con `g`**. |
| `b*.txt` | Cualquier archivo que empiece con `b`, seguido de cualquier cosa, y **termine en `.txt`**. |
| `Data???` | Cualquier archivo que empiece con `Data` seguido de **exactamente tres** caracteres. |
| `[abc]*` | Cualquier archivo que empiece con `a`, `b` **o** `c`. |
| `BACKUP.[0-9][0-9][0-9]` | Cualquier archivo que empiece con `BACKUP.` seguido de **exactamente tres dígitos**. |
| `[[:upper:]]*` | Cualquier archivo que empiece con una **letra mayúscula**. |
| `[![:digit:]]*` | Cualquier archivo que **NO** empiece con un dígito. |
| `*[[:lower:]123]` | Cualquier archivo que **termine** en una letra minúscula o en los numerales `1`, `2` o `3`. |

**Tabla 4-4: Opciones de `cp`**

| Opción | Significado |
|--------|-------------|
| `-a`, `--archive` | Copia archivos/directorios **con todos sus atributos** (permisos, propietario). Sin esta opción, la copia toma los atributos por defecto del usuario que copia. |
| `-i`, `--interactive` | Antes de **sobrescribir** un archivo existente, pide confirmación. Sin `-i`, `cp` sobrescribe en **silencio** sin avisar. ⚠️ |
| `-r`, `--recursive` | Copia directorios y su contenido de forma **recursiva**. **Obligatorio** al copiar directorios (o usar `-a`). |
| `-u`, `--update` | Solo copia archivos que **no existen** en el destino o que son **más nuevos** que los existentes. Útil para sincronizar grandes cantidades de archivos. |
| `-v`, `--verbose` | Muestra **mensajes informativos** mientras se realiza la copia. |

**Tabla 4-6: Opciones de `mv`**

| Opción | Significado |
|--------|-------------|
| `-i`, `--interactive` | Antes de **sobrescribir** un archivo existente, pide confirmación. Sin `-i`, `mv` sobrescribe en **silencio**. ⚠️ |
| `-u`, `--update` | Solo mueve archivos que **no existen** en el destino o que son **más nuevos** que los existentes. |
| `-v`, `--verbose` | Muestra **mensajes informativos** mientras se realiza el movimiento. |

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 4.1 | ¿Qué empareja `*` vs `?` en comodines? | `*` = cualquier número de caracteres (incluso cero); `?` = exactamente **un** carácter cualquiera. | 🆕 |
| 4.2 | ¿Diferencia entre `[abc]` y `[!abc]`? | `[abc]` empareja un carácter que **esté** en el conjunto; `[!abc]` empareja uno que **NO** esté en el conjunto. | 🆕 |
| 4.3 | ¿Para qué sirve `[[:clase:]]` y un ejemplo? | Empareja un carácter de una **clase** predefinida, p. ej. `[[:digit:]]` (dígitos), `[[:upper:]]` (mayúsculas), `[[:alpha:]]` (letras). | 🆕 |
| 4.4 | ¿Qué empareja el patrón `Data???`? | Archivos que empiezan con `Data` seguido de **exactamente tres** caracteres cualesquiera (ni más ni menos). | 🆕 |
| 4.5 | ¿Qué empareja `[![:digit:]]*`? | Cualquier archivo cuyo **primer carácter NO sea un dígito**. | 🆕 |
| 4.6 | ¿Diferencia entre `[:alnum:]` y `[:alpha:]`? | `[:alpha:]` = solo letras; `[:alnum:]` = letras **o** dígitos (alfanumérico). | 🆕 |
| 4.7 | ¿Qué pasa si copias un archivo a un destino que ya existe, sin ninguna opción? | `cp` lo **sobrescribe en silencio**, sin ningún aviso. Para que pregunte antes, usa `-i`. | 🆕 |
| 4.8 | ¿Qué opción de `cp` es **obligatoria** para copiar un directorio entero? | `-r` (`--recursive`) o `-a` (`--archive`). Sin ella, `cp` falla al intentar copiar un directorio. | 🆕 |
| 4.9 | ¿Qué diferencia hay entre `cp -r` y `cp -a` al copiar un directorio? | `-r` copia el contenido recursivamente pero los archivos toman los **atributos del usuario** que copia; `-a` además preserva **permisos y propietario** originales. | 🆕 |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- La **shell** expande los comodines *antes* de pasar los argumentos al comando — el comando nunca "ve" el `*`, ve la lista ya expandida.
- (Pendiente al volver) `cp`/`mv` sobrescriben sin avisar por defecto → opción `-i`; peligro de `rm -rf` + comodines; doble función de `mv` (mover y renombrar); `mkdir -p`; hard link vs symbolic link.

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- Recuerdo activo + práctica en terminal de todo el capítulo (aún sin verificar; el alumno lo está leyendo).
