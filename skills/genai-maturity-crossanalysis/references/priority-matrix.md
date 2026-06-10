# Matriz de Prioridade Impacto × Esforço (Passo 4)

Toda ação candidata é posicionada em **Impacto** (alto/médio/baixo) × **Esforço** (alto/médio/baixo), respeitando **pré-requisitos** e **sequenciamento**. A matriz não é uma lista de desejos — é um plano ordenado por alavancagem real.

---

## Os quatro quadrantes

```
                 IMPACTO ALTO              IMPACTO BAIXO
              ┌──────────────────────┬──────────────────────┐
  ESFORÇO     │   QUICK WINS          │   INCREMENTAIS        │
  BAIXO       │   (fazer já)          │   (encaixar quando    │
              │                       │    sobrar capacidade) │
              ├──────────────────────┼──────────────────────┤
  ESFORÇO     │   APOSTAS             │   EVITAR AGORA        │
  ALTO        │   ESTRATÉGICAS        │   (prematuro ou       │
              │   (planejar e         │    baixo retorno)     │
              │    sequenciar)        │                       │
              └──────────────────────┴──────────────────────┘
```

- **Quick Wins:** executar imediatamente (0–90 dias). São o combustível de credibilidade.
- **Apostas Estratégicas:** alto valor, exigem planejamento e pré-requisitos — entram no médio/longo prazo.
- **Incrementais:** valor localizado, fazer quando houver folga.
- **Evitar Agora:** tentadoras mas prematuras para o perfil — listar com justificativa.

---

## Regras de sequenciamento (dependências)

Não posicione uma ação como "fazer já" se seus pré-requisitos não existem. Cadeia de dependências:

| Ação | Pré-requisito obrigatório |
|------|---------------------------|
| RAG externo em produção | D4 ≥ 3 (governança de dados) + T7 ≥ 3 (guardrails) |
| Fine-tuning | D6 ≥ 3 + avaliação estruturada (T8 ≥ 3) |
| Frontier agents (Security/DevOps) | T9 ≥ 3 (observabilidade) e T7 ≥ 3 (segurança) |
| FinOps Agent | T5 ≥ 3 + T13 ≥ 3 (cost attribution) |
| AgentCore / agents para clientes | Plataforma (T5 ≥ 4) + FMOps (T6 ≥ 3) + observabilidade (T9 ≥ 3) |
| Extensions próprias de AI-DLC | CoE existente (T10 ≥ 3) |
| Escalar Quick org-wide | IAM Identity Center configurado |
| AI Council formal | Pelo menos 1 use case real para governar |
| AI TRiSM / Cedar | Portfólio ativo + métricas estabelecidas |

**Regra de incremento:** nunca planeje saltar mais de 1 nível por dimensão por trimestre. Dimensão em 1 → alvo trimestral é 2, não 4. Exceção controlada: dimensão crítica em 1 pode receber "dois incrementos" no trimestre, mas com gate intermediário explícito (ex: D6 1→2 via POC estruturada, depois 2→3 com vector DB maduro — nunca 1→3 direto).

---

## Catálogo de ações por estágio (use como pool de candidatas)

### Quick Wins típicos (qualquer perfil que ainda não os tenha)
- **Cost allocation tags** obrigatórias (`use-case`, `team`, `environment`) — esforço muito baixo, destrava FinOps (T13).
- **Amazon Quick Free/Plus** em áreas piloto — ROI de produtividade em dias (T1).
- **Kiro + AI-DLC** instalado no time piloto (~1h) — padroniza engenharia (T2).
- **Estratégia v0** de 1 página com 3 use cases priorizados (O1).
- **Política de uso de dados em IA** de 1 página + Bedrock Guardrails para PII (D4, T7).
- **1 dataset de referência por use case** — planilha versionada (T8).

### Apostas Estratégicas típicas
- **AI Leader dedicado + squad multidisciplinar** (O9).
- **Portfólio gerenciado com scoring** e gate de produção (O4, O6).
- **Plataforma mínima viável** — Bedrock como hub, ambientes dev/staging/prod, observabilidade base (T5, T9).
- **Blueprint único de RAG** para externo (T4).
- **CoE enxuto (4-6 pessoas)** com mandato de padrões (T10).
- **Pipelines reutilizáveis para dados não-estruturados** — Textract + embeddings (D3).
- **Governança de dados para IA** — Lake Formation + Guardrails + CloudTrail (D4).

### Incrementais típicos
- Model routing simples (Claude reasoning / Nova throughput).
- Batch inference onde fizer sentido.
- Dashboards por use case.

### Evitar Agora (lista padrão por imaturidade)
- Plataforma própria de model gateway (Bedrock resolve).
- Fine-tuning sem avaliação estruturada (piora antes de melhorar).
- Agents autônomos para clientes com T9/T7 baixos (ingerenciável).
- Frontier agents antes da fundação operacional.
- Extensions customizadas de AI-DLC sem owner (vira dívida).
- Escalar Quick sem IAM Identity Center (cria shadow AI pior).

---

## Como renderizar a matriz no relatório

Tabela única com colunas: **Ação | Impacto | Esforço | Quadrante | Pré-requisitos | Dimensões | Horizonte**. Ordene por quadrante (Quick Wins → Apostas → Incrementais → Evitar). Cada linha deve ser rastreável a um gap identificado no Passo 3.
