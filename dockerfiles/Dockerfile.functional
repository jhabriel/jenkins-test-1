FROM python:3.9-slim

MAINTAINER PorePy Development Team

ENV POREPY_HOME /home/porepy
ENV POREPY_SRC=${POREPY_HOME}/pp
ENV POREPY_TST=${POREPY_SRC}/tests

ENV TST /tests
ENV FUNCTIONAL_TST=${TST}/functional

# Step 1: Install git, wget, and bzip2
RUN apt-get update
RUN apt-get install -y wget vim bzip2 git gcc libglu1-mesa libxrender1 libxcursor1 libxft2 libxinerama1 ffmpeg libgl1-mesa-glx libsm6 libxext6

# Step 2: Install porepy requirements (development version)
# Get the PorePy requirements-dev file (we'll install the full development
# version, the overhead in doing so compared to just the run requirements
# is not too big)
ENV TMP_DIR /tmp
WORKDIR ${TMP_DIR}
RUN wget https://raw.githubusercontent.com/pmgbergen/porepy/develop/requirements-dev.txt
RUN pip install --upgrade pip
RUN pip install -r requirements-dev.txt

# Step 3: Clone the porepy repo (dev branch)
WORKDIR ${POREPY_HOME}
RUN git clone https://github.com/pmgbergen/porepy.git ${POREPY_SRC}

# STEP 4: Enter source directory and install porepy (no need to install with -e flag)
WORKDIR ${POREPY_SRC}
RUN git checkout develop
RUN pip install --user -e .

# Add PorePy home to the pythonpath. This may or may not be necessary.
ENV PYTHONPATH $POREPY_HOME:$PYTHONPATH

# Step 5: Run all PorePy tests
# WORKDIR ${POREPY_TST}
# RUN ["pytest", "-v", "--junitxml=reports/results_porepy.xml"]

# Step 6: Run functional tests
# COPY . /tests/functional
WORKDIR /tests/functional
RUN ["pytest", "-v", "--junitxml=reports/results.xml"]

# Step 7: Keep the container running after so that we are allowed to copy the resutls
CMD tail -f /dev/null