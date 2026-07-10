# Progreso de estudio — *The Linux Command Line* (William Shotts)

> Este archivo lo lee y actualiza Claude al inicio y final de cada sesión.
> Estados: ⬜ sin empezar · 🟡 en progreso · ✅ dominado · 🔁 a repasar

## Última sesión
- **Fecha:** 2026-07-09
- **Dónde quedé:** Repaso profundo del Cap 4 completo + práctica real de **hard vs symbolic link** en un contenedor Docker/Linux (Git Bash en Windows no crea symlinks reales — quedó anotado). Rompió y arregló un symlink relativo mal apuntado, demostró repunte (`ln -sf`) cambiando destino sin tocar el script lector, y verificó con `ls -li` que hard link = mismo inode (no copia) y symlink = inode propio con solo texto.
- **Próximo paso:** (1) Practicar **comodines** prediciendo salidas reales (pendiente de esta misma sesión); (2) hacer el examen del Cap 4 (ya con links reforzados); (3) cerrar Cap 5 con demostración práctica en terminal (`type`/`which`/alias).

---

## Parte I — Aprendiendo la shell
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 1 | ¿Qué es la shell? | ✅ | Verificado 2026-06-02. Inicialmente confundía shell vs terminal; aclarado. |
| 2 | Navegación (`pwd`, `cd`, `ls`) | ✅ | Verificado 2026-06-02. `pwd` = Print Working Directory. Atajos `cd`: `cd -` (dir anterior, destacado en el libro), `cd` (home), `cd ~usuario`. |
| 3 | Explorando el sistema (`less`, `file`, enlaces) | ✅ | Completado 2026-06-02. Descubrió que las opciones cortas (`-l`, `-t`, `-a`, `-r`, `-s`...) se encadenan sin límite y en cualquier orden (`-ltasr`). Diferencia `-r` (corta) vs `--reverse` (larga, 2 guiones). Pendiente: por qué `-F` no muestra diferencia → alias de `ls` (ver cola de repaso). |
| 4 | Manipular archivos y directorios (`cp`, `mv`, `rm`, `ln`) | 🟡 | Repaso a fondo + práctica real de links 2026-07-09 (Docker/Linux). Hard vs symbolic link ya entendido y demostrado. Falta: comodines en práctica + examen final. |
| 5 | Trabajar con comandos (`type`, `which`, `help`, `man`, alias) | 🟡 | Leído por mi cuenta (2026-07-09). Pendiente: recuerdo activo + práctica en terminal. |
| 6 | Redirección (`>`, `>>`, `|`, pipes, `tee`) | 🟡 | Leído por mi cuenta (2026-07-09). Pendiente: verificar. Ojo: `cat sort uniq grep wc head tail tee` son del cap 5 — el 6 es redirección/pipes. |
| 7 | Ver el mundo como la shell (expansión, comillas, escapes) | 🟡 | Leído por mi cuenta (2026-07-09). Pendiente: verificar. Base: `echo *`, `echo D*`, expansión de comodines. |
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
| **Hard link vs symbolic link** (inode, borrar original, particiones, directorios) | 2026-06-08 | 2026-07-09 | ✅ Resuelto — practicado en Docker/Linux real, incluyó ruta relativa rota, repunte con `ln -sf`, inode/contador con `ls -li` |
| **Comodines** — predecir salidas (`?`, `[abc]`, `[!abc]`, `[[:clase:]]`) | 2026-06-08 | | ⬜ No — pendiente esta sesión (2026-07-09) |
| `mv` NO copia — mueve/renombra (el original deja de existir) | 2026-06-08 | 2026-07-09 | 🟡 Repasado en teoría; falta reforzar en examen |
| **Symlinks no funcionan en Git Bash de Windows** — usar Docker/WSL con Linux real para practicar | 2026-07-09 | | ✅ Resuelto (dato de entorno, no de contenido) |
| **Cap 7 — `echo ~foo`** (tilde expansion con nombre de usuario pegado, no solo `~` solo) | 2026-07-09 | | ⬜ No — duda abierta, en proceso |

---

## Registro de sesiones
*(Bitácora breve por sesión.)*

| Fecha | Capítulos cubiertos | Lo que dominé | Lo que me costó |
|-------|---------------------|---------------|-----------------|
| 2026-06-02 | Caps 1, 2 y 3 | Encadenar opciones cortas de `ls` sin límite y en cualquier orden (`-ltasr`); `-r` vs `--reverse` | Entender `-F` (quedó pendiente el tema del alias de `ls`) |
| 2026-06-08 | Examen rápido Caps 1–4 — **5.5/20** | Práctica real: demostró sobrescritura silenciosa con `mv` (`b.txt` pisado, `a.txt` desaparece) | Hard/symbolic links (sin estudiar); comodines (no los aplicó); creía que `mv` "copia" |