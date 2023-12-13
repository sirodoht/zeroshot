# zeroshot

## Development

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# create database
python manage.py migrate

# run dev server
python manage.py runserver
```

Server responds at http://127.0.0.1:8000/.

## License

MIT
