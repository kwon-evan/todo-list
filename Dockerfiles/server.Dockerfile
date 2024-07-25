ARG PYTHON_BASE=3.12-slim

### build stage ###
FROM python:$PYTHON_BASE AS builder
ARG SERVER_DIR

# install PDM
RUN pip install -U pdm

# disable update check
ENV PDM_CHECK_UPDATE=false

# copy files
COPY ${SERVER_DIR}/pyproject.toml ${SERVER_DIR}/pdm.lock /project/
COPY ${SERVER_DIR}/src/ /project/src

# install dependencies and project into the local packages directory
WORKDIR /project
RUN pdm install --check --prod --no-editable

### run stage ###
FROM python:$PYTHON_BASE
ARG SERVER_DIR

# copy files from build stage
COPY --from=builder /project/src /project/src
COPY --from=builder /project/.venv /project/.venv
COPY ${SERVER_DIR}/prisma /project/prisma
COPY ${SERVER_DIR}/main.py /project/main.py

ENV PATH="/project/.venv/bin:$PATH"

WORKDIR /project

RUN prisma generate

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
