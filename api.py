import requests
import pandas as pd

url = "https://api.bcb.gov.br/dados/serie/bcdata.sgs.10813/dados"
params = {
    "formato": "json",
    "dataInicial": "01/01/2023",
    "dataFinal": "31/12/2024"
}

response = requests.get(url, params=params)
df = pd.DataFrame(response.json())
df["data"] = pd.to_datetime(df["data"], dayfirst=True)
df["valor"] = df["valor"].astype(float)

print(df.tail())
