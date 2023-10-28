# Memeland
Таким образом можно запустить скрипт для прогона Memeland на Ubuntu.

Материалы
- Как [изменить версию python3](https://habr.com/ru/articles/686186/) на Ubuntu
- [Скрипт MemeLand](https://github.com/nazavod777/memeland_auto_reger)
```
# Установим python версии 3.11.6
sudo apt update && sudo apt upgrade -y
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
cd /opt
sudo wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz
sudo tar xzf Python-3.11.6.tgz

# теперь установим альтернативную версию python
cd Python-3.11.6
sudo ./configure -enable-optimizations
sudo make altinstall

# sudo apt-get install cmake build-essential git libmicrohttpd-dev \
# libssl-dev libhwloc-dev

# Проверка
cd /usr/local/bin/
ls

update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.11 2

# Проверим список версий  и выбор нужной:
update-alternatives --list python3

# установка pip
apt install python3-pip
python3.11 -m pip install --upgrade pip

# Скажем что python3 это python
apt-get install python-is-python3
python --version

# Теперь перейдем к самому скрипту
cd
# sudo wget https://github.com/nazavod777/memeland_auto_reger/archive/refs/heads/main.zip && unzip /root/main.zip
git clone https://github.com/nazavod777/memeland_auto_reger
cd memeland_auto_reger
pip install -r requirements.txt

# Настройте
nano accounts.txt
nano private_keys.txt # не обязательно, скрипт может сам генерировать кошельки
nano proxies.txt
nano config.py

# запускаем
python main.py
```
