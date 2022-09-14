FROM python:3.9-slim

MAINTAINER PorePy Development Team

# porepy directories
ENV PP_HOME /home/porepy
ENV PP_SRC=${PP_HOME}/pp
ENV PP_TST=${POREPY_SRC}/tests

# porepy-tests directories
ENV PPTESTS_HOME /home/porepy-tests
ENV PPTESTS_SRC=${PPTESTS_HOME}/pp-tests
ENV PPTESTS_TST=${PPTESTS_SRC}/tests

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

# Step 3: Clone the porepy repo (develop branch)
WORKDIR ${PP_HOME}
RUN git clone https://github.com/pmgbergen/porepy.git ${PP_SRC}

# STEP 4: Enter source directory and install porepy (no need to install with -e flag)
WORKDIR ${PP_SRC}
RUN git checkout develop
RUN pip install --user -e .

# Add porepy home to the pythonpath. This may or may not be necessary.
ENV PYTHONPATH $PP_HOME:$PYTHONPATH

# STEP 5: Clone the porepy-tests repo (dev branch)
WORKDIR ${PPTESTS_HOME}
RUN git clone https://github.com/jhabriel/jenkins-testing.git ${PPTESTS_SRC}
WORKDIR ${PPTESTS_SRC}
RUN git checkout dev

# Add porepy-tests to the pythonpath. This may or may not be necessary.
ENV PYTHONPATH $PPTESTS_HOME:$PYTHONPATH

# Step 6: Run tests in porepy-tests
WORKDIR ${PPTESTS_TST}
#RUN ["pytest", "--cache-clear", "--disable-warnings", "--verbose",
#"--junitxml=reports/results.xml", " || true"]
RUN pytest -v --disable-warnings --junitxml=reports/results.xml || true

# Step 6: Run functional tests
#COPY . /tests
#WORKDIR /tests

# Step 7: Keep the container running after so that we are allowed to copy the resutls
CMD tail -f /dev/null