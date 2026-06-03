import duckdb

DB_PATH = "isp_finance.duckdb"

con = duckdb.connect(DB_PATH)

exports = {
    "mart_finance_revenue": "exports/mart_finance_revenue.csv",
    "int_revenue_reconciliation": "exports/int_revenue_reconciliation.csv"
}

for table_name, output_path in exports.items():
    query = f"""
    COPY (
        SELECT *
        FROM {table_name}
    )
    TO '{output_path}'
    (HEADER, DELIMITER ',');
    """
    con.execute(query)
    print(f"Exported {table_name} to {output_path}")

con.close()

print("All exports completed.")