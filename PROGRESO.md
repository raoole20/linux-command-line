# Progreso de estudio — *The Linux Command Line* (William Shotts)

> Este archivo lo lee y actualiza Claude al inicio y final de cada sesión.
> Estados: ⬜ sin empezar · 🟡 en progreso · ✅ dominado · 🔁 a repasar

## Última sesión
- **Fecha:** 2026-06-26
- **Dónde quedé:** Caps 1, 2 y 3 ✅. Caps 4 y 5 🟡 — examen completo (**6.5/20**). Mejoró el entendimiento de `mv` (mover vs renombrar). **Links sin estudiar (0 contestadas); 3 prácticas de terminal sin ejecutar (0 pts); errores conceptuales en comodines+ocultos y sintaxis de `alias`.**
- **Próximo paso:** (1) **PRIORIDAD #1 — estudiar hard vs symbolic link** (el alumno lo pidió explícitamente) + práctica con `ls -li` (inodes), borrar original; (2) grabar la trampa: **`*` NO empareja archivos ocultos** (`.algo`) y el patrón empareja el **nombre completo** (`[[:upper:]]*` → `Abc.txt`, no `bc.txt`); (3) `alias`: el `=` SÍ va, lo prohibido son los **espacios** alrededor; (4) **ejecutar de verdad** las prácticas (en este libro no ejecutar = 0); (5) cerrar `which` (solo ejecutables) vs `type` (builtins/alias) y secciones de `man` (1 comando vs 5 formato de archivo); entorno *minimized* → correr `unminimize` para tener manpages.

---

## Parte I — Aprendiendo la shell
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 1 | ¿Qué es la shell? | ✅ | Verificado 2026-06-02. Inicialmente confundía shell vs terminal; aclarado. |
| 2 | Navegación (`pwd`, `cd`, `ls`) | ✅ | Verificado 2026-06-02. `pwd` = Print Working Directory. Atajos `cd`: `cd -` (dir anterior, destacado en el libro), `cd` (home), `cd ~usuario`. |
| 3 | Explorando el sistema (`less`, `file`, enlaces) | ✅ | Completado 2026-06-02. Descubrió que las opciones cortas (`-l`, `-t`, `-a`, `-r`, `-s`...) se encadenan sin límite y en cualquier orden (`-ltasr`). Diferencia `-r` (corta) vs `--reverse` (larga, 2 guiones). Pendiente: por qué `-F` no muestra diferencia → alias de `ls` (ver cola de repaso). |
| 4 | Manipular archivos y directorios (`cp`, `mv`, `rm`, `ln`) | 🟡 | `mv` mover vs renombrar ✅ (mejoró). Pendiente fuerte: **links** (sin estudiar), trampa **comodines+ocultos** (`*` no toca `.archivos`), patrón empareja nombre completo. |
| 5 | Trabajar con comandos (`type`, `which`, `help`, `man`, alias) | 🟡 | Flashcards creadas (2026-06-15). Examen 2026-06-26: `which` vs `type` parcial, secciones de `man` sin contestar, sintaxis de `alias` (`=`) mal. Falta práctica real en terminal. |
| 6 | Redirección (`>`, `>>`, `|`, pipes, `tee`) | ⬜ | |
| 7 | Ver el mundo como la shell (expansión, comillas, escapes) | ⬜ | |
| 8 | Trucos de teclado avanzados | ⬜ | |
| 9 | Permisos (`chmod`, `chown`, `umask`, `su`/`sudo`) | ⬜ | |
| 10 | Procesos (`ps`, `top`, señales, `kill`, jobs) | ⬜ | |

## Parte II — Configuración y entorno
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 11 | El entorno (variables, `.bashrc`) | ⬜ | |
| 12 | Introducción a vi(m) | ⬜ | |
| 13 | Personalizar el prompt | ⬜ | |

## Parte III — Tareas comunes y herramientas esenciales
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 14 | Gestión de paquetes | ⬜ | |
| 15 | Medios de almacenamiento | ⬜ | |
| 16 | Redes (`ping`, `ssh`, `ftp`, etc.) | ⬜ | |
| 17 | Buscar archivos (`find`, `locate`) | ⬜ | |
| 18 | Archivado y respaldo (`tar`, `gzip`, `rsync`) | ⬜ | |
| 19 | Expresiones regulares (`grep`) | ⬜ | |
| 20 | Procesamiento de texto (`cut`, `paste`, `sort`, `sed`, etc.) | ⬜ | |
| 21 | Formateo de salida (`fmt`, `pr`, `printf`) | ⬜ | |
| 22 | Impresión | ⬜ | |
| 23 | Compilar programas (`make`) | ⬜ | |

## Parte IV — Escribir shell scripts
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 24 | Tu primer script | ⬜ | |
| 25 | Iniciar un proyecto | ⬜ | |
| 26 | Diseño descendente (funciones) | ⬜ | |
| 27 | Control de flujo: `if` | ⬜ | |
| 28 | Leer entrada de teclado (`read`) | ⬜ | |
| 29 | Bucles: `while` / `until` | ⬜ | |
| 30 | Troubleshooting (depurar scripts) | ⬜ | |
| 31 | Control de flujo: `case` | ⬜ | |
| 32 | Parámetros posicionales (`$1`, `$@`...) | ⬜ | |
| 33 | Bucles: `for` | ⬜ | |
| 34 | Cadenas y números | ⬜ | |
| 35 | Arrays | ⬜ | |
| 36 | Exotica (temas avanzados) | ⬜ | |

---

## 🔁 Temas para repasar (cola de repaso espaciado)
*(Claude agrega aquí los temas que me costaron, con la fecha. Los revisamos al inicio de las siguientes sesiones.)*

| Tema | Marcado el | Repasado el | ¿Resuelto? |
|------|-----------|-------------|------------|
| `-F` de `ls` y alias de `ls` (correr `type ls`) — por qué no se ve diferencia | 2026-06-02 | 2026-06-08 | 🟡 Parcial — corrió `type ls` (`ls --color=auto`); falta explicación propia |
| **Hard link vs symbolic link** (inode, borrar original, particiones, directorios) | 2026-06-08 | 2026-06-26 | ⬜ No — **sin estudiar aún (0/3 en examen). PRIORIDAD #1, pedido por el alumno.** |
| **Comodines** — predecir salidas (`?`, `[abc]`, `[!abc]`, `[[:clase:]]`) | 2026-06-08 | 2026-06-26 | 🟡 Parcial — A1/A3 ✅; falló nombre completo (`[[:upper:]]*`) y ocultos |
| **Trampa: `*` y comodines NO emparejan archivos ocultos (`.algo`)** | 2026-06-26 | | ⬜ No — falló A4 y A5 por esta idea |
| `mv` NO copia — mueve/renombra (el original deja de existir) | 2026-06-08 | 2026-06-26 | 🟡 Mejoró (B9 ✅) — confirmar 2ª vez para cerrar |
| **Sintaxis `alias`** — el `=` SÍ va; lo prohibido son los espacios alrededor | 2026-06-26 | | ⬜ No — falló D15 (dijo que el `=` no se necesita) |
| `which` (solo ejecutables) vs `type` (builtins/alias) + secciones de `man` (1 vs 5) | 2026-06-26 | | ⬜ No — B10 parcial, B11 sin concepto |

---

## Registro de sesiones
*(Bitácora breve por sesión.)*

| Fecha | Capítulos cubiertos | Lo que dominé | Lo que me costó |
|-------|---------------------|---------------|-----------------|
| 2026-06-02 | Caps 1, 2 y 3 | Encadenar opciones cortas de `ls` sin límite y en cualquier orden (`-ltasr`); `-r` vs `--reverse` | Entender `-F` (quedó pendiente el tema del alias de `ls`) |
| 2026-06-08 | Examen rápido Caps 1–4 — **5.5/20** | Práctica real: demostró sobrescritura silenciosa con `mv` (`b.txt` pisado, `a.txt` desaparece) | Hard/symbolic links (sin estudiar); comodines (no los aplicó); creía que `mv` "copia" |
| 2026-06-26 | Examen completo Caps 1–5 — **6.5/20** | `mv` mover vs renombrar (B9 ✅); comodines `?` y `Data???` (A1/A3 ✅) | Links 0/3 (sin estudiar); 3 prácticas de terminal sin ejecutar (0 pts); `*` con ocultos (A4/A5); sintaxis `alias` `=` (D15); `which`/`type` y secciones `man` (B10/B11) |