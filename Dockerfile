ARG JL_BASE_VERSION=beta
ARG REGISTRY=scidockreg.esac.esa.int:62530
FROM ${REGISTRY}/datalabs/jl_base:${JL_BASE_VERSION}

ARG DEBIAN_FRONTEND=noninteractive

LABEL description="Shawn's Demo datalab Docker"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY jupyter_notebook_config.py /home/$USER/.jupyter/
COPY jupyter_notebook_config.py /etc/
ENV JUPYTER_CONFIG_PATH=/etc/

WORKDIR /tmp
