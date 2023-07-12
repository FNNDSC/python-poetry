FROM docker.io/mambaorg/micromamba:1.4-bookworm-slim

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

ARG PYTHON_VERSION
ARG POETRY_VERSION
RUN micromamba install -y -n base -c conda-forge \
    poetry=$POETRY_VERSION python=$PYTHON_VERSION \
    && micromamba clean --all --yes \
    && rm -rf /opt/conda/pkgs
ENV PATH=/opt/conda/bin:$PATH
