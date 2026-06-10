# Eixos Transversais do Radar (Passo 3)

As 33 dimensões das 3 surveys se reagrupam em **7 eixos transversais**. O cruzamento revela fraquezas que nenhuma survey isolada mostra — por exemplo, Governança parece "ok" em O5 mas desaba quando se soma D4 (governança de dados) e O11 (compliance).

Para cada eixo: calcule a **média das dimensões que o compõem** (normalizada 1–5) e sinalize quando há **dispersão alta** entre as dimensões do mesmo eixo (um componente forte mascarando um fraco).

---

## Os 7 eixos

### 1. Dados (fundação)
- **Compõem:** D1, D2, D3, D4, D5, D6, D7, D8 (média de toda a Survey 1)
- **Lê-se como:** quão pronta a base de dados está para alimentar IA com confiança.
- **Alerta de cruzamento:** se este eixo está ≥2 abaixo de "IA Externa", risco de alucinação.

### 2. Estratégia & Liderança
- **Compõem:** O1 (estratégia), O2 (sponsorship), O3 (funding), O9 (liderança dedicada)
- **Lê-se como:** existe direção, mandato e dinheiro para sustentar a jornada.
- **Alerta:** alto aqui com Dados/Execução baixos = "Ambição sem Fundação".

### 3. Governança & Compliance
- **Compõem:** O5 (governança IA), O11 (compliance), D4 (governança de dados)
- **Lê-se como:** a organização consegue escalar sem criar risco regulatório/reputacional.
- **Alerta:** o componente mais fraco define o teto real — governança é tão forte quanto seu elo mais frágil.

### 4. Cultura & Pessoas
- **Compõem:** O7 (AI literacy), O8 (confiança), O10 (change management)
- **Lê-se como:** as pessoas confiam, entendem e absorvem a mudança.
- **Alerta:** cultura baixa com técnica alta = adoção fraca apesar de boas ferramentas.

### 5. IA Interna (produtividade & ops)
- **Compõem:** T1 (produtividade geral), T2 (engenharia/AI-DLC), T3 (ops de TI)
- **Lê-se como:** a casa usa IA para si — ROI rápido, baixo risco regulatório.
- **Alerta:** baixo aqui significa que a organização não capturou os ganhos fáceis antes de mirar o externo.

### 6. IA Externa (produtos & clientes)
- **Compõem:** T4 (apps para clientes), T5 (plataforma), T6 (MLOps/FMOps), T8 (avaliação)
- **Lê-se como:** maturidade de construir IA que chega ao cliente final.
- **Alerta:** alto aqui sobre Dados baixo = a fragilidade vai aparecer no cliente.

### 7. Operações & Escala
- **Compõem:** T7 (segurança IA), T9 (observabilidade), T10 (modelo operacional), T11 (reuso/velocidade), T12 (escalabilidade), T13 (FinOps)
- **Lê-se como:** a IA em produção é segura, observável, escalável e com custo sob controle.
- **Alerta:** observabilidade (T9) e segurança (T7) baixas bloqueiam frontier agents e qualquer deploy externo responsável.

---

## Como usar no relatório

1. Apresente os 7 eixos com score médio e nível (texto, já que é markdown — não há gráfico).
2. Destaque os **2-3 eixos mais fracos** como foco.
3. Sinalize **dispersões internas**: ex. "Governança & Compliance aparenta 3/5, mas D4=1 puxa o teto real para baixo — o elo mais fraco define o risco".
4. Conecte cada eixo fraco ao arquétipo identificado no Passo 2.

## Tabela de mapeamento rápido

| Eixo | Dimensões | Survey(s) |
|------|-----------|-----------|
| Dados | D1–D8 | S1 |
| Estratégia & Liderança | O1, O2, O3, O9 | S2 |
| Governança & Compliance | O5, O11, D4 | S2 + S1 |
| Cultura & Pessoas | O7, O8, O10 | S2 |
| IA Interna | T1, T2, T3 | S3 |
| IA Externa | T4, T5, T6, T8 | S3 |
| Operações & Escala | T7, T9, T10, T11, T12, T13 | S3 |
