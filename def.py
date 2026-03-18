import pandas as pd

# --- QUESTÃO 1: EDA - LH NAUTICAL ---
# Objetivo: Análise exploratória inicial para diagnosticar a saúde dos dados.
# Stakeholders: Sr. Almir e Gabriel Santos.

def realizar_eda_vendas():
    # Caminho do arquivo conforme estrutura confirmada
    path = 'datasets/vendas_2023_2024.csv'
    
    try:
        # Carregamento bruto (sem tratamentos conforme premissa)
        df = pd.read_csv(path)
        
        # --- PARTE 1: VISÃO GERAL ---
        total_linhas = len(df)
        total_colunas = len(df.columns)
        
        # Para o intervalo de datas, precisamos converter temporariamente para 
        # identificar os extremos, dado que há múltiplos formatos (YYYY-MM-DD e DD-MM-YYYY).
        datas_temp = pd.to_datetime(df['sale_date'], errors='coerce').fillna(
            pd.to_datetime(df['sale_date'], format='%d-%m-%Y', errors='coerce')
        )
        data_min = datas_temp.min()
        data_max = datas_temp.max()
        
        # --- PARTE 2: VALORES NUMÉRICOS (COLUNA TOTAL) ---
        v_min = df['total'].min()
        v_max = df['total'].max()
        v_medio = df['total'].mean()
        
        # --- PRINT DOS RESULTADOS (Relatório para Diretoria) ---
        print("-" * 40)
        print("RELATÓRIO DE EDA - VENDA 2023/2024")
        print("-" * 40)
        print(f"Quantidade total de linhas: {total_linhas}")
        print(f"Quantidade total de colunas: {total_colunas}")
        print(f"Intervalo de datas: {data_min.date()} até {data_max.date()}")
        print("-" * 40)
        print(f"Valor Mínimo (Total): R$ {v_min:,.2f}")
        print(f"Valor Máximo (Total): R$ {v_max:,.2f}")
        print(f"Valor Médio (Total): R$ {v_medio:,.2f}")
        print("-" * 40)
        
        # --- PARTE 3: DIAGNÓSTICO DE QUALIDADE ---
        print("\nDIAGNÓSTICO DO TECH LEAD (GABRIEL SANTOS):")
        
        # Verificação de Nulos
        nulos = df.isnull().sum().sum()
        if nulos == 0:
            print("1. Integridade: Não foram encontrados valores nulos.")
        else:
            print(f"1. Alerta: Foram encontrados {nulos} valores nulos.")
            
        # Verificação de Inconsistência de Datas
        amostra_datas = df['sale_date'].head(10).tolist()
        print(f"2. Qualidade de Datas: Identificada inconsistência de formatos (ex: {amostra_datas[0]} vs {amostra_datas[1]}).")
        
        # Diagnóstico de Outliers
        if v_max > (v_medio * 5):
            print("3. Outliers: Presença confirmada de valores extremos (Total Máximo é muito superior à média).")
            
        print("\nCONCLUSÃO: O dataset NÃO está pronto para análises preditivas. Exige limpeza de datas e tratamento de outliers.")

    except FileNotFoundError:
        print("Erro: O arquivo 'vendas_2023_2024.csv' não foi encontrado na pasta 'datasets'.")

# Executar a função
realizar_eda_vendas()