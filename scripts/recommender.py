import pandas as pd

performance = pd.read_csv(
    "data/processed/scheme_performance_clean.csv"
)

performance['risk_appetite'] = performance['risk_grade'].replace({
    'Low': 'Low',
    'Moderate': 'Moderate',
    'Moderately High': 'Moderate',
    'High': 'High',
    'Very High': 'High'
})


def recommend_funds(risk_level):
    valid_levels = {'low', 'moderate', 'high'}
    selected_level = risk_level.strip().lower()

    if selected_level not in valid_levels:
        raise ValueError(
            "risk_level must be one of: Low, Moderate, High"
        )

    recommendations = (
        performance[
            performance['risk_appetite'].str.lower()
            == selected_level
        ]
        .sort_values('sharpe_ratio', ascending=False)
        [['scheme_name',
          'fund_house',
          'risk_grade',
          'sharpe_ratio',
          'return_3yr_pct']]
        .head(3)
    )

    return recommendations


if __name__ == "__main__":

    risk = input(
        "Enter risk appetite (Low/Moderate/High): "
    )

    try:
        print("\nRecommended Funds:\n")

        print(recommend_funds(risk))

    except ValueError as exc:
        print(f"\n{exc}")
