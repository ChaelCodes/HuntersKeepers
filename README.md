# HuntersKeepers

[![Maintainability](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/maintainability)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/test_coverage)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/test_coverage) [![Codeship Status for ChaelCodes/HuntersKeepers](https://app.codeship.com/projects/c9216880-c9a8-0137-f66b-76a25f9e8127/status?branch=master)](https://app.codeship.com/projects/367780)
[![Inline docs](http://inch-ci.org/github/ChaelCodes/HuntersKeepers.svg?branch=master)](http://inch-ci.org/github/ChaelCodes/HuntersKeepers) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](https://www.contributor-covenant.org/version/2/0/code_of_conduct/)

This is a Rails App that facilitates Monster of the Week Mysteries. [Monster of the Week](https://www.evilhat.com/home/monster-of-the-week/) is a role-playing game focused on supernatural horror. This project is WIP. Our first goal is tracking player character sheets. Eventually, we'd like to track mystery details and harm in a mystery session. [We're currently hosting it on Heroku if you want to check it out.](https://hunters-keepers.herokuapp.com/hunters)

We're building this app to practice and hone our development skills. One goal of this application is to implement a state of the art, free development environment to work in, and see what codebase results from that. [Contributions](CONTRIBUTING.md) (of all sorts) are welcome!

This app is live-coded every Sunday at 9am EST over at [https://twitch.tv/ChaelCodes](https://twitch.tv/ChaelCodes)

## Toolset/Stack

| Tool                                            | Usage                         | Notes                                                                                                                                                                                     |
| ----------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Postgres                                        | Database                      | -                                                                                                                                                                                         |
| Rails                                           | Web app Framework             | Not just an API!                                                                                                                                                                          |
| [Webpacker](https://github.com/rails/webpacker) | Webpack Integration in Rails  | Used to Build Vue                                                                                                                                                                         |
| [Yarn](https://yarnpkg.com/)                    | JS Package Management         | -                                                                                                                                                                                         |
| [Vue](https://vuejs.org/)                       | Front-end framework           | Add some reactivity                                                                                                                                                                       |
| [Buefy](https://buefy.org/)                     | UI Component Library          | Based on [Bulma](https://bulma.io/)                                                                                                                                                       |
| RDoc                                            | Documentation tool            | [View at rubydoc.info](https://rubydoc.info/github/ChaelCodes/HuntersKeepers/Hunter)                                                                                                      |
| Inch                                            | Tracks Documentation Coverage | [![Inline docs](http://inch-ci.org/github/ChaelCodes/HuntersKeepers.svg?branch=master)](http://inch-ci.org/github/ChaelCodes/HuntersKeepers)                                              |
| Code Climate                                    | Code Quality Solution         | [![Maintainability](https://api.codeclimate.com/v1/badges/67450702dbf049c335b0/maintainability)](https://codeclimate.com/github/ChaelCodes/HuntersKeepers/maintainability)                |
| CodeShip                                        | Continuous Testing            | [![Codeship Status for ChaelCodes/HuntersKeepers](https://app.codeship.com/projects/c9216880-c9a8-0137-f66b-76a25f9e8127/status?branch=master)](https://app.codeship.com/projects/367780) |
| Heroku                                          | Hosting                       | [Visit the App](https://hunters-keepers.herokuapp.com/hunters)                                                                                                                            |
| Docker                                          | Development Environment       | -                                                                                                                                                                                         |

## How to setup docker

### Requirements

- Have installed [docker](https://docs.docker.com/engine/install/)
- Have installed [docker-compose](https://docs.docker.com/compose/install/)

### Running containers

```sh
docker-compose up -d
```
