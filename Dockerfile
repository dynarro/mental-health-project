# This is a multistage build
# slim makes the image smaller and faster for python
FROM python:3.11-slim AS base
WORKDIR /djangogirls

# Takes from base image and installs requirements
FROM base AS dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

WORKDIR /djangogirls
# Copies project code in local path
COPY . .

# Takes from dependencies image
FROM dependencies AS build
COPY --from=dependencies /djangogirls/ ./
EXPOSE 8000
CMD ["python3", "manage.py", "runserver"]
