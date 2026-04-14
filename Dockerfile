FROM python:3.11-slim

# Базовые настройки Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Устанавливаем pipenv
RUN pip install --no-cache-dir pipenv

# Копируем зависимости
COPY Pipfile Pipfile.lock ./

# Устанавливаем зависимости в систему (без virtualenv)
RUN pipenv install --system --deploy

# Копируем проект
COPY . .

# Собираем статику (админка, css и т.д.)
RUN python manage.py collectstatic --noinput

# Открываем порт
EXPOSE 8000

# Запуск приложения
CMD ["gunicorn", "base.wsgi:application", "--bind", "0.0.0.0:8000"]