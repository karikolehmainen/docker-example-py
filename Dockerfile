FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
ENV PORT = 5000
WORKDIR /app
COPY . /app
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "endpoints:app"]
