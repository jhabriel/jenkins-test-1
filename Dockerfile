FROM python:3.9-slim

ENV POREPY_HOME /home/porepy
ENV POREPY_SRC = ${POREPY_HOME}/pp

# Step 1: Install git
RUN apt-get update
RUN apt-get install -y git

# Step 2: Move to a proper folder

# Step 3: Install porepy requirements
WORKDIR POREPY_HOME
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Step 4: Download porepy
# RUN git clone https://github.com/pmgbergen/porepy.git .

# Step 5: Install porepy
#RUN pip install porepy