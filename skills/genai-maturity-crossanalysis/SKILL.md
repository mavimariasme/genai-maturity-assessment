---
name: genai-maturity-crossanalysis
description: >-
  Cruza os resultados das três surveys de maturidade em IA Generativa (Dados,
  Organizacional/Estratégica e Capacidade Técnica) e produz um plano de ação
  consolidado com matriz de prioridade (impacto × esforço), árvore de decisão,
  guidelines por horizonte temporal e recomendações justificadas. Use quando o
  usuário fornecer os resultados/scores das 3 surveys (ou os 3 relatórios
  individuais) e pedir um diagnóstico cruzado, plano de ação, roadmap, matriz de
  priorização ou próximos passos integrados. Palavras-gatilho: "cruzar surveys",
  "análise cruzada", "plano de ação", "matriz de prioridade", "roadmap de
  maturidade", "diagnóstico consolidado GenAI".
---

# Análise Cruzada de Maturidade em IA Generativa

Esta skill transforma os resultados de **três avaliações independentes** em um **plano de ação integrado**. O valor não está em repetir o diagnóstico de cada survey, mas em encontrar os **padrões de desalinhamento** entre elas — porque é exatamente nesses desalinhamentos que mora o maior risco (e a maior alavanca) de uma jornada de GenAI.

> **Princípio central:** maturidade em IA não é linear nem soma de partes. Dados, Organização e Execução Técnica evoluem em velocidades diferentes, e o gargalo é sempre a dimensão mais atrasada — não a média. Um time técnico excelente construindo sobre dados ruins produz alucinação com confiança. Uma liderança ambiciosa sem execução produz frustração e ceticismo. **O cruzamento revela qual história a organização está vivendo.**

---

## Entradas esperadas

A skill funciona com qualquer um destes formatos de entrada:

1. **Scores por dimensão** (preferencial — permite análise cirúrgica):
   - Survey 1 — Dados: 8 valores (D1–D8), score máx. 40
   - Survey 2 — Organizacional: 12 valores (O1–O12), score máx. 60
   - Survey 3 — Técnica: 13 valores (T1–T13), score máx. 65 — aceitar "N/A" para dimensões não aplicáveis (ex: T6 MLOps), excluindo-as do denominador
2. **Os 3 relatórios individuais** já gerados (extrair scores e níveis deles).
3. **Apenas os percentuais consolidados** por survey (análise mais grossa — avisar que a precisão por dimensão fica limitada).

Se faltar alguma das 3 surveys, **pare e avise**: a análise cruzada exige as três. Ofereça rodar a análise individual da(s) disponível(is) enquanto isso.

---

## Fluxo de execução

Execute nesta ordem. Não pule etapas.

### Passo 1 — Normalizar e consolidar
- Calcule o % de cada survey: `(soma / máximo aplicável) × 100`.
- Calcule o % consolidado ponderado pelos pontos efetivamente avaliados (não pela média simples dos 3 percentuais — surveys têm pesos diferentes).
- Classifique cada survey e o consolidado pela escala oficial:

  | Faixa | Nível | Equivalente AWS | Equivalente Gartner |
  |-------|-------|-----------------|---------------------|
  | ≤35% | Baixa | Envision | Planning/Developing |
  | 36–50% | Média-Baixa | Experiment | Defined |
  | 51–65% | Média-Alta | Launch | Capable |
  | ≥66% | Alta | Scale | Leadership |

### Passo 2 — Identificar o padrão de desalinhamento
Compare os níveis das 3 surveys e classifique o perfil usando `references/cross-patterns.md`. Esse é o coração da skill — o padrão define a narrativa e a sequência de prioridades. Os arquétipos principais:

- **Equilibrado baixo / médio / alto** — todas no mesmo nível.
- **Dados-gargalo** — Dados ≥2 níveis abaixo das outras.
- **Execução-gargalo** — Técnica ≥2 níveis abaixo.
- **Organização-gargalo** — Organizacional ≥2 níveis abaixo.
- **Ambição sem fundação** — Organizacional alto, Dados/Técnica baixos.
- **Capacidade órfã** — Técnica alta, Organizacional baixo (engenharia capaz sem patrocínio).

### Passo 3 — Mapear gaps por dimensão (cross-cutting)
Reagrupe as 33 dimensões nos **7 eixos transversais** do radar para encontrar fraquezas que uma survey isolada não revela (ex: Governança aparece em O5, O11 e D4 ao mesmo tempo). Use `references/radar-axes.md`.

### Passo 4 — Montar a matriz de prioridade
Posicione cada ação candidata em **Impacto × Esforço**, aplicando as regras de sequenciamento e pré-requisitos de `references/priority-matrix.md`. Respeite dependências técnicas (ex: não recomendar frontier agents antes de observabilidade).

### Passo 5 — Construir a árvore de decisão
Gere a árvore que leva o leitor do perfil atual à primeira ação concreta, usando o template de `references/decision-tree.md`.

### Passo 6 — Justificar cada recomendação
Toda sugestão precisa responder: **por que agora, por que esta e não outra, e o que acontece se for ignorada**. Sem justificativa, a recomendação não entra no relatório.

### Passo 7 — Renderizar o relatório
Siga a estrutura de saída abaixo. Escreva em **Português do Brasil**, tom consultivo e direto.

### Passo 8 — Gerar os artefatos visuais (Mermaid por padrão)
Todo diagrama do relatório (radar, árvore de decisão, matriz de prioridade, roadmap) é gerado em **Mermaid** — é o formato padrão. Use os templates de `references/mermaid-templates.md`, preenchidos com os dados reais do diagnóstico.

- Incremente os diagramas **inline** no relatório, em blocos ```` ```mermaid ````.
- **Pergunte ao usuário** se ele quer exportar os diagramas em **PNG**. Só se ele confirmar, use o script `scripts/mermaid-to-png.sh` (instruções em `references/mermaid-templates.md` → seção "Exportar para PNG"). Não rode o script sem o usuário pedir.

---

## Regras de ouro (não violar)

1. **Nunca pule mais de um nível por dimensão por trimestre.** Saltar de 2 para 4 sem passar por 3 vira dívida técnica. Se uma dimensão está em 1, o alvo do trimestre é 2 — depois 3.
2. **A dimensão mais fraca manda na sequência.** O plano ataca o gargalo antes de otimizar o que já é forte.
3. **Interno antes de externo.** Produtividade interna (Quick, Kiro, AI-DLC) dá ROI rápido e baixo risco regulatório; use o aprendizado para destravar patrocínio e confiança antes de escalar IA voltada ao cliente.
4. **Respeite pré-requisitos técnicos.** Frontier agents pressupõem observabilidade (T9≥3) e segurança (T7≥3). RAG externo pressupõe dados governados (D4≥3). Não recomende o avançado sobre fundação ausente.
5. **Dados ruins + execução boa = pare.** Se S1 é baixo e S3 é alto, a recomendação #1 é **congelar novos use cases** e investir em fundação de dados. Alucinação garantida é pior que ausência.
6. **Justifique sempre.** Recomendação sem "por que agora / por que esta / custo de ignorar" não vai para o relatório.
7. **Não invente serviços.** Use o catálogo de `references/aws-services.md` e os guidelines originais. Se algo não estiver lá, diga que precisa validar com o time de conta AWS.
8. **Visual sempre em Mermaid.** Todo diagrama nasce em Mermaid inline. PNG é opcional e só sob pedido explícito do usuário, via o script da skill.

---

## Estrutura de saída do relatório

```
# Plano de Ação Cruzado — Maturidade em IA Generativa

## 📊 Painel Consolidado
- Tabela: cada survey (score bruto, máximo, %, nível) + consolidado
- Radar dos 7 eixos transversais → **diagrama Mermaid `radar-beta`**
- Barra visual do consolidado

## 🧭 Padrão Identificado
- Nome do arquétipo de desalinhamento + 1 parágrafo de diagnóstico
- A "história" que a organização está vivendo hoje
- O risco central do padrão se nada mudar

## 🔍 Gaps Críticos Cross-Cutting
- 3 a 5 gaps que só aparecem no cruzamento (não na survey isolada)
- Para cada um: dimensões envolvidas + por que o cruzamento o torna prioritário

## 🎯 Matriz de Prioridade (Impacto × Esforço)
- Tabela com quadrantes: Quick Wins | Apostas Estratégicas | Incrementais | Evitar agora
- Cada ação com dimensões impactadas, pré-requisitos e horizonte
- **Diagrama Mermaid `quadrantChart`** posicionando as ações

## 🌳 Árvore de Decisão
- Da situação atual à primeira ação concreta → **diagrama Mermaid `flowchart`**

## 🛣️ Plano de Ação por Horizonte
- Curto (0–90 dias) | Médio (3–6 meses) | Longo (6–12+ meses)
- Cada ação com: o quê, por quê (justificativa), dimensão-alvo, sinal de progresso
- **Diagrama Mermaid `timeline`** (ou `gantt`) com os três horizontes

## 📋 Guidelines de Execução
- Regras práticas para o cliente conduzir a jornada (sequência, gates, anti-padrões)

## 🚫 O Que Evitar Agora
- Iniciativas tentadoras mas prematuras para este perfil + por quê

## 🏁 Conclusão
- Síntese da maior alavanca disponível + próximo milestone que muda o nível

## 🖼️ Exportar Diagramas (opcional)
- Ofereça exportar os diagramas Mermaid em PNG via `scripts/mermaid-to-png.sh`.
- Só execute se o usuário confirmar.
```

---

## Arquivos de referência

Carregue sob demanda conforme o passo:

- `references/cross-patterns.md` — arquétipos de desalinhamento e o que fazer em cada (Passo 2).
- `references/radar-axes.md` — os 7 eixos transversais e como mapear as 33 dimensões (Passo 3).
- `references/priority-matrix.md` — regras da matriz impacto×esforço, dependências e sequenciamento (Passo 4).
- `references/decision-tree.md` — template da árvore de decisão (Passo 5).
- `references/aws-services.md` — catálogo de serviços/recomendações por faixa e dimensão (Passos 4–6).
- `references/mermaid-templates.md` — templates Mermaid de todos os diagramas + como exportar PNG (Passo 8).
- `references/example-report.md` — exemplo completo de saída para calibrar tom e profundidade.
- `scripts/mermaid-to-png.sh` — converte diagramas Mermaid (.md ou .mmd) em PNG. Rodar só sob pedido do usuário.
