"""main.py - Orquestra pipeline simples"""
from pathlib import Path
import yaml
import pandas as pd

# Caminho raiz do projeto
ROOT = Path(__file__).parent

def load_config():
    """Carrega o arquivo config.yaml"""
    cfg_path = ROOT / "config.yaml"
    with open(cfg_path, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)

def main():
    """Executa o pipeline principal"""
    cfg = load_config()
    print(f"🚀 Projeto: {cfg['project']['name']}")
    print(f"👤 Autor: {cfg['project']['author']}")
    
    raw_path = ROOT / cfg["data"]["raw"]
    print(f"📂 Pasta de dados brutos: {raw_path}")

    # (Exemplo futuro)
    # from scripts_python.etl import run
    # run()

if __name__ == "__main__":
    main()

