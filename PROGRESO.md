# Progreso de estudio — *The Linux Command Line* (William Shotts)

> Este archivo lo lee y actualiza Claude al inicio y final de cada sesión.
> Estados: ⬜ sin empezar · 🟡 en progreso · ✅ dominado · 🔁 a repasar

## Última sesión
- **Fecha:** 2026-06-03
- **Dónde quedé:** Caps 1, 2 y 3 ✅. Cap 4 🟡 — me lo voy a **leer por mi cuenta** (`cp`, `mv`, `mkdir`, `rm`, `ln`); sin práctica todavía por tiempo.
- **Próximo paso:** Al volver: (1) recuerdo activo del Cap 4 con las preguntas guía (overwrite/`-i`, doble función de `mv`, `mkdir -p`, peligro de `rm -rf` + comodines, hard vs symbolic links) + práctica en terminal; (2) cerrar el pendiente de `-F`/alias de `ls` (correr `type ls`).

---

## Parte I — Aprendiendo la shell
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 1 | ¿Qué es la shell? | ✅ | Verificado 2026-06-02. Inicialmente confundía shell vs terminal; aclarado. |
| 2 | Navegación (`pwd`, `cd`, `ls`) | ✅ | Verificado 2026-06-02. `pwd` = Print Working Directory. Atajos `cd`: `cd -` (dir anterior, destacado en el libro), `cd` (home), `cd ~usuario`. |
| 3 | Explorando el sistema (`less`, `file`, enlaces) | ✅ | Completado 2026-06-02. Descubrió que las opciones cortas (`-l`, `-t`, `-a`, `-r`, `-s`...) se encadenan sin límite y en cualquier orden (`-ltasr`). Diferencia `-r` (corta) vs `--reverse` (larga, 2 guiones). Pendiente: por qué `-F` no muestra diferencia → alias de `ls` (ver cola de repaso). |
| 4 | Manipular archivos y directorios (`cp`, `mv`, `rm`, `ln`) | 🟡 | Leyéndolo por mi cuenta (2026-06-03). Pendiente: recuerdo activo + práctica en terminal. Ojo al plato fuerte: hard link vs symbolic link. |
| 5 | Trabajar con comandos (`type`, `which`, `help`, `man`, alias) | ⬜ | |
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
| `-F` de `ls` y alias de `ls` (correr `type ls`) — por qué no se ve diferencia | 2026-06-02 | | ⬜ No |

---

## Registro de sesiones
*(Bitácora breve por sesión.)*

| Fecha | Capítulos cubiertos | Lo que dominé | Lo que me costó |
|-------|---------------------|---------------|-----------------|
| 2026-06-02 | Caps 1, 2 y 3 | Encadenar opciones cortas de `ls` sin límite y en cualquier orden (`-ltasr`); `-r` vs `--reverse` | Entender `-F` (quedó pendiente el tema del alias de `ls`) |