FROM python:3.9-alpine

# Step 1: Install porepy requirements
RUN pip --version
RUN pip install --upgrade pip
RUN pip --version
RUN pip install requests, numpy