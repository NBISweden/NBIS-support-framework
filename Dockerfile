FROM ubuntu:16.04

LABEL description = "Dockerfile description"
MAINTAINER "Supp Ortstaff" supp.ortstaff@nbis.se

# Use bash as shell
SHELL ["/bin/bash", "-c"]

# Set workdir
WORKDIR /project

# Install necessary tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends bzip2 \
                                                  ca-certificates \
                                                  curl \
                                                  fontconfig \
                                                  git \
                                                  language-pack-en \
                                                  tzdata \
                                                  vim \
                                                  unzip \
                                                  wget \
    && apt-get clean

# Install Conda and add to PATH
RUN curl -L https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh -O \
    && bash Miniconda3-4.7.12.1-Linux-x86_64.sh -bf -p /usr/miniconda3/ \
    && rm Miniconda3-4.7.12.1-Linux-x86_64.sh \
    && /usr/miniconda3/bin/conda clean -tipsy \
    && ln -s /usr/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /usr/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc

# Add Conda to PATH and set locale
ENV PATH="/usr/miniconda3/bin:${PATH}"
ENV LC_ALL en_GB.UTF-8
ENV LC_LANG en_GB.UTF-8

# Add Conda environment file
COPY environment.yml ./

# Install the Conda environment
RUN conda config --add channels bioconda \
    && conda config --add channels conda-forge \
    && conda config --set channel_priority strict \
    && conda install mamba \
    && mamba env update -n base -f environment.yml \
    && mamba clean --all

# Start Bash shell by default
CMD /bin/bash
