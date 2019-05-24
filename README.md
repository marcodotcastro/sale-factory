#QUALIDADE

## Qualidade de Código
```
shell> rubycritic app
```
Acesse: http://localhost:63342/sale-factory/tmp/rubycritic/overview.html


## Cobertura de Código

```
shell> rspec spec
```

Acesse: http://localhost:63342/sale-factory/coverage/index.html

# INFORMAÇÕES

## Deploy

### Heroku

```
heroku run bash
rails db:migrate 
rails c
Rails.application.load_seed
```
PS: Por algum muito motivo rodar o `rails db:seed` via `heroku run rails db:seed` não funciona

## Infraestrutura

- [Amazon S3](https://s3.console.aws.amazon.com/s3/buckets/active-storage-portal-agro/?region=us-east-2&tab=overview)
- [Amazon IAM](https://console.aws.amazon.com/iam/home?region=us-east-2#/users)
