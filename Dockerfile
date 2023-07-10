# slim makes the image smaller and faster for python
FROM python:3.11-slim

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /djangogirls
COPY . .
EXPOSE 8000
CMD ["python3", "manage.py", "runserver"]