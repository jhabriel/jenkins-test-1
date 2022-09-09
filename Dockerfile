FROM python:3.9-slim

# Step 1: Install porepy requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt