Libros

https://medium.com/javarevisited/6-must-read-books-for-backend-developers-in-2026-28bcd7984ddd

### 🎯 Tu Próximo Gran Reto

Dado tu perfil, te sugiero este ejercicio práctico que une NestJS + Docker + Conceptos Avanzados:

**El Proyecto "Cola de Procesamiento":**

1. Crea una API en NestJS (Servicio A) que reciba un archivo (ej. una imagen o CSV).
2. En lugar de procesarlo ahí, envía un mensaje a una cola (**RabbitMQ** o **Redis BullMQ**) y responde al usuario "Archivo recibido".
3. Crea un **Worker** (Servicio B, otro contenedor Docker) que escuche la cola, procese el archivo (ej. redimensionar imagen) y guarde el resultado en S3 (o una carpeta local simulada).
4. Todo orquestado con **Docker Compose**.

# 🗺️ Roadmap de Aprendizaje: DevOps, Linux y Arquitectura

## 🎯 Si quieres dominar SOLO lo que hicimos (Ruta Rápida)

| Libro | Por qué | Tiempo |
| --- | --- | --- |
| **The Linux Command Line** <br>*William Shotts (gratis)* | Dominas SSH, permisos, procesos, scripts. Base de TODO. | 2-3 semanas |
| **Docker Deep Dive** <br>*Nigel Poulton* | Práctico, corto (~300 pág). Te lleva de cero a "ya entiendo Docker de verdad". | 1-2 semanas |
| **The Phoenix Project** <br>*Gene Kim* | Novela de DevOps. Se lee como ficción. Cambia tu mentalidad sobre deploys, CI/CD, ops. | 1 semana |

> 💡 **Nota:** Esos tres te dan dominio práctico de todo lo que se tocó hoy.
> 

---

## 📚 Por Área Específica

### 🖥️ Backend / Arquitectura *(Lo más recomendado del mundo)*

- **Designing Data-Intensive Applications** — *Martin Kleppmann*
    - La biblia para devs backend. Bases de datos, replicación, consistencia, escalabilidad. Si lees uno solo de esta lista, que sea este.

### ♾️ DevOps / SRE

- **The DevOps Handbook** — *Gene Kim, Jez Humble*
- **Site Reliability Engineering** — *Google (gratis online)*
- **Release It!** — *Michael Nygard*
    - Patrones para que producción no se caiga (circuit breakers, bulkheads, etc.)

### 🐋 Docker / Kubernetes

- **The Kubernetes Book** — *Nigel Poulton* (cuando estés listo para orquestación)
- **Kubernetes Up & Running** — *Kelsey Hightower*

### 🐧 Linux Profundo

- **How Linux Works** — *Brian Ward*
    - Entender el kernel, init, redes desde dentro.
- **Linux Performance** — *Brendan Gregg*
    - Más avanzado, para cuando necesites debug serio.

### 🌐 Redes / DNS / SSL

- **Computer Networking: A Top-Down Approach** — *Kurose & Ross* (textbook clásico)
- **Network Programming with Go** — *Adam Woodbeck* (si te gusta aprender con código)

### 🏗️ Web Architecture (Microservicios, APIs)

- **Building Microservices** — *Sam Newman*
    - Guía pragmática, la 2da edición es de 2021.
- **Software Architecture: The Hard Parts** — *Neal Ford*
    - Decisiones de arquitectura del mundo real.

---

## 🎓 Mi Recomendación Concreta Para Ti

Sin saber tu nivel exacto pero viendo cómo trabajaste hoy:

1. 🚀 **Empieza por:** *The Linux Command Line* (gratis, fundamentos sólidos)
2. 🐋 **Después:** *Docker Deep Dive* (refuerza todo lo que hicimos hoy)
3. 🫀 **Para el siguiente nivel:** *Designing Data-Intensive Applications* (te transforma como dev backend)

⏱️ **Tiempo estimado:** Los tres juntos te tomarán **~3 meses** si lees 30 min/día. Después de eso, decides en qué profundizar (K8s, SRE, networking).

---

## 📺 Bonus: Si prefieres video / práctico

- **Cloud Resume Challenge:** Proyecto guiado gratis, terminas con una app + CI/CD + IaC en AWS/Azure/GCP.
- **TechWorld with Nana (YouTube):** Explicaciones cortas y claras de DevOps.
- **Frontend Masters (frontendmasters.com):** Cursos de Docker, K8s, AWS dictados por expertos del área.

---

### 💬 ¿En qué área quieres profundizar primero?

Te puedo recomendar uno específico si me cuentas tu nivel actual y a dónde quieres llegar.

## 1. La habilidad #1: diagnosticar por medición, no por intuición

Hoy fallé 5 hipótesis seguidas (índices, `N''`, `ARITHABORT`, cursores, `lpc:`) hasta que **medimos** y aislamos capa por capa. Esa disciplina (medir → formular hipótesis → aislar → confirmar) es lo que resolvió el caso.

- 📘 **"Debugging" de David J. Agans** — las 9 reglas (sobre todo *"Quit thinking and look"* y *"Make it fail"*). Corto y oro puro.
- 📘 **"Systems Performance" de Brendan Gregg** — el método **USE** y la mentalidad de "mide antes de optimizar". Aunque es de sistemas, el marco mental aplica a todo.
- 🧠 Interioriza: **"fijo y repetido, no proporcional al trabajo = espera/overhead, no cómputo"**. Eso fue la pista que delató la conexión.

## 2. SQL Server / bases de datos (donde estaba la confusión)

Hoy vimos planes de ejecución, DMVs (`sys.dm_exec_query_stats`), cursores, MARS y proveedores OLE DB.

- 🌐 **Brent Ozar** (brentozar.com, blog y videos gratis) — el mejor recurso práctico de rendimiento en SQL Server. Busca "How to think like the SQL Server engine".
- 📘 **"SQL Server Execution Plans" de Grant Fritchey** (gratis en Redgate) — leer planes de ejecución de verdad.
- 🌐 **use-the-index-luke.com** (Markus Winand) — *el* recurso para entender índices y por qué una query es SARGable o hace scan. Gratis, didáctico.
- Conceptos concretos a estudiar: **logical reads vs CPU vs elapsed**, **cursores server-side vs client-side**, **MARS**, **parameter sniffing**, **statistics**.

## 3. Patrones de acceso a datos (el origen de la lentitud "de código")

- 🔑 **N+1 queries** — el patrón que más mata el rendimiento en apps con BD. Estudia cómo detectarlo y resolverlo con *batching* (`IN (...)`) o *eager loading*. Hoy lo hicimos a mano con `getChildProductsBatch`/`primeProductCurrencyFactors`.
- 🔑 **Memoización y caché por capas** (request → proceso → distribuido). Lee sobre **cache invalidation** (TTL vs eventos).
- 📘 **"Designing Data-Intensive Applications" de Martin Kleppmann** — la biblia moderna del tema. Denso pero transformador a medio plazo.

## 4. La tecnología específica de hoy (COM/ADO/OLE DB)

- La causa raíz fue un **driver deprecado** (`SQLOLEDB`) vs el moderno (`MSOLEDBSQL`). Lección: **conoce tu capa de conexión y mantén los drivers al día**.
- 📄 Docs de Microsoft: *"Microsoft OLE DB Driver for SQL Server"* y *"Using Multiple Active Result Sets (MARS)"*. Entiende por qué SQLOLEDB quedó obsoleto.

## 5. Modernizar legacy + seguridad (el resto del proyecto)

- 📘 **"Working Effectively with Legacy Code" de Michael Feathers** — cómo cambiar código sin tests con seguridad. Justo este proyecto.
- 📘 **"Refactoring" de Martin Fowler** (2ª ed.) — vocabulario y técnicas de refactor seguro.
- 🌐 **phptherightway.com** y **PDO + consultas parametrizadas** — para dejar atrás la concatenación de SQL.
- 🌐 **OWASP Top 10** (sobre todo **inyección SQL**) — hoy vimos queries por concatenación; esto es lo que las cierra.

## 6. Hábitos que valen más que cualquier libro

- **Perfila antes de optimizar.** Hoy el profiler (`?debugperf=1`) fue lo que evitó semanas perdidas tocando índices que ya estaban bien.
- **Cambia una cosa a la vez y mide.** Cada hipótesis se probó aislada.
- **Documenta el "por qué", no solo el "qué"** (lo que hicimos con los comentarios `// [perf]` y el playbook).
- **Latency numbers every programmer should know** (búscalo) — para tener intuición de qué es "rápido".

---

### Si solo haces 3 cosas

1. Lee **"Debugging" (Agans)** — 1 tarde, cambia cómo resuelves problemas para siempre.
2. Estudia **use-the-index-luke.com** + **planes de ejecución (Fritchey)** — te vuelve peligroso con SQL Server.
3. Practica el ciclo **medir → aislar → confirmar** en cada bug, conscientemente, hasta que sea automático.