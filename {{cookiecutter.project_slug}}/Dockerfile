FROM python:3.9-slim-bullseye as python-base

# Make sure we write input in case of failure
ENV PYTHONUNBUFFERED=1 

ENV CODE_DIR="/code"

ENV POETRY_VERSION=1.1.11 \
    POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_PATH="/opt/venvs/"

# Add poetry bin to path
ENV PATH="$POETRY_HOME/bin:$PATH"


FROM python-base as builder-base
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    build-essential

# Respects POETRY_VERSION and POETRY_HOME
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

WORKDIR $CODE_DIR
COPY ./poetry.lock ./pyproject.toml ./
RUN poetry install --no-dev

FROM python-base as development

COPY --from=builder-base $POETRY_HOME $POETRY_HOME
COPY --from=builder-base $POETRY_VIRTUALENVS_PATH $POETRY_VIRTUALENVS_PATH
COPY --from=builder-base $CODE_DIR $CODE_DIR

COPY ./docker_entrypoint.sh ./docker_entrypoint.sh
RUN chmod +x ./docker_entrypoint.sh

WORKDIR $CODE_DIR

RUN poetry install
# If we're going to dev inside it we might as well copy everything here
COPY . . 

ENTRYPOINT [ "/docker_entrypoint.sh" ]
CMD ["/bin/bash"]
