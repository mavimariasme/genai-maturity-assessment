# Templates Mermaid dos Artefatos Visuais (Passo 8)

Mermaid é o **formato padrão** de todo diagrama do relatório. Gere os blocos inline (```` ```mermaid ````) preenchidos com os dados reais. Os exemplos abaixo usam o perfil do `example-report.md` (Dados 42,5% / Org 48,3% / Técnica 36,67%) — substitua pelos valores do diagnóstico em questão.

> Compatibilidade: `radar-beta`, `quadrantChart`, `flowchart`, `timeline` e `gantt` exigem Mermaid ≥ 11.6. Se o ambiente de renderização for mais antigo, há fallbacks indicados em cada seção.

---

## 1. Maturidade por eixo — gráfico de barras (PADRÃO)

Use **gráfico de barras**, não radar. É muito mais legível: cada eixo vira uma barra de 0 a 5, com uma linha de referência no nível-alvo. Radar com 2 curvas sobrepostas e 7 eixos abreviados fica ilegível — evite.

```mermaid
xychart-beta
  title "Maturidade por Eixo (0 a 5) — barras = atual, linha = alvo (3)"
  x-axis ["Dados", "Estrategia", "Governanca", "Cultura", "IA Interna", "IA Externa", "Operacoes"]
  y-axis "Nivel de maturidade" 0 --> 5
  bar [2.1, 2.3, 2.7, 2.3, 1.7, 2.0, 1.8]
  line [3, 3, 3, 3, 3, 3, 3]
```

- As barras mostram o nível atual de cada eixo; a linha horizontal é o alvo do horizonte médio (nível 3).
- Sempre acompanhe o gráfico de uma legenda em texto explicando "barras = situação atual, linha = meta de 6 meses".
- Os rótulos do eixo X usam os nomes curtos do glossário (`dimension-names.md`).
- **Fallback (Mermaid < 11):** tabela de eixos com barras textuais `█/░`.

> Se o usuário pedir explicitamente um radar, use o template abaixo — mas com **uma única curva** (atual), nunca duas sobrepostas, e com legenda clara.
>
> ```mermaid
> radar-beta
>   title Maturidade por Eixo (0 a 5)
>   axis a["Dados"], b["Estrategia"], c["Governanca"], d["Cultura"], e["IA Interna"], f["IA Externa"], g["Operacoes"]
>   curve atual["Nivel atual"]{2.1, 2.3, 2.7, 2.3, 1.7, 2.0, 1.8}
>   max 5
>   min 0
> ```

---

## 2. Matriz de Prioridade (Impacto × Esforço)

```mermaid
quadrantChart
  title Matriz de Prioridade — Impacto x Esforco
  x-axis "Baixo Esforco" --> "Alto Esforco"
  y-axis "Baixo Impacto" --> "Alto Impacto"
  quadrant-1 "Apostas Estrategicas"
  quadrant-2 "Quick Wins"
  quadrant-3 "Incrementais"
  quadrant-4 "Evitar agora"
  "Tags de custo": [0.1, 0.55]
  "Quick piloto": [0.2, 0.85]
  "Kiro + AI-DLC": [0.25, 0.82]
  "Estrategia v0 + sponsor": [0.2, 0.9]
  "POC de RAG": [0.45, 0.8]
  "Observabilidade base": [0.55, 0.85]
  "Governanca de dados": [0.6, 0.82]
  "AI Leader + squad": [0.6, 0.9]
  "Portfolio + metricas": [0.62, 0.84]
  "Blueprint RAG externo": [0.65, 0.8]
  "CoE enxuto": [0.6, 0.78]
  "Frontier agents": [0.7, 0.8]
  "Model routing": [0.3, 0.4]
  "Fine-tuning": [0.85, 0.25]
  "AgentCore clientes": [0.9, 0.45]
  "Gateway proprio": [0.85, 0.2]
```

- Eixo X = esforço (0 = baixo, 1 = alto). Eixo Y = impacto (0 = baixo, 1 = alto).
- Atenção: no `quadrantChart`, quadrant-1 = canto superior direito, quadrant-2 = superior esquerdo, quadrant-3 = inferior esquerdo, quadrant-4 = inferior direito. Ajuste os rótulos como acima.
- **Fallback:** a tabela da matriz em `priority-matrix.md`.

---

## 3. Árvore de Decisão

```mermaid
flowchart TD
  A{"As 3 surveys<br/>respondidas?"} -->|Nao| Z["Pare. Rode a analise<br/>individual disponivel"]
  A -->|Sim| B{"Dados sustentam IA?<br/>D2,D4,D6 >= 3"}
  B -->|Nao + execucao alta| C["DADOS-GARGALO<br/>Congelar use cases<br/>Investir em D1,D2,D4,D6"]
  B -->|Nao + execucao baixa| D["Catalogo fontes-chave<br/>+ politica de dados<br/>+ Guardrails PII"]
  B -->|Sim| E{"Patrocinio e direcao?<br/>O1,O2,O9 >= 3"}
  E -->|Nao + tecnica alta| F["CAPACIDADE ORFA<br/>ROI interno -> sponsor<br/>+ AI Leader"]
  E -->|Nao + tudo baixo| G["EQUILIBRADO BAIXO<br/>Sponsor + estrategia v0<br/>+ 1 caminho oficial"]
  E -->|Sim| H{"Execucao chega<br/>a producao?<br/>T4,T5,T9 >= 3"}
  H -->|Nao| I["EXECUCAO-GARGALO<br/>Parceiro Premier<br/>+ plataforma minima<br/>+ observabilidade"]
  H -->|Sim| J{"Consolidado?"}
  J -->|Media| K["INDUSTRIALIZAR<br/>Portfolio + CoE<br/>+ AI-DLC + frontier agents"]
  J -->|Alta| L["OTIMIZAR & INOVAR<br/>AI TRiSM + FinOps<br/>+ AgentCore + co-innovation"]
```

- Pode os ramos que não se aplicam ao perfil — destaque o caminho percorrido (ex: classe CSS `classDef destaque`).
- **Fallback:** o bloco ASCII de `decision-tree.md`.

---

## 4. Plano de Ação por Horizonte

```mermaid
timeline
  title Roadmap por Horizonte
  section Curto 0-90 dias
    Destravar e dar credibilidade : Sponsor + Estrategia v0 : Quick + Kiro/AI-DLC : Tags de custo + Guardrails PII : POC estruturada de RAG
  section Medio 3-6 meses
    Industrializar : AI Leader + squad : Observabilidade base : Governanca de dados + portfolio : Blueprint RAG + CoE
  section Longo 6-12+ meses
    Escalar com controle : Frontier agents para ops : AI Council + AI-DLC extensions : Cultura AI-first + ecossistema
```

- Alternativa com datas/dependências: usar `gantt` (útil quando o cliente quer cronograma).

```mermaid
gantt
  title Roadmap (Gantt)
  dateFormat YYYY-MM-DD
  axisFormat %b/%y
  section Curto
    Sponsor + Estrategia v0      :a1, 2026-01-01, 30d
    Quick + Kiro/AI-DLC          :a2, 2026-01-01, 60d
    POC de RAG                   :a3, 2026-01-15, 75d
  section Medio
    AI Leader + squad            :b1, after a1, 60d
    Observabilidade base         :b2, after a2, 90d
    Blueprint RAG externo        :b3, after a3, 90d
  section Longo
    Frontier agents para ops     :c1, after b2, 120d
    AI Council                   :c2, after b1, 120d
```

- **Fallback:** lista por horizonte em texto.

---

## Exportar para PNG

Os diagramas vivem em Mermaid. Para entregar PNGs (ex: para colar em deck), use o script da skill — **somente quando o usuário pedir**.

```bash
# converte todos os blocos ```mermaid de um .md em PNGs:
.kiro/skills/genai-maturity-crossanalysis/scripts/mermaid-to-png.sh relatorio.md ./out

# converte um arquivo .mmd único:
.kiro/skills/genai-maturity-crossanalysis/scripts/mermaid-to-png.sh radar.mmd ./out
```

- O script usa `@mermaid-js/mermaid-cli` via `npx` (não precisa instalar global). Requer Node.js.
- Saída: um PNG por diagrama em `./out` (ex: `relatorio-1.png`, `relatorio-2.png`...).
- Se o usuário quiser fundo transparente ou escala maior, o script aceita flags (ver `--help`).
