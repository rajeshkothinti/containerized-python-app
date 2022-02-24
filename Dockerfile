FROM python:3.7 as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt --target=/install

# smaller image to run
FROM python:3.7-alpine
COPY --from=builder /install /usr/local
COPY app /app
WORKDIR /app
ENV PYTHONPATH="${PYTHONPATH}:/usr/local"
EXPOSE 5000
CMD ["gunicorn", "-w 4", "-b 0.0.0.0:5000", "app:app"]
#CMD ["python3", "-m Flask", "run"]


# FROM python:3.7-alpine
# RUN mkdir /install
# COPY app /app
# WORKDIR /app
# COPY requirements.txt /requirements.txt
# RUN pip install -r /requirements.txt --target=/install
# ENV PYTHONPATH="${PYTHONPATH}:/install"
# EXPOSE 5000
# CMD ["gunicorn", "-w 4", "-b 0.0.0.0:5000", "app:app"]