# ⚓ Desafio Técnico Indicium: LH Nautical

[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://www.python.org/)
[![Jupyter Notebook](https://img.shields.io/badge/Jupyter-F37626.svg?style=flat&logo=Jupyter&logoColor=white)](https://jupyter.org/)
[![Pandas](https://img.shields.io/badge/Pandas-150458.svg?style=flat&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-013243.svg?style=flat&logo=numpy&logoColor=white)](https://numpy.org/)
[![Scikit-Learn](https://img.shields.io/badge/scikit--learn-F7931E.svg?style=flat&logo=scikit-learn&logoColor=white)](https://scikit-learn.org/)
[![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c.svg?style=flat&logo=matplotlib&logoColor=white)](https://matplotlib.org/)

## 📖 Sobre o Projeto
Este repositório contém a solução desenvolvida para o Desafio Técnico da Indicium (Jornada de Dados da **LH Nautical**). 

A LH Nautical é uma varejista líder em peças e acessórios para embarcações que passou por um crescimento acelerado. O objetivo deste projeto é organizar o "caos dos dados" atual da empresa, atuando de ponta a ponta: desde a extração, limpeza e modelagem (Engenharia de Dados/SQL) até a previsão de demanda e sistemas de recomendação (Ciência de Dados).

## 🗂️ Estrutura do Repositório
O projeto está organizado da seguinte forma para refletir as etapas do desafio:

```text
lh-nautical-data-challenge/
│
├── datasets/
│   ├── raw/                # Dados originais (JSON de clientes/custos e CSVs brutos)
│   └── processed/          # Dados limpos, normalizados e integrados
│
├── notebooks/              # Jupyter Notebooks numerados por etapa do desafio
│   ├── Q1_eda_vendas.ipynb         # Análise exploratória de vendas
│   ├── Q2_eda_produtos.ipynb       # Limpeza e normalização de produtos
│   ├── Q3_custo.ipynb              # Análise de custos de importação
│   ├── Q4_dados_publicos.ipynb     # Integração com câmbio BCB
│   ├── Q5_analise_clientes.ipynb   # Segmentação de clientes
│   ├── Q6_dimensao_calendario.ipynb # Tratamento de sazonalidade
│   ├── Q7_previsao_demanda.ipynb   # Modelo de previsão (Time Series)
│   ├── Q8_recomendacao.ipynb       # Sistema de recomendação (Similaridade)
│   └── plots/                      # Visualizações geradas pelos notebooks
│
├── sql/                    # Queries SQL solicitadas no desafio
│   ├── Q1.sql                      # Exploração inicial
│   ├── Q4.sql                      # Consultas de câmbio
│   ├── Q5.sql                      # Consultas de clientes
│   └── Q6.sql                      # Criação da dimensão calendário
│
├── requirements.txt        # Bibliotecas necessárias (Pandas, Scikit-Learn, etc.)
└── README.md               # Documentação do projeto
```
## 🚀 Como Executar o Projeto

1. Clone o repositório:

```Bash
git clone https://github.com/jhsribeiro/lh-nautical-data-challenge.git
cd lh_nautical_desafio
```
2. Crie e ative um ambiente virtual (recomendado):

```Bash
python -m venv venv
venv\Scripts\activate  # No Linux/macOS: source venv/bin/activate 
```
3. Instale as dependências:

```Bash
pip install -r requirements.txt
```

4. Explore os Notebooks:
Os notebooks na pasta /notebooks seguem a ordem lógica do desafio, começando pela limpeza de dados (Q1/Q2) até as entregas de IA (Q7/Q8).


## 🎯 Principais Entregas

* Engenharia de Dados: Tratamento de JSONs aninhados e normalização de bases de produtos e vendas.
* Integração de APIs: Uso de dados públicos do Banco Central para análise de impacto cambial nos custos.
* Ciência de Dados: Previsão de demanda para motores específicos e motor de recomendação para cross-sell de acessórios.

Autor: Jhiovana Ribeiro
