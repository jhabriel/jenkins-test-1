FROM python:3.9-slim

COPY . /app
WORKDIR /app

# Step 1: Install porepy requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Step 2: Download porepy
RUN git clone https://github.com/pmgbergen/porepy.git .

# Step 3: Install porepy
#RUN pip install porepy