FROM python:3.12-slim


WORKDIR /project_back


COPY requirements.txt /project_back
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы приложения
COPY . /project_back

EXPOSE 5000
# Запускаем приложение
