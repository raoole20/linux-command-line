# Cap 4 — Manipular archivos y directorios (`cp`, `mv`, `mkdir`, `rm`, `ln`)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-07-09
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
| 4.1 | ¿Qué empareja `*` vs `?` en comodines? | `*` = cualquier número de caracteres (incluso cero); `?` = exactamente **un** carácter cualquiera. | ✅ |
| 4.2 | ¿Diferencia entre `[abc]` y `[!abc]`? | `[abc]` empareja un carácter que **esté** en el conjunto; `[!abc]` empareja uno que **NO** esté en el conjunto. | ✅ |
| 4.3 | ¿Para qué sirve `[[:clase:]]` y un ejemplo? | Empareja un carácter de una **clase** predefinida, p. ej. `[[:digit:]]` (dígitos), `[[:upper:]]` (mayúsculas), `[[:alpha:]]` (letras). | ✅ |
| 4.4 | ¿Qué empareja el patrón `Data???`? | Archivos que empiezan con `Data` seguido de **exactamente tres** caracteres cualesquiera (ni más ni menos). | ✅ |
| 4.5 | ¿Qué empareja `[![:digit:]]*`? | Cualquier archivo cuyo **primer carácter NO sea un dígito**. | ✅ |
| 4.6 | ¿Diferencia entre `[:alnum:]` y `[:alpha:]`? | `[:alpha:]` = solo letras; `[:alnum:]` = letras **o** dígitos (alfanumérico). | ✅ |
| 4.22 | ¿Qué empareja `*.[ct]??` y por qué NO entra `img3.png`? | Archivos cuya extensión (después del último `.`) empieza con `c` o `t` y tiene **exactamente 3 caracteres** en total. `img3.png` no entra porque su extensión `png` empieza con `p`, no con `c`/`t`. Verificado en terminal: matchea `archivo1.txt`, `archivo2.txt`, `Notas.txt`, `datos.csv`. | ✅ |
| 4.23 | ¿Qué significa `[0-5]` y `[!0-5]` dentro de un comodín? ¿Qué empareja `Backup.0[!0-5]?` con `Backup.001 Backup.061 Backup.099 Backup.100`? | `[0-5]` = **rango**: cualquier dígito del 0 al 5. `[!0-5]` = su negación (6,7,8,9 o no-dígito). El patrón exige `Backup.0` + un carácter fuera de 0-5 + cualquier otro. Resultado: **`Backup.061` y `Backup.099`** (sus segundos dígitos, 6 y 9, no están en 0-5); `Backup.001` no entra (el `0` sí está en 0-5) y `Backup.100` no entra (no empieza con `Backup.0`). | 🆕 |
| 4.24 | ¿Por qué `[*[:upper:]]` NO sirve para emparejar una extensión de 3 letras como `PNG`? | Un bloque `[...]` empareja **exactamente UN carácter**, nunca una palabra completa. Para "extensión que empieza en mayúscula" (sin fijar longitud) se usa `*.[[:upper:]]*` — un carácter mayúscula seguido de `*` para cubrir el resto. | 🆕 |
| 4.7 | ¿Qué pasa si copias un archivo a un destino que ya existe, sin ninguna opción? | `cp` lo **sobrescribe en silencio**, sin ningún aviso. Para que pregunte antes, usa `-i`. | ✅ |
| 4.8 | ¿Qué opción de `cp` es **obligatoria** para copiar un directorio entero? | `-r` (`--recursive`) o `-a` (`--archive`). Sin ella, `cp` falla al intentar copiar un directorio. | 🆕 |
| 4.9 | ¿Qué diferencia hay entre `cp -r` y `cp -a` al copiar un directorio? | `-r` copia el contenido recursivamente pero los archivos toman los **atributos del usuario** que copia; `-a` además preserva **permisos y propietario** originales. | 🆕 |
| 4.10 | La **doble función de `mv`**: ¿qué hace `mv a.txt /tmp/` vs `mv a.txt nuevo.txt`? | Mueve (1º a `/tmp/`) o renombra (2º en el mismo dir). En **ningún** caso **copia**: dentro del mismo disco, `mv` no duplica ni borra datos — solo **renombra la entrada del directorio** que apunta al mismo inode, en una sola operación atómica (no es "copiar y luego borrar"). | 🔁 |
| 4.11 | Hard link: si borras el archivo original, ¿se puede seguir leyendo por el hard link? ¿Por qué? | **Sí.** El hard link es otro nombre apuntando al **mismo inode** (mismos datos). Borrar el original solo quita un nombre; los datos viven hasta que el contador de enlaces llega a 0. | 🆕 |
| 4.12 | Symbolic link: si borras el original, ¿qué pasa al abrir el symlink? ¿Por qué? | Se rompe (**dangling link**): da *"No such file or directory"*. El symlink solo guarda una **ruta de texto** al original, no los datos; sin original apunta a la nada. | 🆕 |
| 4.13 | ¿Por qué un **hard link** no cruza particiones ni apunta a directorios, pero un **symlink** sí? | El inode solo tiene sentido dentro de su propio sistema de archivos (→ no cruza particiones) y los hard links a directorios crearían bucles en el árbol. El symlink es solo una ruta, así que puede ir a otra partición, a un directorio o incluso a algo inexistente. | 🆕 |
| 4.14 | Con `ls -li`, ¿cómo distingues un hard link de un symlink? | El hard link comparte el **mismo número de inode** (1ª columna) que el original; el symlink tiene **otro inode** y se muestra como `sym.txt -> original.txt`. | ✅ |
| 4.15 | Un symlink `ln -s appv1.conf config-actual` creado dentro de `src/app/`. Si te paras en `/workspace` y corres `cat src/app/config-actual`, ¿por qué puede fallar aunque `appv1.conf` exista? | El texto del symlink (`appv1.conf`) se resuelve **relativo a la carpeta donde vive el enlace** (`src/app/`), no desde donde estás parado. Si el texto no es una ruta válida vista *desde ahí*, el enlace queda roto (`file` lo confirma: "broken symbolic link to..."). | ✅ |
| 4.16 | ¿Un symlink valida que su destino exista al crearlo? | No. `ln -s` nunca valida; puedes crear un enlace a algo que no existe y bash no avisa nada. El error solo aparece **al usarlo** (leerlo/abrirlo). | ✅ |
| 4.17 | ¿Qué pasa si haces `ln -s destino nombre` y `nombre` ya existe, sin `-f`? ¿Qué hace `-f`? | Sin `-f`: error, "by default each destination should not already exist". Con `-f` (`--force`): borra el enlace/archivo existente y lo reemplaza. | ✅ |
| 4.18 | ¿Para qué sirve en la práctica un symlink con nombre estable (ej. `config-actual -> appv1.conf`)? | Da **un punto único de control**: N scripts/programas leen siempre el nombre estable; para cambiarlos todos a otra versión basta con **un** `ln -sf nuevo_destino nombre_estable`, sin editar cada script. Ej. real: `/usr/bin/python -> python3 -> python3.11`. | ✅ |
| 4.19 | En `ls -li`, ¿qué significa el número que aparece justo después de los permisos (ej. el `2` en `-rw-r--r-- 2 ...`)? | El **contador de enlaces**: cuántos nombres (hard links) apuntan a ese mismo inode. Al borrar un nombre, el contador baja 1; los datos solo se liberan cuando llega a 0. | 🔁 |
| 4.25 | `ln original.txt respaldo` (contador=2). Corres `rm original.txt` y `cat respaldo` sigue funcionando. Explica con el número exacto del contador. | El contador bajó de **2 a 1** (ya no de 2 a 0), así que sigue siendo > 0 y los datos no se liberan. `respaldo` sigue apuntando al mismo inode vivo. | 🆕 |
| 4.26 | `ln -s activo` (un solo argumento, sin target). ¿Qué crea y qué error da al usarlo? | Sin el 2º argumento, `ln -s` usa el mismo nombre como link y como target en el directorio actual → crea un enlace **auto-referenciado** (`activo -> activo`). Al leerlo: `"Too many levels of symbolic links"` (bucle infinito). Sintaxis correcta: `ln -s TARGET NOMBRE_DEL_LINK`. | 🆕 |
| 4.20 | ¿Un hard link es una copia del archivo? | **No.** Una copia (`cp`) crea un inode nuevo y duplica los datos (ocupa espacio extra). Un hard link es **otro nombre para el mismo inode**: cero datos duplicados. La prueba: `ls -li` muestra el mismo número de inode en ambos nombres. | ✅ |
| 4.21 | ¿El nombre de un hard link tiene que compartir extensión con el original? | No, la extensión es solo convención para humanos; Linux no le da significado especial. El hard link apunta al **inode**, no al nombre, así que puede llamarse como sea. | ✅ |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- La **shell** expande los comodines *antes* de pasar los argumentos al comando — el comando nunca "ve" el `*`, ve la lista ya expandida.
- `cp`/`mv` sobrescriben sin avisar por defecto → opción `-i`; peligro de `rm -rf` + comodines; doble función de `mv` (mover y renombrar); `mkdir -p`.
- **Symlink = solo texto, sin validación.** Puede apuntar a algo que no existe (no da error hasta que lo usas — `file` lo delata como "broken symbolic link"). El texto se resuelve relativo a la **carpeta donde vive el enlace**, no desde donde estás parado al crearlo/leerlo — ojo con rutas relativas.
- **Hard link ≠ copia.** Copia = inode nuevo + datos duplicados. Hard link = mismo inode, cero duplicación; se ve en `ls -li` (mismo número de inode) y en el contador de enlaces tras los permisos.
- **⚠️ Nota importante de entorno:** en Windows/Git Bash, `ln -s` NO crea un symlink real — hace una copia normal (sin `l` ni flecha en `ls -l`). Para practicar links de verdad, usar un contenedor Docker/Linux o WSL con una distro instalada.

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- **Comodines básicos** (4.1–4.6, 4.22): resuelto 2026-07-09, 4/4 predicciones correctas verificadas en terminal.
- **Rangos en corchetes `[0-5]`/`[!0-5]`** (4.23) y **límite de `[...]` a un solo carácter** (4.24): fallados en examen del 2026-07-09 → 🔁 prioridad.
- **`mv` no copia — mecanismo exacto** (4.10): sigue impreciso en examen (dijo "borra y mueve" en vez de "renombra entrada de directorio, atómico") → 🔁.
- **Contador de enlaces explícito** (4.19, 4.25): sabe la definición pero no la aplicó al explicar un caso real → 🔁.
- **Sintaxis de `ln -s` con un solo argumento (auto-link)** (4.26): error real cometido en examen práctico, no completó el arreglo → 🔁 prioridad alta, repetir la tarea práctica.
