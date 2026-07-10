# Cap 7 — Ver el mundo como la shell (expansión, comillas, escapes)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-07-09
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## ⭐ Idea central del capítulo — Expansión

Antes de ejecutar un comando, la shell **reescribe la línea** sustituyendo
ciertos patrones por otra cosa (texto, nombres de archivo, resultados de
comandos, números...). El comando final nunca "ve" el patrón original,
solo ve el resultado ya expandido. Todos los temas de este capítulo son
variaciones de esa misma idea: *sustituir antes de ejecutar*.

## Tilde Expansion (`~`)

| Patrón | Se expande a |
|--------|---------------|
| `~` | El directorio home del **usuario actual**. |
| `~usuario` | El directorio home de **ese usuario** (ej. `~root` → home de root). |

## Arithmetic Expansion

Permite usar el prompt como calculadora. Forma: `$((expresión))`.

**Tabla 7-1: Operadores aritméticos**

| Operador | Significado |
|----------|-------------|
| `+` | Suma |
| `-` | Resta |
| `*` | Multiplicación |
| `/` | División (⚠️ solo enteros — el resultado se trunca, sin decimales) |
| `%` | Módulo (residuo de la división) |
| `**` | Exponenciación |

- Siempre lleva `$` antes de `((...))` porque el `$` es la señal de "sustituye
  esto"; sin él, bash intenta *ejecutar* la expresión como comando en vez de
  devolver su valor a `echo`.
- Se puede anidar: `$(($((5**2)) * 3))`. La expresión interior se evalúa y
  sustituye **primero** (por su resultado en texto), y luego se evalúa la
  expresión exterior con ese texto ya puesto en su lugar.

## Brace Expansion (`{...}`)

| Patrón | Se expande a |
|--------|---------------|
| `Front-{A,B,C}-Back` | `Front-A-Back Front-B-Back Front-C-Back` |
| `{1..5}` | `1 2 3 4 5` |
| `{001..15}` | `001 002 ... 014 015` (mantiene el **padding** de ceros del primer término si este tiene más dígitos que el número más grande de la secuencia) |
| `a{A{1,2},B{3,4}}b` | `aA1b aA2b aB3b aB4b` (las llaves se pueden **anidar**; cada combinación interior se combina con cada elemento exterior) |

- Uso práctico real: `mkdir {2007..2009}-{01..12}` crea de un solo golpe
  todas las combinaciones año-mes (36 directorios) sin escribirlas a mano.

## Parameter Expansion (intro)

- La shell guarda datos con nombre en **variables** (ej. `USER` contiene tu
  nombre de usuario).
- Para **leer** el valor se usa `$` delante: `echo $USER`.
- ⚠️ Para **asignar** un valor NO se usa `$`: `USER=valor` (a diferencia de
  otros lenguajes como PHP, donde `$` se usa tanto para leer como asignar).
  El `$` en bash siempre significa "sustituye por el valor", nunca "esta es
  la variable que voy a definir".

## Command Substitution

Permite usar la **salida de un comando** como parte de otro comando.

| Sintaxis | Ejemplo |
|----------|---------|
| `$(comando)` | `ls -l $(which cp)` |
| `` `comando` `` (backticks, sintaxis antigua) | `` ls -l `which cp` `` |

- Igual que la expansión aritmética: el comando interior se ejecuta
  **primero**, su salida se sustituye como texto en el lugar de
  `$(comando)`, y **después** se ejecuta el comando exterior ya con ese
  texto puesto.
- Funciona también con pipelines completos: `file $(ls -d /usr/bin/* | grep zip)`.
- Útil para no tener que conocer/escribir rutas a mano (ej. no necesitas
  saber dónde vive `cp`, solo pedirle a `which` que lo averigüe).

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 7.1 | ¿Qué diferencia hay entre `echo ~` y `echo ~foo`? | `~` sola = home del usuario actual; `~foo` = home del usuario llamado **foo** (bash busca ese nombre de usuario y expande a su directorio home). | 🆕 |
| 7.2 | ¿Por qué `$((2+2))` necesita el `$` antes de los paréntesis dobles? | El `$` le dice a bash "sustituye esto por su valor". Sin `$`, `((...))` se interpreta como una construcción de control (evaluación aritmética como comando/condición), no como una expansión que `echo` pueda imprimir. | 🆕 |
| 7.3 | En `$(($((5**2)) * 3))`, ¿qué pasa primero? | Se evalúa la expresión interior `$((5**2))` → da `25` (como texto). Ese texto sustituye al `$((5**2))`, quedando `$((25 * 3))`, que luego se evalúa → `75`. | 🆕 |
| 7.4 | ¿Por qué `{001..15}` mantiene ceros a la izquierda hasta el 15 pero `{1..15}` no? | Bash usa como referencia el **número de dígitos del primer término** de la secuencia (`001` tiene 3 dígitos) y rellena con ceros todos los números de la secuencia para que tengan ese mismo ancho. Si el primer término no tiene ceros (`1`), no hay padding que replicar. | 🆕 |
| 7.5 | ¿Cómo se expande `a{A{1,2},B{3,4}}b` y por qué salen 4 resultados? | `aA1b aA2b aB3b aB4b`. La llave exterior tiene 2 ramas (`A{1,2}` y `B{3,4}`); cada rama interior tiene 2 elementos → 2×2 = 4 combinaciones, cada una pegada entre el prefijo `a` y el sufijo `b`. | 🆕 |
| 7.6 | Para leer una variable usas `$USER`. ¿Cómo la asignas? ¿Cuál es el error típico de quien viene de PHP? | Se asigna **sin** `$`: `USER=valor`. El error típico es escribir `$USER=valor` (como en PHP), lo cual bash interpreta mal porque el `$` es solo para *leer/sustituir*, nunca para asignar. | 🆕 |
| 7.7 | ¿Qué hace `ls -l $(which cp)` y en qué orden se ejecuta? | Primero corre `which cp` (da la ruta, ej. `/bin/cp`); ese texto sustituye a `$(which cp)`; el comando que realmente se ejecuta es `ls -l /bin/cp`. | 🆕 |
| 7.8 | ¿Qué sintaxis alternativa (más antigua) existe para command substitution en vez de `$(comando)`? | Backticks: `` `comando` ``. Bash la sigue soportando por compatibilidad con shells viejas, pero `$(...)` es la forma moderna (y se anida mejor). | 🆕 |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- El `$` es la marca universal de "sustituir por un valor" en `$var`, `$((...))` y `$(...)`. Nunca se usa `$` al **asignar** una variable.
- La expansión aritmética solo maneja **enteros**: `/` trunca, no da decimales.
- El padding de `{001..15}` se rige por el **primer** término de la secuencia, no por el más largo en general.
- Command substitution y arithmetic expansion comparten el mismo principio: se evalúa lo de dentro *antes* de ejecutar lo de fuera, y el resultado se sustituye como texto plano.

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- Todas las flashcards de este capítulo (7.1–7.8) siguen 🆕: contenido leído pero **sin verificar** con recuerdo activo ni práctica real en terminal.
- Pendiente hacer la demostración práctica de cada una en terminal antes de marcarlas ✅.
