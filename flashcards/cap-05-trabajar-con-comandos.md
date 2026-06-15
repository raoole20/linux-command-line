# Cap 5 — Trabajar con comandos (`type`, `which`, `help`, `man`, `apropos`, `whatis`, `info`, `alias`)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-06-15
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## ⭐ Punto clave — Un "comando" puede ser 4 cosas distintas

`type` existe precisamente para decirte **cuál** de las cuatro es:

1. Un **programa ejecutable** (un binario como `/usr/bin/ls`, o un script).
2. Un **comando interno (builtin)** de la shell misma (como `cd`). No es un archivo aparte.
3. Una **función** de la shell (pequeños scripts incorporados al entorno).
4. Un **alias** que definimos nosotros a partir de otros comandos (ej. `ls --color=auto`).

## Identificar comandos

| Comando | Qué hace |
|---------|----------|
| `type nombre` | Indica **cómo se interpretaría** ese nombre (cuál de los 4 tipos es). Es un *builtin*. |
| `which nombre` | Muestra la **ubicación** del programa ejecutable que se correría. ⚠️ Solo sirve para **programas ejecutables**, NO para builtins ni alias. |

## Obtener documentación

| Comando | Qué hace |
|---------|----------|
| `help comando` | Ayuda para los **builtins** de la shell (ej. `help cd`). |
| `comando --help` | Muchos ejecutables muestran su **modo de uso** con esta opción. |
| `man programa` | Muestra la **página de manual** (referencia, NO tutorial). Se ve con `less`. |
| `apropos palabra` | Busca en las descripciones de las páginas de manual y lista las que **coinciden** (equivale a `man -k`). |
| `whatis comando` | Muestra la **descripción de una línea** del manual. |
| `info comando` | Muestra la entrada **info** (GNU): hipertexto, más tipo tutorial que `man`. |

## Tabla 5-1: Organización de las páginas del `man`

| Sección | Contenido |
|---------|-----------|
| 1 | Comandos de usuario |
| 2 | Interfaces de programación para llamadas al sistema del kernel |
| 3 | Interfaces de programación a la biblioteca de C |
| 4 | Archivos especiales (device nodes y drivers) |
| 5 | Formatos de archivo |
| 6 | Juegos y entretenimiento (ej. salvapantallas) |
| 7 | Misceláneos |
| 8 | Comandos de administración del sistema |

> Para pedir una sección concreta: `man sección tema`, p. ej. `man 5 passwd`
> (la entrada del *formato de archivo* `passwd`, no la del comando `passwd`).

## `alias` — crear tus propios comandos

| Acción | Cómo |
|--------|------|
| Listar todos los alias definidos | `alias` (sin argumentos) |
| Comprobar si un nombre ya está ocupado | `type nombre` |
| Definir un alias | `alias nombre='cadena'` (⚠️ **sin espacios** alrededor del `=`) |
| Varios comandos en una línea | sepáralos con `;` → `cd /usr; ls; cd -` |
| Eliminar un alias | `unalias nombre` |

> ⚠️ Los alias creados así **desaparecen al cerrar la sesión** de la shell.
> Para hacerlos permanentes van en `.bashrc` (Cap 11).

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 5.1 | ¿Cuáles son los **4 tipos** de comando que puede identificar `type`? | (1) programa ejecutable, (2) comando interno/builtin de la shell, (3) función de la shell, (4) alias. | 🆕 |
| 5.2 | ¿Diferencia entre `type` y `which`? | `type` dice **cómo se interpreta** un nombre (los 4 tipos) y es un builtin; `which` solo da la **ubicación de un programa ejecutable** y NO funciona con builtins ni alias. | 🆕 |
| 5.3 | ¿Con qué comando obtienes ayuda de un **builtin** como `cd`? | `help cd`. (Para ejecutables suele servir `comando --help`.) | 🆕 |
| 5.4 | ¿`man` es un tutorial? | No. Es **material de referencia**, no enseña a usar el comando paso a paso; describe opciones y uso. | 🆕 |
| 5.5 | ¿Para qué sirven `apropos` y `whatis`? | `apropos palabra` busca y lista páginas de manual cuya descripción coincide (= `man -k`); `whatis` da la descripción de **una línea** de un comando. | 🆕 |
| 5.6 | ¿Qué hay en la **sección 5** del manual y cómo la pides? | Formatos de archivo. Se pide con `man 5 tema` (ej. `man 5 passwd`). | 🆕 |
| 5.7 | ¿Cómo defines un alias `ll` para `ls -l`? ¿Qué error es típico? | `alias ll='ls -l'`. Error típico: poner **espacios** alrededor del `=`. | 🆕 |
| 5.8 | ¿Cómo pones varios comandos en una sola línea y cómo borras un alias? | Separados por `;` (ej. `cd /usr; ls; cd -`); borrar con `unalias nombre`. | 🆕 |
| 5.9 | Si defines un alias en la terminal, ¿sigue existiendo mañana al reabrir? ¿Por qué? | No: se pierde al cerrar la sesión. Para que sea permanente hay que ponerlo en `.bashrc` (Cap 11). | 🆕 |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- `which` **NO** ve builtins ni alias (solo ejecutables). Si quieres saber qué es *cualquier* nombre, usa `type`.
- En `alias nombre='cadena'` **no** debe haber espacios alrededor del `=`.
- `man` = referencia, no tutorial. Para algo más explicativo, `info`.
- Una misma palabra puede tener varias páginas de `man` en distintas secciones (ej. `passwd` en sección 1 = comando, sección 5 = formato del archivo).
- Conecta con el Cap 3: el misterioso `ls --color=auto` que salió al correr `type ls` es justo un **alias** (tipo 4).

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- Demostrar en terminal: `type` sobre los 4 casos, `which` fallando con un builtin, y crear/usar/borrar un alias propio.
