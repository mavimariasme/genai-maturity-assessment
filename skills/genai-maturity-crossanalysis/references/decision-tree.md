# Árvore de Decisão (Passo 5)

A árvore leva o leitor do **perfil atual** à **primeira ação concreta**, na ordem correta de pré-requisitos. Use o template abaixo, podando os ramos que não se aplicam ao perfil identificado. Renderize em bloco de código no relatório.

A lógica segue a hierarquia: **Dados é pré-requisito → Patrocínio direciona → Execução entrega**. Por isso a árvore sempre verifica fundação de dados antes de execução técnica, e patrocínio antes de escalar.

---

## Template completo

```
INÍCIO: As 3 surveys estão respondidas?
│
├─ NÃO → Pare. Análise cruzada exige as 3. Rode a individual disponível.
│
└─ SIM
   │
   ├─ Os dados sustentam IA com confiança? (S1 — D2,D4,D6 ≥ 3?)
   │  │
   │  ├─ NÃO ─ e a execução técnica está avançada? (S3 alto?)
   │  │        │
   │  │        ├─ SIM → 🔴 DADOS-GARGALO
   │  │        │        Ação #1: CONGELAR novos use cases externos.
   │  │        │        Investir em catálogo (D1), qualidade (D2),
   │  │        │        governança (D4) e estratégia RAG (D6).
   │  │        │        Destravar interno com Quick Index + RAG controlado.
   │  │        │
   │  │        └─ NÃO → Fundação ampla ausente.
   │  │                 Ação #1: catálogo das 2-3 fontes-chave +
   │  │                 política de dados de 1 página + Guardrails PII.
   │  │
   │  └─ SIM → dados ok, seguir para patrocínio ↓
   │
   ├─ Existe patrocínio e direção? (S2 — O1,O2,O9 ≥ 3?)
   │  │
   │  ├─ NÃO ─ e a capacidade técnica existe? (S3 médio/alto?)
   │  │        │
   │  │        ├─ SIM → 🟠 CAPACIDADE ÓRFÃ / ORGANIZAÇÃO-GARGALO
   │  │        │        Ação #1: capturar ROI interno (Quick/Kiro/AI-DLC)
   │  │        │        como argumento → nomear sponsor + AI Leader →
   │  │        │        estratégia v0 + governança mínima.
   │  │        │
   │  │        └─ NÃO → 🔴 EQUILIBRADO BAIXO
   │  │                 Ação #1: coluna vertebral — sponsor formal +
   │  │                 estratégia v0 + 1 caminho técnico oficial.
   │  │
   │  └─ SIM → patrocínio ok, seguir para execução ↓
   │
   ├─ A execução leva à produção? (S3 — T4,T5,T9 ≥ 3?)
   │  │
   │  ├─ NÃO → 🟡 EXECUÇÃO-GARGALO
   │  │        Ação #1: parceiro AWS Premier + plataforma mínima viável.
   │  │        Interno primeiro (Quick + Kiro + AI-DLC), depois
   │  │        blueprint único de RAG para externo. Observabilidade base.
   │  │
   │  └─ SIM → tudo alinhado, seguir para maturidade ↓
   │
   └─ Em que faixa está o consolidado?
      │
      ├─ MÉDIA (36-65%) → 🟡 INDUSTRIALIZAR
      │   Portfólio gerenciado + métricas duais + CoE +
      │   AI-DLC com extensions + frontier agents para ops.
      │
      └─ ALTA (≥66%) → 🟢 OTIMIZAR & INOVAR
          AI TRiSM + FinOps por unit economics + AgentCore +
          agents cross-system + co-innovation/open-source.
```

---

## Adaptação por perfil

- Para perfis **Equilibrados**, a árvore vira praticamente linear — destaque o ramo que se aplica e suprima os demais.
- Para perfis **Gargalo**, enfatize o nó onde a organização "trava" e mostre que os ramos seguintes só abrem após resolver o gargalo.
- Sempre termine a árvore apontando para a **primeira ação dos próximos 30 dias**, conectando com o plano por horizonte.
