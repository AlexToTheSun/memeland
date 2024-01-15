### Для windows
Предположим, вы создали папку, исправили и закинули туда файл скрипта и файл с приватками. Теперь настроим виртуальное окружение:
```
python -m venv C:\Users\YOUR_USER\Desktop\priv-wall\venv
```
Активируем его
```
C:\Users\YOUR_USER\Desktop\priv-wall\venv\Scripts\activate.bat
# Или
C:\Users\Turetskiy\Desktop\priv-wall\venv\Scripts\Activate.ps1
```
Установим нужную версию библиотеки web3
```
pip install web3==6.10.0
```
Теперь переходим в папку и запускаем скрипт:
```
cd C:\Users\YOUR_USER\Desktop\priv-wall
python3 main.py
```


### Для Ubuntu
```
mkdir /root/priv_to_wall

cat > /root/priv_to_wall/main.py <<'EOF'
from web3 import Web3, exceptions

def key_to_address(private_key):
    """Converts a private key to a wallet address."""
    try:
        w3 = Web3()
        account = w3.eth.account.from_key(private_key)
        return account.address
    except exceptions.ValidationError:
        return None

def main():
    with open(r'/root/priv_to_wall/priv_keys.txt', 'r') as keys_file:
        private_keys = keys_file.readlines()

    addresses_keys_pairs = []

    for key in private_keys:
        key = key.strip()  # Removing extra spaces and newlines
        address = key_to_address(key)
        if address:
            addresses_keys_pairs.append((address, key))

    with open(r'/root/priv_to_wall/wallets_keys.txt', 'w') as wallets_file:
        for address, key in addresses_keys_pairs:
            wallets_file.write(f"{address}:{key}\n")

if __name__ == '__main__':
    main()
EOF
```
Заполним приватками файл `priv_keys.txt`. Можнте ввести команду ниже, редактор создаст файл, и вставьте туда нужные приватки
```
nano /root/priv_to_wall/priv_keys.txt
```
Теперь разберемся с виртуальным окружением
```
python3 -m venv /root/priv_to_wall/venv
source /root/priv_to_wall/venv/bin/activate

cd /root/priv_to_wall
pip install web3==6.10.0

#RUN
python main.py
```
