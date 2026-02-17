FROM python:3.11-slim

# Говорим Python не создавать временные файлы (.pyc)
ENV PYTHONDONTWRITEBYTECODE 1

# Говорим Python сразу показывать все сообщения в консоли
ENV PYTHONUNBUFFERED 1

# Создаем папку /app внутри контейнера
WORKDIR /app

COPY requirements.txt .

#  --no-cache-dir не сохранять временные файлы установки
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# что запускать когда контейнер стартует
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
