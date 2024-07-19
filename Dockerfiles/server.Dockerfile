ARG PYTHON_BASE=3.12-slim

### build stage ###
FROM python:$PYTHON_BASE AS builder
ARG SERVER_DIR

# install PDM
RUN pip install -U pdm

# disable update check
ENV PDM_CHECK_UPDATE=false

# copy files
COPY ${SERVER_DIR}/pyproject.toml ${SERVER_DIR}/pdm.lock ${SERVER_DIR}/README.md /project/
COPY ${SERVER_DIR}/src/ /project/src

# install dependencies and project into the local packages directory
WORKDIR /project
RUN pdm install --check --prod --no-editable

### run stage ###
FROM python:$PYTHON_BASE
ARG SERVER_DIR

# retrieve packages from build stage
COPY --from=builder /project/.venv /project/.venv
ENV PATH="/project/.venv/bin:$PATH"

# set command/entrypoint, adapt to fit your needs
COPY ${SERVER_DIR}/prisma /project/prisma
COPY ${SERVER_DIR}/src /project/src
COPY ${SERVER_DIR}/main.py /project/main.py

WORKDIR /project

RUN prisma generate

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
