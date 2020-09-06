# HuntersKeepers

[![Maintainability](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/maintainability)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/test_coverage)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/test_coverage) [![Codeship Status for ChaelCodes/HuntersKeepers](https://app.codeship.com/projects/c9216880-c9a8-0137-f66b-76a25f9e8127/status?branch=master)](https://app.codeship.com/projects/367780)
[![Inline docs](http://inch-ci.org/github/ChaelCodes/HuntersKeepers.svg?branch=master)](http://inch-ci.org/github/ChaelCodes/HuntersKeepers)

This is a Rails App that facilitates Monster of the Week Mysteries. [Monster of the Week](https://www.evilhat.com/home/monster-of-the-week/) is a role-playing game focused on supernatural horror. This project is WIP. Our first goal is tracking player character sheets. Eventually, we'd like to track mystery details and harm in a mystery session. [We're currently hosting it on Heroku if you want to check it out.](https://hunters-keepers.herokuapp.com/hunters)

We're building this app to practice and hone our development skills. One goal of this application is to implement a state of the art, free development environment to work in, and see what codebase results from that. Contributions (of all sorts) are welcome!

This app is live-coded every Sunday at 9am EST over at [https://twitch.tv/ChaelCodes](https://twitch.tv/ChaelCodes)

## Installation
Start by ensuring your development environment is ready for Rails. [GoRails has a great set of guides for every operating system.](https://gorails.com/setup)

### Docker
You can run the app locally (Postgres + Webpacker + Rails) via a Docker container.

Executing `docker-compose up` will bring those services up, and the application will be accessible via `http://localhost:3000`.

The initial run will create two Docker volumes, one for the database and one for the Node modules.
The database will be initialized, including having seed data inserted and migrations run.

The project root directory will be mounted within the container so that your changes can be detected and hot-loaded into the running app.
Note: this requires that you've given the Docker application access to that folder -- (this should be configurable at `Settings -> Resources -> File Sharing`)

To open the Rails console:\
`> docker exec -it hunterskeepers_web_1 bin/rails c`

To open the Postgres console:\
`> docker exec -it hunterskeepers_db_1 psql -U postgres hunterskeepers_development`

If you update package.json or yarn.lock you'll want to restart the container so the `node_modules/` volume will be rebuilt.

## Toolset/Stack

Tool | Usage | Notes
--- | --- | ---
Postgres | Database | -
Rails | Web app Framework | Not just an API!
Webpacker | Webpack Integration for Rails | [View Webpack Docs](https://github.com/rails/webpacker)
Yarn | JS Package Management | [View Yarn Docs](https://yarnpkg.com/)
[Vue](https://vuejs.org/) | Front-end framework | Add some reactivity
[Buefy](https://buefy.org/) | UI Component Library | Based on [Bulma](https://bulma.io/)
RDoc | Documentation tool | [View at rubydoc.info](https://rubydoc.info/github/ChaelCodes/HuntersKeepers/Hunter)
Inch | Tracks Documentation Coverage | [![Inline docs](http://inch-ci.org/github/ChaelCodes/HuntersKeepers.svg?branch=master)](http://inch-ci.org/github/ChaelCodes/HuntersKeepers)
Code Climate | Code Quality Solution | [![Maintainability](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/maintainability)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/maintainability)
CodeShip | Continuous Testing | [![Codeship Status for ChaelCodes/HuntersKeepers](https://app.codeship.com/projects/c9216880-c9a8-0137-f66b-76a25f9e8127/status?branch=master)](https://app.codeship.com/projects/367780)
Heroku | Hosting | [Visit the App](https://hunters-keepers.herokuapp.com/hunters)
