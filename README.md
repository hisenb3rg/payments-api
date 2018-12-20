# README

### Usage

To start up the service locally run `docker-compose up -d`.

If you are running it for the first time:
* docker images will need to be build, so be patient
* you need to initialise db by running `docker-compose exec app rake db:setup`

### Tests

To run test suite run `docker-compose run app rspec`.
