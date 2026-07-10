# Progreso de estudio — *The Linux Command Line* (William Shotts)

> Este archivo lo lee y actualiza Claude al inicio y final de cada sesión.
> Estados: ⬜ sin empezar · 🟡 en progreso · ✅ dominado · 🔁 a repasar

## Última sesión
- **Fecha:** 2026-07-09
- **Dónde quedé:** Repaso profundo del Cap 4 (teoría + práctica real de links en Docker/Linux + comodines básicos verificados en terminal) y luego **examen rápido de Cap 4: 9.5/20**. Confirmó dominio de links y comodines básicos; el examen expuso 3 huecos nuevos no cubiertos en el repaso guiado: rangos en corchetes (`[0-5]`/`[!0-5]`), sintaxis de `ln -s` con un solo argumento (creó un auto-link roto y no lo arregló), y precisión al explicar mecanismos (contador de enlaces, por qué `mv` no copia).
- **Próximo paso:** (1) Repasar rangos en comodines y sintaxis completa de `ln -s TARGET NOMBRE`; (2) repetir la tarea práctica de symlink entre directorios hasta lograrla sin error; (3) leer Cap 7 hoy (en curso); (4) cerrar Cap 5 con demostración práctica en terminal; (5) sábado: examen largo acumulativo de todos los capítulos vistos.

---

## Parte I — Aprendiendo la shell
| Cap | Tema | Estado | Notas / qué me costó |
|-----|------|--------|----------------------|
| 1 | ¿Qué es la shell? | ✅ | Verificado 2026-06-02. Inicialmente confundía shell vs terminal; aclarado. |
| 2 | Navegación (`pwd`, `cd`, `ls`) | ✅ | Verificado 2026-06-02. `pwd` = Print Working Directory. Atajos `cd`: `cd -` (dir anterior, destacado en el libro), `cd` (home), `cd ~usuario`. |
| 3 | Explorando el sistema (`less`, `file`, enlaces) | ✅ | Completado 2026-06-02. Descubrió que las opciones cortas (`-l`, `-t`, `-a`, `-r`, `-s`...) se encadenan sin límite y en cualquier orden (`-ltasr`). Diferencia `-r` (corta) vs `--reverse` (larga, 2 guiones). Pendiente: por qué `-F` no muestra diferencia → alias de `ls` (ver cola de repaso). |
| 4 | Manipular archivos y directorios (`cp`, `mv`, `rm`, `ln`) | 🟡 | Examen 2026-07-09: **9.5/20**. Sólido: hard/symlink, comodines básicos, elegir `cp`/`mv`/`ln` según caso. Débil: rangos `[0-5]` en comodines, sintaxis `ln -s TARGET NOMBRE` (creó auto-link sin arreglarlo), precisión explicando contador de enlaces y por qué `mv` no copia. |
| 5 | Trabajar con comandos (`type`, `which`, `help`, `man`, alias) | 🟡 | Leído por mi cuenta (2026-07-09). Pendiente: recuerdo activo + práctica en terminal. |
| 6 | Redirección (`>`, `>>`, `|`, pipes, `tee`) | 🟡 | Leído por mi cuenta (2026-07-09). Pendiente: verificar. Corrección: `cat sort uniq grep wc head tail tee` sí son del **cap 6** (filtros de pipeline) — Claude se equivocó antes al decir que eran del cap 5. |
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
| **Comodines** — predecir salidas (`?`, `[abc]`, `[!abc]`, `[[:clase:]]`) | 2026-06-08 | 2026-07-09 | ✅ Resuelto — 4/4 predicciones correctas, verificadas en terminal real |
| `mv` NO copia — mueve/renombra (el original deja de existir) | 2026-06-08 | 2026-07-09 | 🟡 Sigue impreciso en examen (dijo "borra y mueve" en vez de "renombra entrada de directorio, atómico, sin duplicar") |
| **Symlinks no funcionan en Git Bash de Windows** — usar Docker/WSL con Linux real para practicar | 2026-07-09 | | ✅ Resuelto (dato de entorno, no de contenido) |
| **Cap 7 — `echo ~foo`** (tilde expansion con nombre de usuario pegado, no solo `~` solo) | 2026-07-09 | | ⬜ No — duda abierta, en proceso |
| **Rangos en corchetes `[0-5]` / `[!0-5]`** (comodines) | 2026-07-09 | | ⬜ No — falló en examen, creía que no existían rangos en `[...]` |
| **`ln -s` con un solo argumento → auto-link roto** (`activo -> activo`, "Too many levels of symbolic links") | 2026-07-09 | | ⬜ No — cometido en examen, no lo arregló; repetir la tarea |
| **Contador de enlaces explícito al explicar hard links** (usar el número real, no solo "comparten inode") | 2026-07-09 | | ⬜ No — sabe la definición (4.19) pero no la aplicó en el examen |
| **`[...]` empareja un solo carácter, no una palabra** (extensiones de 3 letras necesitan `*` extra) | 2026-07-09 | | ⬜ No — falló al construir patrón para extensión `.PNG`/`.TXT` |
| **Cap 7 — ¿siempre lleva `$` antes de `((...))`?** (arithmetic expansion vs otros usos de paréntesis dobles) | 2026-07-09 | | ⬜ No — duda abierta |
| **Cap 7 — anidamiento `$(($((5**2)) * 3))`** (por qué la sintaxis anidada se ve "rara") | 2026-07-09 | | ⬜ No — duda abierta |
| **Cap 7 — brace expansion con ceros a la izquierda `{001..15}`** (cómo sabe mantener el padding de 3 dígitos hasta el 15) | 2026-07-09 | | ⬜ No — duda abierta |
| **Cap 7 — Command Substitution** (`$(comando)` y backticks `` `comando` `` como argumento de otro comando) | 2026-07-09 | | ⬜ No — duda abierta |

---

## Registro de sesiones
*(Bitácora breve por sesión.)*

| Fecha | Capítulos cubiertos | Lo que dominé | Lo que me costó |
|-------|---------------------|---------------|-----------------|
| 2026-06-02 | Caps 1, 2 y 3 | Encadenar opciones cortas de `ls` sin límite y en cualquier orden (`-ltasr`); `-r` vs `--reverse` | Entender `-F` (quedó pendiente el tema del alias de `ls`) |
| 2026-06-08 | Examen rápido Caps 1–4 — **5.5/20** | Práctica real: demostró sobrescritura silenciosa con `mv` (`b.txt` pisado, `a.txt` desaparece) | Hard/symbolic links (sin estudiar); comodines (no los aplicó); creía que `mv` "copia" |
| 2026-07-09 | Repaso a fondo Cap 4 (teoría + práctica real de links y comodines) + examen rápido Cap 4 — **9.5/20** | Hard/symlink con inode/contador, repunte de symlinks, comodines básicos (`?`, `[abc]`, `[[:clase:]]`), elegir `cp`/`mv`/`ln` según caso de uso | Rangos `[0-5]` en comodines; sintaxis `ln -s TARGET NOMBRE` (auto-link sin arreglar); precisión explicando mecanismos (contador de enlaces, por qué `mv` no copia) |