# Contributing
Thank you for joining the HuntersKeepers contributor team! We always welcome new PR creators, issue writers, and reviewers! We have a [Discord](https://discord.gg/Yp9N6pF) where you can discuss new PRs, issues, and the app in general.

## Code of Conduct
We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming, diverse, inclusive, and healthy community.

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](https://www.contributor-covenant.org/version/2/0/code_of_conduct/)

We follow the Contributor Covenant v2.0. If you have any issues, reach out to @ChaelCodes directly via Discord, Twitter, email, or any other platform. Your issues will be heard.


## Issue -> PR
- Select an issue from the issues list (or write your own!)
- Comment that you'd like to work on the issue to claim it
  - You have 1 week to create a PR or update on the issue or the issue will be unassigned, and claimable by another contributor
  - You can reclaim an issue if it is not currently claimed
- Fork the Repo
- Write your Code
- Commit your code
  - Please keep your commits clean and descriptive, they will be reviewed along with the PR
- Create descriptive Pull Request pointing to ChaelCodes/HuntersKeepers and the master branch
- All CI checks must pass, before your PR will be reviewed
  - Please do not delete specs unless the matching code has been removed.
- Wait for review
- Review comments are intended to improve the repository's overall quality.
  - If you disagree with a suggestion in the review comment, please explain your reasoning respectfully.
  - All feedback should be kind, constructive, and usable by the contributor.

## Write your Code
- Assume that your code must comply with Rubocop as configured, you can run rubocop through docker.
  - Exceptions may be granted, but only with a Rubocop rule change
- All code should be paired with a test that fails without it and passes with it

## Installation
If you cannot use Docker, start by ensuring your development environment is ready for Rails. [GoRails has a great set of guides for every operating system.](https://gorails.com/setup) Then work through Webpacker. Good luck. Visit the Discord if you have issues.

### Docker
You can run the app locally (Postgres + Webpacker + Rails) via a Docker container.

Executing `docker-compose up` will bring those services up, and the application will be accessible via `http://localhost:3000`.

The initial run will create two Docker volumes, one for the database and one for the Node modules.
The database will be initialized, including having seed data inserted and migrations run.

The project root directory will be mounted within the container so that your changes can be detected and hot-loaded into the running app.
Note: this requires that you've given the Docker application access to that folder -- (this should be configurable at `Settings -> Resources -> File Sharing`)

### Helpful Docker Commands
To open the Rails console:\
`docker exec -it hunterskeepers_web_1 bin/rails c`

To open the Postgres console:\
`docker exec -it hunterskeepers_db_1 psql -U postgres hunterskeepers_development`

To run your tests:\
`docker exec -it hunterskeepers_web_1 bundle exec rspec`

To run rubocop:\
`docker exec -it hunterskeepers_web_1 bundle exec rubocop`

To reset the database with the seed data:\
1. (If server was running) Shut down the web server: `docker-compose stop web`
2. Reset the DB: `docker-compose run web bundle exec rake db:reset`
3. (If server was running) Bring the web server back up: `docker-compose start web`

### Updating Node Modules
You'll have to update your node_modules folder if you see a message similar to the one below.
```
web_1           | ========================================
web_1           |   Your Yarn packages are out of date!
web_1           |   Please run `yarn install --check-files` to update.
web_1           | ========================================
```

If you update package.json or yarn.lock you'll want to rebuild that module. There might be a more efficient way, but you can run:
```
> docker-compose build node_modules
> docker-compose run node_modules
> docker-compose up
```
