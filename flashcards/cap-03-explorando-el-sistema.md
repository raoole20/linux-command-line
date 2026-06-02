# Cap 3 — Explorando el sistema (`less`, `file`, enlaces)

> Estado del capítulo: ✅ dominado · Última revisión: 2026-06-02
> Tapa la columna **Respuesta** e intenta contestar antes de mirar.
> Estados de flashcard: 🆕 nueva · 🔁 a reforzar · ✅ sólida

## Flashcards

| # | Pregunta | Respuesta | Estado |
|---|----------|-----------|--------|
| 3.1 | ¿Se pueden encadenar las opciones cortas de `ls`? ¿Importa el orden? | Sí, se encadenan sin límite y en **cualquier orden**: `-ltasr` == `-rtsal`. | ✅ |
| 3.2 | ¿Diferencia entre `-r` y `--reverse` en `ls`? | Son lo mismo: `-r` es la forma **corta** (1 guion) y `--reverse` la **larga** (2 guiones). | ✅ |
| 3.3 | ¿Qué hace `-F` en `ls` y por qué a veces "no se ve"? | Añade un carácter al final del nombre según el tipo (`/` dir, `*` ejecutable, `@` enlace). 🔁 Pendiente: a veces no se nota por un **alias de `ls`** ya activo (ver `type ls`). | 🔁 |

## Notas / trampas del capítulo
- Las opciones cortas (`-l`, `-t`, `-a`, `-r`, `-s`...) se combinan en un solo guion y en cualquier orden.
- Truco de examen: pedir que prediga la salida de `ls -ltr` vs `ls -lt` y que explique el efecto de cada letra.

## Pendientes de repaso
- 🔁 `-F` de `ls` y el **alias de `ls`**: por qué no se ve diferencia. Acción: correr `type ls`. (Marcado 2026-06-02, en cola 🔁 de PROGRESO.md.)
