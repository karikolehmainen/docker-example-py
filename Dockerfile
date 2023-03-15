FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
ENV PORT=5000
ENV ADDR="0.0.0.0:"%PORT%
WORKDIR /app
COPY . /app
CMD ["gunicorn", "--bind", "${ADDR}", "endpoints:app"]
