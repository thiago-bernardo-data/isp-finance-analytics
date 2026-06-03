from faker import Faker
import pandas as pd
import random
from datetime import datetime

fake = Faker()

# --------------------
# Markets
# --------------------

markets = [
    ("M001", "Westminster", "CO"),
    ("M002", "Centennial", "CO"),
    ("M003", "Wake Forest", "NC"),
    ("M004", "Charlottesville", "VA"),
    ("M005", "Sandpoint", "ID")
]

markets_df = pd.DataFrame(
    markets,
    columns=["market_id", "market_name", "state"]
)

# --------------------
# Customers
# --------------------

customers = []

for i in range(1, 501):

    market = random.choice(markets)

    customers.append([
        i,
        fake.name(),
        market[0],
        random.choice(["Residential", "Business"]),
        random.choice(["Active", "Churned"])
    ])

customers_df = pd.DataFrame(
    customers,
    columns=[
        "customer_id",
        "customer_name",
        "market_id",
        "customer_type",
        "status"
    ]
)

# --------------------
# Revenue
# --------------------

crm = []
billing = []
gl = []

for customer_id in customers_df["customer_id"]:

    base_revenue = round(random.uniform(60, 180), 2)

    crm_rev = base_revenue

    billing_rev = round(
        crm_rev + random.uniform(-5, 5),
        2
    )

    gl_rev = round(
        billing_rev + random.uniform(-3, 3),
        2
    )

    crm.append([customer_id, "2025-06", crm_rev])
    billing.append([customer_id, "2025-06", billing_rev])
    gl.append([customer_id, "2025-06", gl_rev])

crm_df = pd.DataFrame(
    crm,
    columns=["customer_id", "month", "revenue"]
)

billing_df = pd.DataFrame(
    billing,
    columns=["customer_id", "month", "revenue"]
)

gl_df = pd.DataFrame(
    gl,
    columns=["customer_id", "month", "revenue"]
)

# --------------------
# Churn
# --------------------

churn = []

for customer_id in customers_df["customer_id"]:

    churn_flag = random.choices(
        [0, 1],
        weights=[90, 10]
    )[0]

    churn.append([
        customer_id,
        "2025-06",
        churn_flag
    ])

churn_df = pd.DataFrame(
    churn,
    columns=[
        "customer_id",
        "month",
        "churn_flag"
    ]
)

# --------------------
# Save
# --------------------

customers_df.to_csv(
    "data/raw/customers.csv",
    index=False
)

markets_df.to_csv(
    "data/raw/markets.csv",
    index=False
)

crm_df.to_csv(
    "data/raw/crm_revenue.csv",
    index=False
)

billing_df.to_csv(
    "data/raw/billing_revenue.csv",
    index=False
)

gl_df.to_csv(
    "data/raw/gl_revenue.csv",
    index=False
)

churn_df.to_csv(
    "data/raw/churn_events.csv",
    index=False
)

print("Files created successfully.")