# ⚓ Desafio Técnico Indicium: LH Nautical

[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://www.python.org/)
[![Jupyter Notebook](https://img.shields.io/badge/Jupyter-F37626.svg?style=flat&logo=Jupyter&logoColor=white)](https://jupyter.org/)
[![Pandas](https://img.shields.io/badge/Pandas-150458.svg?style=flat&logo=pandas&logoColor=white)](https://pandas.pydata.org/)

## 📖 Sobre o Projeto
Este repositório contém a solução desenvolvida para o Desafio Técnico da Indicium (Jornada de Dados da **LH Nautical**). 

A LH Nautical é uma varejista líder em peças e acessórios para embarcações que passou por um crescimento acelerado. O objetivo deste projeto é organizar o "caos dos dados" atual da empresa, atuando de ponta a ponta: desde a extração, limpeza e modelagem (Engenharia de Dados/SQL) até a análise de lucratividade, previsão de demanda e sistemas de recomendação (Ciência de Dados).

## 🗂️ Estrutura do Repositório

O projeto foi estruturado visando a modularidade, facilitando a manutenção e a clareza do raciocínio analítico:

```text
lh_nautical_desafio/
│
├── data/                   # Diretório para os datasets brutos e processados (não versionados no git)
│   ├── raw/                # Bases originais (.csv, .json)
│   └── processed/          # Bases limpas e tratadas
│
├── notebooks/              # Jupyter Notebooks com análises exploratórias e narrativas de negócio
│   ├── 01_EDA_Vendas.ipynb
│   └── 02_Analises_e_Graficos.ipynb
│
├── src/                    # Scripts Python modulares para processamento e IA
│   ├── data_processing.py  # Funções de limpeza (Q2 e Q3)
│   ├── predicao.py         # Modelo baseline de previsão (Q7)
│   └── recomendacao.py     # Sistema de similaridade de cosseno (Q8)
│
├── sql/                    # Scripts com as queries solicitadas
│   ├── q1_exploracao.sql
│   └── q6_dimensao_calendario.sql
│
├── requirements.txt        # Dependências do projeto
└── README.md               # Documentação principal
```

# 🚀 Como Executar o Projeto

1. Clone o repositório:

```Bash
git clone [https://github.com/seu-usuario/lh_nautical_desafio.git](https://github.com/seu-usuario/lh_nautical_desafio.git)

cd lh_nautical_desafio
```
2. Crie e ative um ambiente virtual (recomendado):

```Bash
python -m venv venv
source venv/bin/activate  # No Windows: venv\Scripts\activate
```
3. Instale as dependências:

```Bash
pip install -r requirements.txt
```

## 🎯 Principais Entregas
* Engenharia de Dados: Limpeza de JSON aninhado e normalização de categorias com Python; Criação de dimensão de calendário em SQL para tratamento de sazonalidade.
* Inteligência de Negócios: Cruzamento de cotações diárias de moedas (BRL vs USD) para identificar gargalos de prejuízo operacional. Segmentação de clientes "Elite".
* Ciência de Dados: Implementação de um modelo baseline para prever a demanda do "Motor de Popa Yamaha Evo Dash 155HP" validado via Mean Absolute Error (MAE), e um motor de recomendação usando Similaridade de Cosseno para cross-sell.

Autor: Jhiovana Ribeiro