FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Upgrade pip, setuptools, and wheel before installing dependencies
RUN pip3 install --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Optionally include pyproject.toml if your build requires it
COPY pyproject.toml .

COPY . .

CMD ["bash", "start.sh"]
