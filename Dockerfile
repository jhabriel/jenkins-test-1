FROM python:3.9-slim

ENV POREPY_HOME /home/porepy
ENV POREPY_SRC = ${POREPY_HOME}/pp

# Step 1: Install git, wget, and bzip2
RUN apt-get update
RUN apt-get install -y git wget # bzip2

# Step 2: Install porepy requirements (development version)
# Get the PorePy requirements-dev file (we'll install the full development
# version, the overhead in doing so compared to just the run requirements
# is not too big)
ENV TMP_DIR /tmp
WORKDIR ${TMP_DIR}
RUN wget https://raw.githubusercontent.com/pmgbergen/porepy/develop/requirements-dev.txt
RUN pip install --upgrade pip
RUN pip install -r requirements-dev.txt

# Step 3: Clone and install porepy
WORKDIR POREPY_HOME
RUN git clone https://github.com/pmgbergen/porepy.git .
# RUN pip install porepy