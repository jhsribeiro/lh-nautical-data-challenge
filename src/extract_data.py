import pandas as pd
import json
from pathlib import path

# Carregamento dos dados
def extract_data():
    vendas = pd.read_csv('datasets/vendas_2023_2024.csv')
    produtos = pd.read_csv('datasets/produtos.csv')
    
    with open('datasets/clientes_crm.json', 'r', encoding='utf-8') as f:
        clientes_crm = pd.DataFrame(json.load(f))

    with open('datasets/custos_importacao.json', 'r', encoding='utf-8') as f:
        custos_importacao = pd.DataFrame(json.load(f))

    return vendas, produtos, clientes_crm, custos_importacao

def clean_data(df):
    # Remove o R$ e converte para float
    df[price] = df[price].str.replace('R$', '', regex=False).astype(float)

    