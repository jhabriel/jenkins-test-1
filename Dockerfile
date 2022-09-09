FROM python:3.9-slim

ENV POREPY_HOME /home/porepy
ENV POREPY_SRC = ${POREPY_HOME}/pp

# Step 1: Install git, wget, and bzip2
RUN apt-get update
RUN apt-get install -y git wget

# Get the PorePy requirements-dev file (we'll install the full development
# version, the overhead in doing so compared to just the run requirements
# is not too big)
ENV TMP_DIR /tmp
WORKDIR ${TMP_DIR}
RUN wget https://raw.githubusercontent.com/pmgbergen/porepy/develop/requirements-dev.txt

# Step 2: Move to a proper folder

# Step 3: Install porepy requirements
#WORKDIR POREPY_HOME
RUN pip install --upgrade pip
RUN pip install -r requirements-dev.txt

# Step 4: Download porepy
# RUN git clone https://github.com/pmgbergen/porepy.git .

# Step 5: Install porepy
#RUN pip install porepy