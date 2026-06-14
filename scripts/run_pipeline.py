"""
Master execution script for Bluestock Mutual Fund Analytics Project.
"""

import os

print("Running ETL Pipeline...")
os.system("python scripts/etl_pipeline.py")

print("\nRunning Fund Recommender...")
os.system("python scripts/recommender.py")

print("\nPipeline executed successfully!")