# Payment API

This is a simple API endpoint providing actions for managing payment resources:
creating, updating, fetching and listing.

### API

* [Detailed API documentation](/docs/payments_api.apib.md) in API Blueprint format

* [Online Apiary API documentation](https://paymentsapi17.docs.apiary.io)


### Architecture and dependencies

It uses Docker to manage application infrastructure. You will need a working
Docker environment to deploy it and use it.

#### Application architecture:
* Puma web server, running Ruby on Rails api application (app container)
* PostgreSQL database (db container)

#### Main api application dependencies:
* Ruby 2.5
* Rails 5.2
* some utility ruby gems (listed in `Gemfile`)

### Usage

#### Environment and database setup
* prepare `.env` by running `cp config/env.example .env`
* set POSTGRES_USER and POSTGRES_PASSWORD inside `.env` (can be anything)
* build app image with `docker-compose build` (be patient)
* initialize database with `docker-compose run --rm app rake db:setup`

#### Running the application

If you've finished setup, you can start the app locally with `docker-compose up -d`.

### Tests

To run test suite locally, run `docker-compose run -e RAILS_ENV=test app rspec`.
