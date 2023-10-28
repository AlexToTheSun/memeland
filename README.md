# Memeland
Таким образом можно запустить скрипт для прогона Memeland на Ubuntu.
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

# Теперь перейдем к самому скрипту
```
