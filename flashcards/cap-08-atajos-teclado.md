# Cap 8 — Trucos de teclado avanzados (Readline)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-07-09
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## Tabla 8-1: Movimiento del cursor

| Tecla | Acción |
|-------|--------|
| `CTRL-A` | Mover el cursor al **inicio** de la línea. |
| `CTRL-E` | Mover el cursor al **final** de la línea. |
| `CTRL-F` | Mover el cursor un carácter **adelante** (= flecha derecha). |
| `CTRL-B` | Mover el cursor un carácter **atrás** (= flecha izquierda). |
| `ALT-F` | Mover el cursor una **palabra** adelante. |
| `ALT-B` | Mover el cursor una **palabra** atrás. |
| `CTRL-L` | Limpiar la pantalla y mover el cursor a la esquina superior izquierda (= comando `clear`). |

## Tabla 8-2: Edición de texto

| Tecla | Acción |
|-------|--------|
| `CTRL-D` | Borra el carácter en la posición del cursor. |
| `CTRL-T` | Transpone (intercambia) el carácter en el cursor con el anterior. |
| `ALT-T` | Transpone la palabra en el cursor con la anterior. |
| `ALT-L` | Convierte a minúsculas desde el cursor hasta el final de la palabra. |
| `ALT-U` | Convierte a mayúsculas desde el cursor hasta el final de la palabra. |

## Tabla 8-3: Cortar y pegar (killing / yanking)

Readline llama **killing** a cortar y **yanking** a pegar. Lo cortado se guarda en un buffer llamado **kill-ring**.

| Tecla | Acción |
|-------|--------|
| `CTRL-K` | Corta (kill) desde el cursor hasta el **final** de la línea. |
| `CTRL-U` | Corta (kill) desde el cursor hasta el **inicio** de la línea. |
| `ALT-D` | Corta (kill) desde el cursor hasta el **final** de la palabra actual. |
| `ALT-BACKSPACE` | Corta (kill) desde el cursor hasta el **inicio** de la palabra actual. Si el cursor ya está al inicio de una palabra, corta la palabra anterior. |
| `CTRL-Y` | Pega (yank) el texto del kill-ring en la posición del cursor. |

## Tabla 8-4: Comandos de completado (completion)

| Tecla | Acción |
|-------|--------|
| `ALT-?` | Muestra una lista de las posibles completaciones. (Casi siempre equivale a presionar `TAB` dos veces, que es más fácil.) |
| `ALT-*` | Inserta **todas** las posibles completaciones. Útil cuando quieres usar más de una coincidencia. |

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 8.1 | ¿Qué hace `CTRL-A` y qué hace `CTRL-E`? | `CTRL-A` mueve el cursor al **inicio** de la línea; `CTRL-E` al **final**. | 🆕 |
| 8.2 | ¿Qué diferencia hay entre `CTRL-F`/`CTRL-B` y `ALT-F`/`ALT-B`? | `CTRL-F`/`CTRL-B` mueven **un carácter** (equivalen a las flechas); `ALT-F`/`ALT-B` mueven **una palabra completa**. | 🆕 |
| 8.3 | ¿Qué hace `CTRL-L` y con qué comando equivale? | Limpia la pantalla y pone el cursor arriba a la izquierda; equivale al comando `clear`. | 🆕 |
| 8.4 | ¿Qué diferencia hay entre `CTRL-D` y `CTRL-T`? | `CTRL-D` **borra** el carácter en el cursor; `CTRL-T` **transpone** (intercambia de lugar) ese carácter con el anterior, sin borrar nada. | 🆕 |
| 8.5 | ¿Qué hacen `ALT-L` y `ALT-U`? | Cambian mayúsculas/minúsculas desde el cursor hasta el final de la palabra: `ALT-L` a minúsculas, `ALT-U` a mayúsculas. | 🆕 |
| 8.6 | ¿Qué es el "kill-ring"? | El buffer (memoria temporal) donde Readline guarda el texto que vas cortando (killing), para poder pegarlo (yanking) después con `CTRL-Y`. | 🆕 |
| 8.7 | ¿Qué diferencia hay entre `CTRL-K` y `CTRL-U`? | `CTRL-K` corta desde el cursor hasta el **final** de la línea; `CTRL-U` corta desde el cursor hasta el **inicio** de la línea. | 🆕 |
| 8.8 | ¿Qué diferencia hay entre `ALT-D` y `ALT-BACKSPACE`? | `ALT-D` corta hacia **adelante** (hasta el final de la palabra actual); `ALT-BACKSPACE` corta hacia **atrás** (hasta el inicio de la palabra actual, o la palabra anterior si el cursor ya está al inicio). | 🆕 |
| 8.9 | ¿Con qué tecla se pega lo cortado con `CTRL-K`/`CTRL-U`/`ALT-D`/`ALT-BACKSPACE`? | `CTRL-Y` (yank), que inserta el contenido del kill-ring en la posición actual del cursor. | 🆕 |
| 8.10 | ¿Qué diferencia hay entre `ALT-?` y `ALT-*`? | `ALT-?` **muestra la lista** de posibles completaciones (como `TAB` `TAB`); `ALT-*` en cambio **inserta todas** las completaciones directamente en la línea. | 🆕 |
| 8.11 | ¿Con qué atajo de teclado normal (sin `ALT`) puedes lograr lo mismo que `ALT-?`? | Presionando `TAB` **dos veces**. | 🆕 |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- Todos estos atajos vienen de **Readline**, la librería que usa bash para leer la línea de comandos (no son exclusivos de bash).
- Distinguir bien "mover" (`CTRL`/`ALT` + `F`/`B`/`A`/`E`) de "cortar" (`CTRL-K`/`CTRL-U`/`ALT-D`/`ALT-BACKSPACE`) de "pegar" (`CTRL-Y`).
- `CTRL-T` y `ALT-T` no cortan nada, solo intercambian posiciones (carácter o palabra).

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- Todas las flashcards (8.1–8.9) siguen 🆕: solo transcritas del libro, sin práctica real en terminal.
- Falta demostrar en vivo: mover el cursor, transponer caracteres/palabras, cortar y pegar con el kill-ring.
