# Roadmap de estudio — Backend / DevOps / Arquitectura

> **Estado: en cola, NO activo.** El libro que se está leyendo ahora mismo es
> ***The Linux Command Line*** (ver `PROGRESO.md` en la raíz del proyecto).
> Este roadmap es el **siguiente** paso, en orden, una vez cerrado LCL. No se
> estudia en paralelo — evita diluir el foco.
>
> Progresión: **1 recurso a la vez, en el orden de la tabla.** No saltar al
> siguiente hasta terminar el actual. Cuando arranques este roadmap, créale
> su propio `PROGRESO.md`/flashcards siguiendo el mismo formato que ya usas
> para LCL.

---

## Orden de lectura (lineal, no te saltes pasos)

| # | Libro | Por qué va aquí | Tiempo est. |
|---|-------|------------------|-------------|
| 0 | **The Linux Command Line** — William Shotts *(EN CURSO ahora)* | Base de todo: shell, permisos, procesos, scripts. | 2-3 semanas |
| 1 | **Docker Deep Dive** — Nigel Poulton | Corto y práctico (~300 pág). Pasas de "cero" a entender Docker de verdad. Requiere ya tener soltura de shell (paso 0). | 1-2 semanas |
| 2 | **The Phoenix Project** — Gene Kim | Novela de DevOps. Se lee como ficción; cambia la mentalidad sobre deploys/CI/CD/ops antes de ir a teoría dura. | 1 semana |
| 3 | **Designing Data-Intensive Applications** — Martin Kleppmann | La pieza más densa y más importante de esta lista: bases de datos, replicación, consistencia, escalabilidad. Si solo hicieras una del roadmap completo, sería esta. | 4-6 semanas |

**Tiempo total pasos 0-3:** ~3 meses a 30 min/día.

---

## Después del núcleo — ENFOQUE ÚNICO (ya decidido, no re-abrir la elección)

> Se evaluó salida laboral de todas las ramas posibles y se eligió converger
> **Rama A (DevOps/SRE) + Rama B (Docker/Kubernetes) + Rama F (CMS/e-commerce)**
> en un solo proyecto capstone. No se estudian como libros sueltos y
> desconectados — cada libro se lee **para construir una parte concreta del
> proyecto**, en el orden de las fases de abajo.

### Proyecto capstone — Mini plataforma headless de e-commerce con SRE real

Backend de comercio pequeño (catálogo, carrito, checkout) multi-tenant,
desplegado como si fuera producción, con CI/CD, observabilidad y un CMS que
autoprovisiona tenants nuevos.

**Fase 1 — CMS / dominio de comercio (Rama F)**
- API en NestJS: productos, variantes, carrito → orden. Referencia de
  arquitectura: Vendure / Ever (leer código, no copiar).
- Multi-tenancy **shared-schema** (columna `tenant_id`) — se elige este
  modelo sobre namespace-por-tenant para no explotar el scope de un proyecto
  de portfolio.
- Panel CMS mínimo (API + vista simple, puede ser Next.js) para crear un
  tenant: nombre, subdominio, tema/catálogo inicial.
- Storefront en Next.js consumiendo la API (ya sabes hacer esto).

**Fase 2 — Contenerización y orquestación (Rama B)**
- Libros: **The Kubernetes Book** (Poulton), **Kubernetes Up & Running** (Hightower).
- Dockerizar API + storefront + Postgres/Redis.
- Desplegar en Kubernetes local (`kind`/`minikube`): manifiestos propios o Helm chart.
- Health checks (liveness/readiness) + HPA (autoescalado horizontal).

**Fase 3 — DevOps/SRE y autodeploy de tenants (Rama A)**
- Libros: **The DevOps Handbook**, **Site Reliability Engineering** (Google, gratis), **Release It!** (Nygard).
- CI/CD con GitHub Actions: build → push a registry → deploy automático.
- **Autodeploy real:** crear un tenant desde el CMS dispara un workflow que
  corre migración + seed de datos + config para ese tenant (sin tocar K8s
  manualmente).
- Observabilidad: Prometheus + Grafana (métricas), Loki/ELK (logs).
- Prueba de carga con **k6** simulando tráfico de checkout.
- Chaos mini-test: matar un pod a propósito y documentar la recuperación.
- *Stretch goal opcional (solo si sobra tiempo):* migrar el aislamiento a
  namespace-por-tenant con release de Helm nuevo por cada alta.

Cuando arranques esta fase, créale su propio `PROGRESO.md` y flashcards
igual que con LCL — checkpoints por fase, no todo de un jalón.

**Fase 4 — Features futuras (post-MVP, stretch — NO empezar hasta cerrar Fases 1-3)**

Lista tomada de un repo de referencia (Spring Cloud), adaptada a nuestro
stack (NestJS/Node). Algunas herramientas son intercambiables 1:1, otras son
específicas de Java y necesitan su equivalente.

| Feature original (Spring) | Equivalente en nuestro stack (NestJS/K8s) |
|---|---|
| Service Discovery (Netflix Eureka) | Nativo de Kubernetes (Services/DNS) — Eureka no aplica fuera de Spring |
| API Gateway (Spring Cloud Gateway) | Nginx Ingress / Kong / gateway propio en NestJS |
| Distributed Tracing (Sleuth & Zipkin) | OpenTelemetry + Zipkin/Jaeger (agnóstico de lenguaje) |
| Event-Driven Architecture (RabbitMQ) | Igual — RabbitMQ vía `@nestjs/microservices` |
| Security (API Key Manager & OAuth2/Keycloak) | Igual — Keycloak es agnóstico de stack |
| Resiliency (Resilience4j) | `opossum` o circuit breaker propio en NestJS |
| Database per Service Pattern | Igual — un Postgres/schema por servicio |
| Cloud Native (Kubernetes & AWS EKS) | Igual |
| Infrastructure as Code (Terraform) | Igual |
| Automated Deployment (Skaffold) | Igual — Skaffold para loop de dev en K8s |
| Monitoring (Prometheus & Grafana) | Igual |
| Email Notifications (AWS SES) | Igual |
| Deployment Strategies (Blue/Green, Rolling, Canary) | Igual — vía Argo Rollouts o nativo de K8s |
| CQRS (read/write separados, Order View denormalizado) | Igual — NestJS trae módulo `@nestjs/cqrs` |

**Roadmap de features (checklist, orden sugerido tras el MVP de Fases 1-3):**
- [ ] API Documentation con OpenAPI/Swagger
- [ ] API Key Manager para seguridad de APIs
- [ ] OAuth2 con Keycloak
- [ ] Resiliencia (circuit breaker + fallback)
- [ ] Deploy automatizado a K8s con Skaffold
- [ ] Infrastructure as Code con Terraform
- [ ] Deployment Strategies (Blue/Green, Rolling Update, Canary)
- [ ] CQRS con read model denormalizado en Order Service
- [ ] Service Mesh (Istio/Linkerd)
- [ ] Frontend con React o Angular (alternativo/adicional al storefront Next.js)

**Repo de referencia (arquitectura, no copiar código):**
[miliariadnane/demo-microservices](https://github.com/miliariadnane/demo-microservices) —
mismo patrón de features (Eureka, Gateway, Sleuth/Zipkin, RabbitMQ, OAuth2,
Resilience4j, K8s/EKS) pero en Spring Cloud. Útil para ver cómo se conectan
las piezas, adaptando cada una a la tabla de equivalencias de arriba.

### System Architecture (objetivo final, todas las fases)

```
                                   ┌────────────────────┐
                                   │   Storefront (Next.js)│
                                   │   CMS Admin Panel      │
                                   └──────────┬─────────┘
                                              │ HTTPS
                                   ┌──────────▼─────────┐
                                   │   API Gateway        │  ← Ingress / Kong
                                   │  (auth, rate limit)  │
                                   └──────────┬─────────┘
                     ┌───────────────┬────────┼────────┬───────────────┐
                     │               │        │        │               │
              ┌──────▼─────┐ ┌───────▼──┐ ┌───▼────┐ ┌─▼──────────┐ ┌──▼─────────┐
              │  Catalog    │ │  Cart    │ │ Order  │ │  Tenant/   │ │Notification│
              │  Service    │ │ Service  │ │Service │ │  CMS Svc   │ │  Service   │
              └──────┬─────┘ └───────┬──┘ └───┬────┘ └─┬──────────┘ └──┬─────────┘
                     │               │        │        │               │
                     │      DB per service (Postgres, schema/tenant_id)│
                     │               │        │        │               │
                     └───────┬───────┴────────┴────────┴───────────────┘
                              │ eventos (orden creada, tenant creado...)
                       ┌──────▼──────┐
                       │  RabbitMQ    │
                       └──────┬──────┘
                              │
                   ┌──────────▼───────────┐
                   │ Autodeploy pipeline    │  ← GitHub Actions
                   │ (migración+seed tenant)│
                   └────────────────────────┘

   Transversal a todos los servicios:
   - Auth: Keycloak (OAuth2)
   - Tracing: OpenTelemetry → Zipkin/Jaeger
   - Métricas/Logs: Prometheus + Grafana, Loki/ELK
   - Orquestación: Kubernetes (EKS) + Terraform (IaC) + Skaffold (dev loop)
   - Resiliencia: circuit breaker/fallback en cada llamada entre servicios
```

### Ramas descartadas por ahora (no se estudian, no distraen)
Redes (Rama D), Linux profundo (Rama C) y arquitectura de microservicios
genérica (Rama E) quedaron fuera del enfoque único. Si en el futuro se
retoman, se re-evalúan aparte — no se mezclan con el capstone.

---

## Extras (no forman parte de la progresión — opcionales, cuando quieras)

- **Cloud Resume Challenge** — proyecto guiado gratis: app + CI/CD + IaC en AWS/Azure/GCP.
- **TechWorld with Nana** (YouTube) — explicaciones cortas de DevOps.
- **Frontend Masters** — cursos de Docker/K8s/AWS.

---

## Fuente

Lista original tomada de: https://medium.com/javarevisited/6-must-read-books-for-backend-developers-in-2026-28bcd7984ddd
