# Cap 6 — Redirección (`>`, `>>`, `|`, pipes, filtros)

> Estado del capítulo: 🟡 en progreso · Última revisión: 2026-07-09
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## ⭐ Idea central del capítulo — Redirección y pipelines

Los programas en Linux normalmente leen de **standard input** y escriben en
**standard output** (y los errores van a **standard error**). La shell puede
**redirigir** esos flujos: mandarlos a un archivo en vez de a la pantalla, o
conectar la salida de un comando directamente a la entrada de otro (**pipe**,
`|`). Los "filtros" de este capítulo son comandos pensados justo para vivir
en medio de un pipeline, transformando el texto que reciben.

## Comandos filtro vistos en este capítulo

| Comando | Qué hace |
|---------|----------|
| `cat` | Concatena archivos (los junta e imprime; con un solo archivo, simplemente lo muestra). |
| `sort` | Ordena las líneas de texto. |
| `uniq` | Reporta u omite líneas repetidas (⚠️ solo detecta repetidas si son **consecutivas** — por eso casi siempre se usa después de `sort`). |
| `grep` | Imprime las líneas que coinciden con un patrón. |
| `wc` | Cuenta líneas, palabras y bytes de cada archivo. |
| `head` | Muestra la primera parte de un archivo. |
| `tail` | Muestra la última parte de un archivo. |
| `tee` | Lee de standard input y escribe **a la vez** en standard output y en archivo(s) — como una "T" que reparte el flujo en dos direcciones. |

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 6.1 | ¿Por qué `uniq` casi siempre se usa junto con `sort` (`sort archivo \| uniq`)? | `uniq` solo elimina/reporta repetidos si están en líneas **consecutivas**. Si el archivo no está ordenado, líneas iguales pero separadas no se detectan como repetidas. | 🆕 |
| 6.2 | ¿Qué diferencia hay entre `head` y `tail`? | `head` muestra el **inicio** de un archivo (por defecto las primeras 10 líneas); `tail` muestra el **final** (por defecto las últimas 10 líneas). | 🆕 |
| 6.3 | ¿Qué cuenta exactamente `wc` por defecto? | Líneas, palabras y bytes de cada archivo que le pases (en ese orden). | 🆕 |
| 6.4 | ¿Qué hace `tee` que lo distingue de simplemente redirigir con `>`? | `tee` **no** reemplaza la pantalla por el archivo: escribe el flujo **en ambos lados a la vez** (pantalla y archivo), útil para ver el resultado y guardarlo en el mismo paso dentro de un pipeline. | 🆕 |
| 6.5 | ¿Qué hace `grep patrón archivo`? | Imprime solo las **líneas que coinciden** con el patrón dado; el resto se descarta. | 🆕 |
| 6.6 | Si `cat` solo recibe un archivo, ¿para qué sirve si no está "concatenando" nada? | Simplemente **muestra** el contenido del archivo en pantalla — la concatenación real se nota cuando le pasas varios archivos y los junta uno tras otro. | 🆕 |

## Notas / trampas del capítulo
*(Detalles finos, errores típicos y "gotchas" que sirven para exámenes difíciles.)*
- `uniq` sin `sort` antes = trampa clásica: repetidos no consecutivos se cuelan sin detectar.
- Estos comandos son "filtros": están diseñados para leer de stdin y escribir a stdout, por eso encadenan bien con `|`.
- Pendiente cubrir en profundidad: operadores de redirección (`>`, `>>`, `2>`, `2>&1`) y construcción de pipelines con estos filtros — el libro los presenta antes de esta lista de comandos.

## Pendientes de repaso
*(Hilos sin cerrar de este capítulo. Mantener en sync con la cola 🔁 de PROGRESO.md.)*
- Todas las flashcards (6.1–6.6) siguen 🆕: solo se registraron las descripciones de una línea de cada comando, sin práctica real en terminal ni cobertura de `>`/`>>`/`|`/`2>` todavía.
- Falta demostrar cada filtro con un ejemplo real (`sort archivo.txt | uniq`, `ls | wc -l`, `comando | tee salida.txt`, etc.).
