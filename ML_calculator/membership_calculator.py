#from enum import member
from google.cloud import bigquery
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

# Create client
path_to_json = "C:\\Users\\stefa\\Downloads\\divvy-case-study-487918-55786bb3b066.json"

client = bigquery.Client.from_service_account_json(path_to_json)

query = """
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_id,
    end_station_id,
    member_casual
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
LIMIT 50000
"""

# Run query
df = client.query(query).to_dataframe()



# Convert timestamps
df["started_at"] = pd.to_datetime(df["started_at"])
df["ended_at"] = pd.to_datetime(df["ended_at"])

# Ride duration (minutes)
df["ride_duration"] = (df["ended_at"] - df["started_at"]).dt.total_seconds() / 60

# Time features
df["hour"] = df["started_at"].dt.hour
df["day_of_week"] = df["started_at"].dt.dayofweek
df["is_weekend"] = df["day_of_week"] >= 5

# Bike type encoding
df["electric_bike"] = (df["rideable_type"] == "electric_bike").astype(int)

# Target variable
df["target"] = df["member_casual"].map({"member":1, "casual":0})

features = [
    "ride_duration",
    "hour",
    "day_of_week",
    "is_weekend",
    "electric_bike"
]

X = df[features]
y = df["target"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)


model = LogisticRegression()

model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Accuracy:", accuracy_score(y_test, predictions))

def membership_calculator(duration, hour, day_of_week, weekend, electric):

    input_data = pd.DataFrame([{
        "ride_duration": duration,
        "hour": hour,
        "day_of_week": day_of_week,
        "is_weekend": weekend,
        "electric_bike": electric
    }])

    likelihood = model.predict_proba(input_data)[0][1]

    if likelihood > 0.6:
        recommendation = "Better suited as MEMBER"
    else:
        recommendation = "Better suited as CASUAL rider"

    print("Membership likelihood:", round(likelihood,2))
    print("Recommendation:", recommendation)

# test calculator
membership_calculator(12, 8, 2, 0, 1)

