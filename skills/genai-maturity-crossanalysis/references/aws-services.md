# Catálogo de Serviços e Recomendações AWS (Passos 4–6)

Use este catálogo para ancorar as recomendações. Mapeado por **survey × faixa de maturidade**. Não invente serviços fora desta lista — se algo não estiver aqui, sinalize que precisa de validação com o time de conta AWS.

> Regra de uso: a recomendação cita o serviço **a serviço do gap**, nunca o contrário. Primeiro o problema (dimensão/eixo), depois o serviço que o resolve.

---

## Survey 1 — Dados

### Baixa (≤35%) — Fundamentar
- **AWS Glue Data Catalog + Crawlers** — inventário e auto-descoberta (D1).
- **Amazon S3 + AWS Lake Formation** — data lake com governança básica e acesso fine-grained (D1, D4).
- **Amazon Macie** — descoberta de PII (D4).
- **AWS Glue Data Quality** — regras de completude/freshness (D2).
- **Amazon Bedrock Knowledge Bases** — POC de RAG sobre 1 fonte controlada (D6).
- **Amazon Bedrock Guardrails** — redação de PII desde o dia 1 (D4).
- **Amazon Athena** — exploração ad hoc (D1).

### Média (36–65%) — Preparar para IA
- **Amazon Textract / Transcribe / Comprehend / Rekognition** — dados não-estruturados (D3).
- **Amazon Bedrock Knowledge Bases + OpenSearch Serverless / S3 Vectors / Aurora pgvector** — RAG em produção (D3, D6).
- **Amazon SageMaker Lineage / Clarify** — versionamento e viés (D7, D2).
- **Amazon DataZone** — compartilhamento governado (D8).
- **AWS CloudTrail** — auditoria de uso (D4).
- **Amazon Kinesis / MSK / Glue Streaming** — ingestão real-time (D5).

### Alta (≥66%) — Escalar e Otimizar
- **Amazon SageMaker Feature Store + Pipelines + Ground Truth** — features, orquestração, labeling (D5, D6, D7).
- **AWS Step Functions + EventBridge** — feedback loops automatizados (D5).
- **S3 Intelligent-Tiering + Cost Explorer** — otimização de custo (FinOps de dados).
- **Amazon DataZone (org-wide) + contratos de dados** — data mesh (D8).

---

## Survey 2 — Organizacional

### Baixa (≤35%) — Fundação Estratégica
- **AWS Skill Builder (Generative AI Learning Plan)** — AI literacy (O7).
- **Amazon Quick Business / Quick Developer** — quick wins de produtividade (O8, alinhado a T1).
- **AWS Generative AI Innovation Center** — workshops de ideação e awareness (O1, O4).
- **AWS Audit Manager + Organizations + CloudTrail** — governança e auditoria iniciais (O5).
- **AWS Cost Explorer + Budgets** — tracking desde o dia 1 (O3).
- **AWS Partner Network (Premier/Advanced GenAI)** — acelerar 1º caso (O12).

### Média (36–65%) — Estruturar e Governar
- **Amazon Bedrock Guardrails (+ IAM enforcement cross-account)** — responsible AI técnico (O5).
- **AWS Audit Manager (GenAI Framework) + AWS Config** — compliance contínuo (O11).
- **AWS Well-Architected Tool (ML Lens) + Service Catalog** — portfólio e templates aprovados (O4).
- **Amazon Bedrock Model Evaluation + SageMaker Clarify** — qualidade e viés (O6).
- **CloudWatch + Bedrock Model Invocation Logging + Cost Explorer (tags)** — métricas e ROI (O6).
- **AI-DLC com extensions blocking (security-baseline, resiliency-baseline)** — policy-as-code para o SDLC; o council aprova extensions, não cada PR (O5).

### Alta (≥66%) — Otimizar e Inovar
- **Cost Anomaly Detection + Bedrock Provisioned Throughput / Batch Inference + Savings Plans** — FinOps para IA (O3).
- **AWS Control Tower + Organizations (delegated admin)** — governance at scale (O5).
- **Amazon Bedrock Agents / AgentCore / Flows / Prompt Management** — inovação contínua (O4).
- **Amazon Quick (org-wide) + Quick Apps** — democratização (O7, O8).
- **Contribuição open-source ao AI-DLC** — ecossistema (O12).

---

## Survey 3 — Técnica

### Baixa (≤35%) — Primeiros Passos
- **Amazon Bedrock + Playground** — acesso a FMs sem infra (T4).
- **Conta AWS dedicada + VPC + IAM Identity Center + VPC Endpoints** — ambiente seguro (T5, T7).
- **Amazon Bedrock Guardrails + CloudTrail + CloudWatch Logs** — segurança e logging básicos (T7, T9).
- **Amazon Bedrock Knowledge Bases** — RAG sem código de infra (T4).
- **Amazon Quick Free/Plus** — produtividade interna (T1).
- **Kiro + AI-DLC (out-of-the-box)** — engenharia padronizada (T2).
- **Cost allocation tags** — base de FinOps (T13).

### Média (36–65%) — Produtizar e Operar
- **Amazon SageMaker Pipelines + CodePipeline/CodeBuild** — CI/CD e FMOps (T6).
- **Amazon Bedrock Prompt Management + Model Evaluation** — prompt registry e eval (T6, T8).
- **Amazon Bedrock Inference Profiles** — routing entre modelos (T12).
- **AWS WAF + Secrets Manager + Inspector** — segurança avançada (T7).
- **CloudWatch + X-Ray + Application Signals** — observabilidade (T9).
- **AWS CDK / Service Catalog / Bedrock Flows / ECR** — componentes reutilizáveis (T11).
- **AWS Security Agent (GA abr/2026)** — pen testing contínuo (T3, T7) — requer T7 ≥ 3.
- **AWS DevOps Agent (GA abr/2026)** — SRE assistant multicloud (T3, T9) — requer T9 ≥ 3.
- **AWS FinOps Agent (preview jun/2026)** — anomalias de custo (T3, T13) — requer T5/T13 ≥ 3.
- **CoE enxuto (4-6 pessoas)** — modelo operacional (T10).

### Alta (≥66%) — Escalar como Plataforma
- **Amazon SageMaker Unified Studio** — plataforma unificada (T5).
- **Amazon Bedrock AgentCore (Runtime + Gateway + Memory + Identity + Cedar)** — agents enterprise (T4, T11).
- **Amazon Bedrock Multi-Agent Collaboration + MCP/A2A** — agents cross-system (T12).
- **Bedrock Provisioned Throughput / Batch / Intelligent Prompt Routing / Cross-Region + semantic caching** — otimização (T12, T13).
- **CloudWatch Application Signals + Managed Grafana + DevOps Guru** — observabilidade avançada (T9).
- **AI-DLC como base do IDP + AIDLC Evaluator no CI + Design Reviewer** — golden paths (T2, T6, T8).

---

## Os três frontier agents — quando adotar

| Agent | Status | Pré-requisito | Papel |
|-------|--------|---------------|-------|
| AWS Security Agent | GA (abr/2026) | T7 ≥ 3 | Pen testing automatizado contínuo no SDLC |
| AWS DevOps Agent | GA (abr/2026) | T9 ≥ 3 | SRE assistant (AWS/multicloud/on-prem), root cause |
| AWS FinOps Agent | Preview (jun/2026) | T5 ≥ 3 e T13 ≥ 3 | Cost Explorer + Budgets + Compute Optimizer em Slack/Jira |

Os três rodam sobre Bedrock AgentCore — adotá-los é ensaio de operação para depois construir agents próprios (risk-controlled learning).

---

## AI-DLC — padrão de adoção

| Fase | Ação | Esforço | Pré-requisito |
|------|------|---------|---------------|
| Adoção zero | Instalar no Kiro do piloto, rodar `Using AI-DLC, ...` | ~1h | Kiro em uso |
| Tática (Média) | Ativar security-baseline + resiliency-baseline, oficializar no CoE | ~1 sprint | CoE existente |
| Customização (Média→Alta) | 1-2 extensions próprias + AIDLC Evaluator no CI | ~1-2 meses | Padrões formalizados |
| Plataforma (Alta) | Base do golden path no IDP + Design Reviewer + upstream | Contínuo | IDP em construção |

Repositório: `awslabs/aidlc-workflows`. Funciona em Kiro, Cursor, Cline, Claude Code, Codex, GitHub Copilot.
