FROM condaforge/mambaforge:4.10.1-0
LABEL description = "Dockerfile for the #0000 NBIS support project"
MAINTAINER "Supp Ortstaff" supp.ortstaff@nbis.se

# Use bash as shell
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /project

# Copy and install the Conda environment
COPY environment.yml ./
RUN conda config --set channel_priority strict \
    && mamba env update --name base --file environment.yml \
    && mamba clean --all --force-pkgs-dirs --yes

# Start Bash shell by default
CMD /bin/bash
