# 🦄 Unicorns: A Data-Driven Overview of Hyper-Growth Ventures

**Author:** Janna Julian

**Tagline:** Defining the Ideal Profile of a Successful Venture: Age, Funding, and Sectoral Influence on Achieving $1B Status.

## 📍 1. Project Overview

This project is a comprehensive data analysis focused on identifying the key determinants of success for startups that achieve **Unicorn status** (valuation over $1 billion). Driven by the goal of understanding the data-driven path to hyper-growth, the analysis provides a strategic comparison between general startups and successful Unicorn companies.

The scope is rigorously anchored by two distinct temporal filters :
* **Post-Dot-Com Era ($\text{Year} > 2001$):** To focus on ventures with more sustainable business models that emerged after the 2000/2001 collapse.
* **Modern Unicorn Definition ($\text{Year} > 2013$):** To align the sample with the concept of hyper-growth, high-valuation private firms coined by Aileen Lee.

## 💡 2. Motivation and Goal

The success factors for the rare few who achieve Unicorn status remain complex. This study resolves the ambiguity by providing tangible, data-backed insights into the most influential variables for success.

**The primary objective is to:** Provide a comprehensive analytical comparison focusing on:
1.  **Geographical and Sectoral Distribution** (Where and in what industries Unicorns concentrate).
2.  **Quantitative Relationships** (How funding and age correlate with success metrics).
3.  **Temporal Growth Analysis** (Tracking the evolution of the ecosystem since the early 2000s).

## 📊 3. Key Metrics (KPIs) & Hypotheses Tested

The analysis is driven by the following KPIs and structured hypotheses:

| KPI | Description | Related Hypothesis |
| :--- | :--- | :--- |
| **Geographical & Industry Distribution** | Startup Unicorns per country and industry. | **H1:** Unicorn density is highest in developed markets. **H2:** Concentration is highest in Software and Finance. |
| **Time to Become an Unicorn** | Average time from founding to $1B valuation. | **H3:** Time to Unicorn status for post-2001 companies is under 10 years. |
| **Capital vs. Time to Unicorn** | Total raised funding vs. growth speed (via correlation/regression). | **H4A:** Negative correlation between Total Funding and Time to Unicorn. |
| **Concentration vs. Time to Unicorn** | Average Investment per Investor vs. growth speed (via correlation/regression). | **H4B:** Funding Concentration is *more* strongly correlated with speed than Total Capital raised. |

## ⚙️ 4. Key Features

The project methodology emphasizes robust data engineering and feature creation:

* **Robust Data Cleaning & Type Conversion:** Custom functions handle inconsistent currency formats (e.g., converting **$100B** to a float), standardize date formats, and manage text inconsistencies across two distinct datasets.
* **Targeted Temporal Filtering:** Applies the crucial Post-2001 and Post-2013 filters to ensure the analysis is anchored to the most relevant ecosystems.
* **Core Metric Engineering:** Derives and calculates the project's key performance indicators (KPIs), notably **Time to Unicorn Status** and **Funding Concentration**.
* **Modular and Efficient Data Output:** Merges the two initial data sources (General Startups and Unicorns) into a single, clean, pre-processed **Parquet file** (`final_analysis_merged.parquet`) for efficient downstream analysis.

## 💾 5. Data Sources

The analysis relies on a unified, merged dataset created from two primary sources:

| Dataset | Purpose | Source Reference |
| :--- | :--- | :--- |
| **Unicorn Companies Dataset** | Data specifically on companies achieving $1B+ valuation. | [https://www.kaggle.com/datasets/deepcontractor/unicorn-companies-dataset](https://www.kaggle.com/datasets/deepcontractor/unicorn-companies-dataset) |
| **Startups Dataset** | Provides a broad overview of general startups for comparison. | [https://www.kaggle.com/datasets/amirataha/startups](https://www.kaggle.com/datasets/amirataha/startups) |

## 🚀 6. How to Execute the Code

To replicate the analysis, follow these steps:

1.  **Dependencies:** Ensure all required libraries (e.g., Pandas, Matplotlib, Seaborn, Statmodels) are installed.
2.  **Run Data Wrangling:** Execute the **`data_wrangling.ipynb`** notebook to clean the raw data, apply the temporal filters, calculate the key metrics, and generate the final analysis-ready Parquet file.
3.  **Run Analysis and Visualization:** Execute the **`analysis_and_viz.ipynb`** notebook to explore the cleaned dataset, test the hypotheses, and generate all visualizations.

## 📁 7. Files Included

| Item | Description |
| :--- | :--- |
| `data_wrangling.ipynb` | Main notebook for data cleaning, filtering, and feature engineering. |
| `functions.py` | Library of all custom preprocessing and calculation functions. |
| `analysis_and_viz.ipynb` | Notebook for exploratory analysis, hypothesis testing, and visualization. |
| `final_analysis_merged.parquet` | The final, cleaned, analysis-ready dataset output. |
| **Figures/** | Directory containing all visual outputs from the analysis. |

## 🎯 8. Key Results (Highlights!)

The analysis provided tangible conclusions for market professionals and investment strategists:

* **Speed is the New Normal (H3):** The average time for a company founded post-2001 to reach Unicorn status is **significantly under 10 years**, validating the modern era of accelerated hyper-growth.
* **Sectoral Concentration (H2):** The hypotheses were confirmed; **Software and Fintech** have the overwhelming highest concentration of Unicorns. 
* **Capital vs. Speed (H4A & H4B):**
    * **Total Funding (H4A)** showed a clear **negative correlation** with Time to Unicorn (Companies with more capital achieve the status faster).
    * **Funding Concentration (H4B)** showed a *stronger* negative correlation slope compared to total capital, suggesting **efficient capital deployment (high investment per investor)** is a better predictor of rapid growth than simply the aggregate amount raised. 

## 🖼️ 9. Principal Visualizations

(These are placeholders for your actual generated charts in the GitHub repository's **Figures/** directory.)

* 
* 
* 

## 💻 10. Technologies Used

* **Programming:** Python
* **Data Manipulation:** Pandas, NumPy
* **Visualization:** Matplotlib, Seaborn, Tableau
* **Statistical Analysis:** Statsmodels (for regression/correlation)
* **Data Storage:** Parquet (for efficient, column-oriented storage)

---

### External Links

* **Presentation Slides:** [https://docs.google.com/presentation/d/1rqnrnPdxmuw_oeOFyjBLASJP6oJAKPjgPw6eSoiW4tI/edit?usp=sharing](https://docs.google.com/presentation/d/1rqnrnPdxmuw_oeOFyjBLASJP6oJAKPjgPw6eSoiW4tI/edit?usp=sharing)
* **Tableau Public Dashboard (Funding Concentration):** [https://public.tableau.com/views/StartupAnalysis_17617584928210/FundingConcentration?:language=pt-BR&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link](https://public.tableau.com/views/StartupAnalysis_17617584928210/FundingConcentration?:language=pt-BR&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)