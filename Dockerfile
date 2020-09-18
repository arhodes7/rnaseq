FROM nfcore/base:1.10.2
LABEL authors="phil.ewels@scilifelab.se" \
      description="Docker image containing all requirements for the nfcore/rnaseq pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-core-rnaseq-1.4.2/bin:$PATH

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-rnaseq-1.4.3dev/bin:$PATH
# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-rnaseq-1.4.3dev > nf-core-rnaseq-1.4.3dev.yml

# Instruct R processes to use these empty files instead of clashing with a local version
RUN touch .Rprofile
RUN touch .Renviron
