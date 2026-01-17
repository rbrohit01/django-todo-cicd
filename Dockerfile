FROM python:3

WORKDIR /data

# It is better to use a requirements.txt, but for direct install:
RUN pip install --no-cache-dir django==3.2

COPY . .

# REMOVED: RUN python manage.py migrate 
# (Migrations should not happen during image creation)

EXPOSE 8000

# Use a shell form or a script to run migrations BEFORE starting the server
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000
