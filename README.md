# Projeto de Análise de Vendas com SQL + Power BI – Setor Industrial

## 1. Introdução
Este projeto simula um **case de Análise de Vendas** para a empresa fictícia **AgroVita Alimentos**, atuante no setor agroindustrial.  

O objetivo é explorar e tratar dados transacionais em **SQL Server** e construir um **dashboard em Power BI** que auxilie a gestão comercial a responder perguntas de negócio relevantes, como clientes mais rentáveis, sazonalidade das vendas e desempenho da equipe de vendas.  

Neste repositório você encontrará:  
- Scripts SQL utilizados para exploração, sanity checks e tratamento dos dados;  
- Arquivo do Power BI com modelo dimensional e visualizações criadas; 
- Documentação do processo descrevendo objetivos, estrutura de dados, preparação e resultados obtidos.

## 2. Entendimento do Negócio

- **Setor:** Agroindústria (grãos, farinhas, óleos, rações).  
- **Objetivo geral:** Avaliar a performance comercial e margens da AgroVita Alimentos.  
- **Objetivos específicos:**  
  - Identificar os clientes mais estratégicos e sua contribuição para a receita.  
  - Avaliar a rentabilidade dos produtos e detectar vendas com margem negativa.  
  - Analisar sazonalidade nas vendas ao longo do ano.  
  - Comparar o desempenho de canais de venda (mercado interno vs. exportação).  
  - Monitorar o desempenho individual da equipe de vendas.  

### 2.1 Perguntas de Negócio

1. Quais clientes representam maior receita e qual a margem por segmento?  
2. Quais produtos têm maior volume de vendas e quais são menos rentáveis?  
3. Existe sazonalidade nas vendas (picos por mês/trimestre)?  
4. Qual vendedor tem melhor desempenho em receita e em volume?  
5. Qual a taxa de inatividade de clientes (90 dias sem compra);
6. Como está a divisão de vendas entre mercado interno e exportação?  
7. Qual o ticket médio por cliente?  
