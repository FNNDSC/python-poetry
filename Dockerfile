ARG BASE=docker.io/fnndsc/conda:python3.10.2
FROM $BASE as base


# https://github.com/python-poetry/poetry/discussions/1879#discussioncomment-216865
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=$POETRY_VERSION \
    POETRY_HOME=/opt/poetry \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false

ARG POETRY_VERSION
RUN conda install -c conda-forge poetry=$POETRY_VERSION
