# Arquétipos de Desalinhamento (Passo 2)

O padrão entre as 3 surveys define a narrativa e a sequência de prioridades. Identifique o arquétipo comparando os **níveis** (não os percentuais brutos) de S1 (Dados), S2 (Organizacional) e S3 (Técnica).

Convenção de nível: Baixa (≤35%) < Média-Baixa (36–50%) < Média-Alta (51–65%) < Alta (≥66%). "≥2 níveis abaixo" significa, por exemplo, Baixa vs. Média-Alta.

---

## Como classificar

1. Calcule o nível de cada survey.
2. Encontre a maior distância entre elas.
3. Se a maior distância for ≤1 nível → perfil **Equilibrado** (use a faixa).
4. Se uma survey está ≥2 níveis abaixo das outras duas → perfil **Gargalo** daquela dimensão.
5. Se uma está ≥2 níveis **acima** das outras → perfil de **descompasso** (ambição sem fundação / capacidade órfã).
6. Em empates ou casos híbridos, priorize sempre Dados como pré-requisito.

---

## Os arquétipos

### 1. Equilibrado Baixo (todas ≤35%)
- **História:** Organização no início real da jornada. Iniciativas dependem de heróis individuais.
- **Risco central:** Dispersão — energia em POCs sem dono, sem conexão com valor.
- **Sequência:** Coluna vertebral primeiro. Sponsor + estratégia v0 (S2) → fundação mínima de dados (S1: catálogo das 2-3 fontes-chave) → 1 caminho técnico oficial (S3: Quick + Kiro + Bedrock KB). Interno antes de externo, sempre.
- **Evitar:** múltiplos use cases paralelos, CAIO antes de provar valor, comitês de governança sem caso para governar, fine-tuning, agents autônomos.

### 2. Equilibrado Médio (todas 36–65%) — "Sweet spot LATAM"
- **História:** Despertou, tem fundações, mas opera por projeto e não por portfólio.
- **Risco central:** Cemitério de POCs — virar dívida técnica sem industrializar.
- **Sequência:** Industrializar em paralelo. Portfólio gerenciado + métricas duais + AI Leader (S2) → governança de dados + pipelines reutilizáveis para não-estruturado (S1) → observabilidade + CoE + AI-DLC com extensions + frontier agents para ops (S3).
- **Evitar:** plataforma própria de gateway, extensions customizadas antes do CoE, escalar Quick sem IAM Identity Center.

### 3. Equilibrado Alto (todas ≥66%)
- **História:** IA é parte do dia a dia. Múltiplos casos em produção.
- **Risco central:** Estagnação na vanguarda — perder vantagem por não otimizar TCO e não inovar.
- **Sequência:** Vantagem sustentada. AI TRiSM + FinOps por unit economics (S2) → data mesh + FMOps end-to-end (S1) → AgentCore + agents cross-system + co-innovation/open-source (S3).
- **Evitar:** complexidade sem ROI; reinventar o que a plataforma gerenciada já entrega.

### 4. Dados-Gargalo (S1 ≥2 níveis abaixo de S2 e S3)
- **História:** Negócio quer, engenharia sabe, mas os dados não sustentam.
- **Risco central:** **Alucinação garantida.** Quanto mais a execução avança sobre dados ruins, pior — o modelo erra com confiança aparente.
- **Ação #1 (inegociável):** **Congelar novos use cases externos.** Redirecionar investimento para catálogo (D1), qualidade (D2), governança para IA (D4) e estratégia de RAG (D6).
- **Destrave rápido:** use cases internos sobre fontes controladas (Quick Index + RAG sobre documentação) geram tração enquanto a fundação amadurece.

### 5. Execução-Gargalo (S3 ≥2 níveis abaixo de S1 e S2)
- **História:** Há visão e dados, mas a capacidade de levar à produção não acompanha.
- **Risco central:** ROI prometido evapora; liderança perde paciência; janela competitiva fecha.
- **Ação #1:** Acelerar plataforma mínima viável — parceiro AWS Premier para comprimir a curva. Comece pelo interno (Quick + Kiro + AI-DLC) para mostrar resultado em semanas, depois blueprint único de RAG para externo.

### 6. Organização-Gargalo (S2 ≥2 níveis abaixo de S1 e S3)
- **História:** Capacidade técnica e de dados existem, mas sem patrocínio, estratégia ou governança que as direcione.
- **Risco central:** Esforço subutilizado, shadow AI, iniciativas que morrem por falta de mandato.
- **Ação #1:** Usar os ROIs já gerados internamente como **argumento executivo** para nomear sponsor formal e AI Leader. Formalizar estratégia v0 e governança mínima antes de escalar.

### 7. Ambição sem Fundação (S2 alto, S1 e/ou S3 baixos)
- **História:** Liderança ambiciosa sobre base imatura.
- **Risco central:** Promessas ao board que a fundação não sustenta → ciclo de descrédito.
- **Ação #1:** Antes de escalar qualquer coisa, investir em fundação (dados e/ou execução). Recalibrar expectativas executivas com um roadmap honesto por horizonte.

### 8. Capacidade Órfã (S3 alto, S2 baixo)
- **História:** Engenharia capaz e entusiasta, sem patrocínio nem direção de negócio.
- **Risco central:** Talento técnico frustrado, retrabalho, decisões técnicas sem alinhamento de valor.
- **Ação #1:** Capturar e publicar os ROIs internos; nomear sponsor; conectar a capacidade técnica a 1-2 use cases com dono de negócio claro antes de expandir.

---

## Tabela-resumo de diagnóstico

| Padrão | Sinal | Recomendação-âncora |
|--------|-------|---------------------|
| Equilibrado Baixo | Tudo ≤35% | Coluna vertebral: sponsor + estratégia v0 + 1 caminho oficial |
| Equilibrado Médio | Tudo 36–65% | Industrializar: portfólio + métricas + CoE + AI-DLC |
| Equilibrado Alto | Tudo ≥66% | Otimizar TCO + agents + co-innovation |
| Dados-Gargalo | S1 muito < S2,S3 | **Congelar use cases; investir em dados** |
| Execução-Gargalo | S3 muito < S1,S2 | Parceiro Premier; plataforma mínima; interno primeiro |
| Organização-Gargalo | S2 muito < S1,S3 | ROI interno → sponsor + AI Leader + estratégia |
| Ambição sem Fundação | S2 alto, S1/S3 baixos | Fundação antes de escalar; recalibrar expectativas |
| Capacidade Órfã | S3 alto, S2 baixo | ROI interno como argumento; conectar a dono de negócio |
