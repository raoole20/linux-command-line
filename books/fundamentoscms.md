# Cómo aprender a construir un CMS / plataforma e-commerce (estilo Shopify / WordPress)

> Lista curada de recursos en inglés para entender la **capa de plataforma** debajo de un storefront: multi-tenant SaaS, dominio de comercio, internals de CMS y sistemas de theming/extensibilidad.
>
> **Nota de honestidad:** la verificación web en vivo no estuvo disponible al generar esto (WebSearch bloqueado, `403`). Los **libros, repos open-source y docs oficiales** son estables y verificados de memoria (conocimiento a inicios de 2026). Las **tesis/papers académicos** están marcados ⚠️ — confirma títulos/DOIs tú mismo en Google Scholar.

---

## Fundamentos transversales (léelos sí o sí)

| Recurso | Qué aprender | Nivel |
|---|---|---|
| **Domain-Driven Design** — Eric Evans (2003, "Blue Book") | Catálogo/carrito/orden/checkout como *bounded contexts*; toda plataforma de comercio tiene forma DDD | Intermedio→Profundo |
| **Implementing Domain-Driven Design** — Vaughn Vernon (2013, "Red Book") | La versión práctica del anterior; agregados, repositorios, eventos | Intermedio |
| **Designing Data-Intensive Applications** — Martin Kleppmann (2017) | La capa de datos bajo cualquier plataforma multi-tenant: particionado, replicación, consistencia | Profundo (esencial) |
| **Patterns of Enterprise Application Architecture** — Martin Fowler (2002) | Vocabulario base: Repository, Unit of Work, Domain Model, **Money pattern** | Intermedio |
| **A Philosophy of Software Design** — John Ousterhout | Diseñar puntos de extensión / módulos profundos — aplica directo a tu slot-registry | Intermedio |

---

## Ángulo 1 — Plataforma multi-tenant SaaS (lo que estás construyendo)

- **Building Multi-Tenant SaaS Architectures** — Tod Golding (O'Reilly, 2024). Golding lidera AWS SaaS Factory. **El mejor libro actual para tu problema exacto:** silo/pool/bridge, tenant isolation, onboarding, config por tenant. *Empieza aquí para este ángulo.* — **Intermedio→Profundo**
- **Azure Architecture Center — "Multitenant architecture"** (docs de Microsoft, gratis, mantenido). Guía moderna y completa de patrones multi-tenant. — **Intro→Intermedio**
- **"Multi-Tenant Data Architecture"** — Chong, Carraro & Wolter (MSDN, 2006). Paper fundacional: taxonomía separate-DB / separate-schema / shared-schema. Viejo pero canónico. — **Intro→Intermedio**
- **AWS "SaaS Tenant Isolation Strategies"** (whitepaper) + charlas de **Tod Golding en re:Invent** (busca "Tod Golding tenant isolation"). Lo más práctico que existe. — **Intermedio**

---

## Ángulo 2 — Dominio e-commerce (estilo Shopify)

- **Domain Modeling Made Functional** — Scott Wlaschin (Pragmatic Bookshelf, 2018). Modela un flujo de órdenes de punta a punta; el libro más digerible para "modelar bien un dominio de comercio". En cuanto lo leas verás qué mezcla tu template hoy. — **Intermedio**

**Repos para leer como implementaciones de referencia:**

| Repo | Stack | Qué estudiar | Nivel |
|---|---|---|---|
| **Medusa** (`medusajs`) | TypeScript/Node | **El más cercano a tu mundo.** Arquitectura de módulos, modelo product/variant, cart→order, pricing, *workflows* | Intermedio→Profundo |
| **Vendure** | TS/NestJS | Excelente **sistema de plugins** + state machine de órdenes | Profundo |
| **Saleor** | Python/Django/GraphQL | Modelo de dominio muy limpio; checkout, product-types/attributes, diseño de API GraphQL | Profundo |
| **Solidus** (fork de Spree) | Ruby/Rails | El modelo de dominio OSS más maduro; promociones, *adjustments*, state machine | Profundo |
| **WooCommerce** | PHP/WordPress | Cómo el comercio se injerta sobre un CMS | Intermedio |

- **Shopify Engineering blog** (shopify.engineering) — posts sobre manejo de dinero/monedas, sharding de MySQL en "pods" para multi-tenancy, y su *modular monolith*. — **Intermedio→Profundo**
- **Money handling:** el **Money pattern** de Fowler + observa cómo estos codebases guardan importes en unidades menores (centavos). Todo el mundo lo hace mal la primera vez.

---

## Ángulo 3 — Internals de CMS (estilo WordPress)

- **WordPress Developer Resources** (developer.wordpress.org):
  - **Plugin Handbook** → *actions & filters*, el patrón canónico de extensibilidad.
  - **Theme Handbook** → *template hierarchy*, cómo un request mapea a un template.
  - **Block Editor Handbook** → editor moderno y bloques.
  - Gratis y autoritativo. — **Intro→Intermedio**
- **Lee el core:** `wp-includes/plugin.php` — todo el sistema de hooks son ~unas cientos de líneas; leerlo es revelador. También `wp-includes/template-loader.php`. — **Profundo**
- **Professional WordPress: Design and Development** — Williams, Damstra, Stern (Wrox) — el libro clásico de internals de WP. — **Intermedio**
- **Contraste moderno en JS:** **Payload CMS** (config-as-code — muy alineado con tu "config-as-preset"), **Strapi**, **Directus**. Modelado de content-types, schema dinámico, RBAC, sistemas de plugins en stack JS. — **Intermedio**

---

## Ángulo 4 — Theming y extensibilidad

- **Shopify Liquid** — shopify.dev + el gem open-source `Shopify/liquid`. Cómo se diseña un lenguaje de plantillas **seguro y sandboxeado** que un merchant no-confiable puede editar sin ejecutar código arbitrario. Directamente relevante a tu theming por slots/variantes. — **Intermedio→Profundo**
- **WordPress block themes / `theme.json`** — la dirección declarativa actual (design tokens en JSON), casi idéntica a tu modelo "preset + tokens". Léelo como *prior art* de lo que ya construiste. — **Intermedio**
- **Twig sandbox** (Symfony; motor detrás de Drupal/Shopware) — modo sandbox para plantillas no-confiables. — **Intermedio→Profundo**
- **Sandboxing de extensiones de terceros:**
  - El write-up del **sandbox de plugins de Figma** (realms + QuickJS en iframe) — lectura excelente sobre correr JS de terceros de forma segura.
  - La evolución de **Shopify hacia UI extensions en Web Workers / WASM**.
  - — **Profundo**

---

## Tesis y papers ⚠️ (no verificados en vivo — confírmalos en Google Scholar)

- Chong & Carraro — *"Architecture Strategies for Catching the Long Tail"* (Microsoft, 2006).
- Krebs, Momm, Kounev — *"Architectural Concerns in Multi-Tenant SaaS Applications"* (CLOSER, 2012).
- Bezemer & Zaidman — *"Multi-tenant SaaS applications: maintenance dream or nightmare?"* (2010).
- Material tipo tesis: busca en Scholar *"multi-tenant SaaS architecture thesis"* / *"tenant isolation database"* — TU Delft, KTH y Aalto publican bastante MSc en esto.

---

## Cursos / tutoriales

- Los **docs de arquitectura de Medusa y Vendure** son, en la práctica, el mejor "build from scratch" que hay — con getting-started serios.
- La lista de GitHub **"Build Your Own X"** tiene entradas de CMS y e-commerce desde cero.
- Frontend Masters / egghead tienen series "Build a headless CMS" (verifica disponibilidad actual).

---

## Orden de lectura sugerido (para alguien que ya hace storefronts en Next.js)

1. **Golding — Building Multi-Tenant SaaS Architectures** + docs multitenant de Azure → el mapa de la capa de plataforma que hoy construyes a ciegas.
2. **Domain Modeling Made Functional** (Wlaschin) → modelar el dominio de comercio limpio.
3. **Leer Medusa** (código + docs) → una implementación JS de referencia de todo, en tu stack.
4. **WP Plugin Handbook (hooks) + Shopify Liquid** → los dos modelos canónicos de extensibilidad/theming; te dirá si tu slot-registry debería evolucionar hacia hooks o hacia un lenguaje de plantillas.
5. **DDIA (particionado) + AWS tenant isolation** → cuando decidas DB-por-tenant vs shared-schema.
6. Cierra yendo profundo en un modelo de dominio OSS (**Vendure** o **Saleor**) por las state machines.
