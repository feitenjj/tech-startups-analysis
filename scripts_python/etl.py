"""etl.py - Simple ETL pipeline using Polars"""

import polars as pl
from pathlib import Path

# Define paths
ROOT = Path(__file__).resolve().parents[1]
DATA_RAW = ROOT / "data" / "raw"
DATA_CLEAN = ROOT / "data" / "clean"

def load_companies():
    """Load the Crunchbase companies dataset"""
    print("✅ Reading companies.csv ...")
    df = pl.read_csv(DATA_RAW / "companies.csv")
    print(f"✔️  Loaded {df.shape[0]} rows.")
    return df

def load_unicorns():
    """Load the Unicorn Companies dataset"""
    print("✅ Reading Unicorn_Companies.csv ...")
    df = pl.read_csv(DATA_RAW / "Unicorn_Companies.csv", 
ignore_errors=True)
    print(f"✔️  Loaded {df.shape[0]} rows.")
    return df

def clean_companies(df: pl.DataFrame) -> pl.DataFrame:
    """Basic cleaning for companies dataset"""
    print("🧹 Cleaning companies dataset ...")
    df_clean = df.drop_nulls("name").unique(subset=["name"])
    return df_clean

def clean_unicorns(df: pl.DataFrame) -> pl.DataFrame:
    """Basic cleaning for unicorn dataset"""
    print("🧹 Cleaning unicorns dataset ...")
    df_clean = df.drop_nulls("Company").unique(subset=["Company"])
    return df_clean

def save_clean_data(df: pl.DataFrame, filename: str):
    """Save clean dataframe to /data/clean"""
    output_path = DATA_CLEAN / filename
    df.write_csv(output_path)
    print(f"💾 Saved cleaned data to {output_path}")

def run():
    """Run the full ETL process"""
    companies = load_companies()
    unicorns = load_unicorns()

    clean_c = clean_companies(companies)
    clean_u = clean_unicorns(unicorns)

    save_clean_data(clean_c, "companies_clean.csv")
    save_clean_data(clean_u, "unicorns_clean.csv")

    print("✅ ETL process complete!")

if __name__ == "__main__":
    run()

