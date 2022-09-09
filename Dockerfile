FROM python:3.9-slim

RUN apt-get update
RUN apt-get install git

COPY . /app
WORKDIR /app

# STEP 1: Install git

# Step 2: Install porepy requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Step 3: Download porepy
RUN git clone https://github.com/pmgbergen/porepy.git .

# Step 3: Install porepy
#RUN pip install porepy