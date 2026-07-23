# Graph Report - .  (2026-07-22)

## Corpus Check
- Corpus is ~489 words - fits in a single context window. You may not need a graph.

## Summary
- 28 nodes · 39 edges · 5 communities
- Extraction: 74% EXTRACTED · 21% INFERRED · 5% AMBIGUOUS · INFERRED: 8 edges (avg confidence: 0.92)
- Token cost: 42,284 input · 0 output

## Community Hubs (Navigation)
- CI/CD Deploy Pipeline
- README Documentation Map
- LT_VERSION Propagation
- Compose Service Config
- Ingress Network Overrides

## God Nodes (most connected - your core abstractions)
1. `README.md (LanguageTool Docker)` - 7 edges
2. `languagetool service (docker-compose.yml)` - 7 edges
3. `build job (Build & Push image)` - 6 edges
4. `deploy job (Deploy to production)` - 6 edges
5. `LT_VERSION build arg (default 6.7)` - 6 edges
6. `docker-compose.yml (as referenced in README)` - 4 edges
7. `languagetool service (docker-compose.override.yml)` - 4 edges
8. `devidence-languagetool:${LT_VERSION} image` - 4 edges
9. `lt_version workflow_dispatch input` - 3 edges
10. `Dockerfile (as referenced in README)` - 3 edges

## Surprising Connections (you probably didn't know these)
- `zot.devidence.dev/languagetool image` --semantically_similar_to--> `devidence-languagetool:${LT_VERSION} image`  [INFERRED] [semantically similar]
  .github/workflows/deploy.yml → docker-compose.yml
- `lt_version workflow_dispatch input` --shares_data_with--> `LT_VERSION build arg (default 6.7)`  [INFERRED]
  .github/workflows/deploy.yml → docker-compose.yml
- `kubernetes/internal-apps/languagetool/values.yaml` --shares_data_with--> `LT_VERSION build arg (default 6.7)`  [INFERRED]
  .github/workflows/deploy.yml → docker-compose.yml
- `LT_VERSION build arg (default 6.7)` --shares_data_with--> `LT_VERSION variable (README config)`  [INFERRED]
  docker-compose.yml → README.md
- `devidence-languagetool:${LT_VERSION} image` --shares_data_with--> `devidence-languagetool image (as referenced in README)`  [INFERRED]
  docker-compose.yml → README.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Local Docker Compose Deployment Pattern** — readme, docker_compose_languagetool_service, docker_compose_override_languagetool_service, docker_compose_dockerfile_build [INFERRED 0.75]
- **CI/CD Release Pipeline to Homelab Kubernetes** — github_workflows_deploy_build_job, github_workflows_deploy_deploy_job, github_workflows_deploy_zot_registry, github_workflows_deploy_homelab_repo [EXTRACTED 1.00]
- **LT_VERSION Propagation Across Build, Compose, and Deployment** — github_workflows_deploy_lt_version_input, docker_compose_lt_version_arg, readme_lt_version, github_workflows_deploy_languagetool_values_yaml [INFERRED 0.85]

## Communities (5 total, 0 thin omitted)

### Community 0 - "CI/CD Deploy Pipeline"
Cohesion: 0.32
Nodes (8): actions/checkout@v4, build job (Build & Push image), deploy job (Deploy to production), HOMELAB_DEPLOY_TOKEN secret, devidence-dev/homelab repository, lt_version workflow_dispatch input, Build and Deploy Workflow, Zot registry (zot.devidence.dev)

### Community 1 - "README Documentation Map"
Cohesion: 0.38
Nodes (7): Dockerfile build context (context: ., dockerfile: Dockerfile), README.md (LanguageTool Docker), devidence-languagetool image (as referenced in README), docker-compose.yml (as referenced in README), Dockerfile (as referenced in README), .env.example, server.properties

### Community 2 - "LT_VERSION Propagation"
Cohesion: 0.40
Nodes (5): devidence-languagetool:${LT_VERSION} image, LT_VERSION build arg (default 6.7), kubernetes/internal-apps/languagetool/values.yaml, zot.devidence.dev/languagetool image, LT_VERSION variable (README config)

### Community 3 - "Compose Service Config"
Cohesion: 0.50
Nodes (4): languagetool service (docker-compose.yml), deploy.resources.limits (1.0 CPU / 768M memory), TZ environment variable (default UTC), TZ variable (README config)

### Community 4 - "Ingress Network Overrides"
Cohesion: 0.50
Nodes (4): caddy-net network (commented alternative), cloudflared-net external network, languagetool service (docker-compose.override.yml), nginx-reverse-proxy network (commented alternative)

## Ambiguous Edges - Review These
- `languagetool service (docker-compose.override.yml)` → `caddy-net network (commented alternative)`  [AMBIGUOUS]
  docker-compose.override.yml · relation: references
- `languagetool service (docker-compose.override.yml)` → `nginx-reverse-proxy network (commented alternative)`  [AMBIGUOUS]
  docker-compose.override.yml · relation: references

## Knowledge Gaps
- **10 isolated node(s):** `Zot registry (zot.devidence.dev)`, `HOMELAB_DEPLOY_TOKEN secret`, `devidence-dev/homelab repository`, `actions/checkout@v4`, `server.properties` (+5 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `languagetool service (docker-compose.override.yml)` and `caddy-net network (commented alternative)`?**
  _Edge tagged AMBIGUOUS (relation: references) - confidence is low._
- **What is the exact relationship between `languagetool service (docker-compose.override.yml)` and `nginx-reverse-proxy network (commented alternative)`?**
  _Edge tagged AMBIGUOUS (relation: references) - confidence is low._
- **Why does `languagetool service (docker-compose.yml)` connect `Compose Service Config` to `README Documentation Map`, `LT_VERSION Propagation`, `Ingress Network Overrides`?**
  _High betweenness centrality (0.424) - this node is a cross-community bridge._
- **Why does `LT_VERSION build arg (default 6.7)` connect `LT_VERSION Propagation` to `CI/CD Deploy Pipeline`, `README Documentation Map`, `Compose Service Config`?**
  _High betweenness centrality (0.380) - this node is a cross-community bridge._
- **Why does `languagetool service (docker-compose.override.yml)` connect `Ingress Network Overrides` to `Compose Service Config`?**
  _High betweenness centrality (0.214) - this node is a cross-community bridge._
- **Are the 3 inferred relationships involving `LT_VERSION build arg (default 6.7)` (e.g. with `LT_VERSION variable (README config)` and `kubernetes/internal-apps/languagetool/values.yaml`) actually correct?**
  _`LT_VERSION build arg (default 6.7)` has 3 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Zot registry (zot.devidence.dev)`, `HOMELAB_DEPLOY_TOKEN secret`, `devidence-dev/homelab repository` to the rest of the system?**
  _10 weakly-connected nodes found - possible documentation gaps or missing edges._