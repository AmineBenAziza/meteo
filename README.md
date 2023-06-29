## Example API requests

### Sign in
```curl
curl --location --request POST 'http://127.0.0.1:3000/users/tokens/sign_in' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "test@development.com",
    "password": "123456"
}'
```

### Sign up
```curl
curl --location --request POST 'http://127.0.0.1:3000/users/tokens/sign_up' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "test@development.com",
    "password": "123456"
}'
```

do not forget rails db:seed to create cities