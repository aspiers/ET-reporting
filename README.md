# The ET Reporting Project

See https://geekli.st/hackathon/hack4good-06/project/541565a6d29d5eb10864d1b9
for the background behind this project.

This repository contains a Rails app that allows collection of carbon
emission data from corporations and carbon analysts (volunteers who
trawl company websites and extract data about carbon emissions etc.)

It will eventually also support generation of reports on the collected
data.

## Technical implementation details

### `surveyor` gem

We use [the `surveyor` gem](https://github.com/NUBIC/surveyor) to
implement the survey.  The questions are specified in
[a single file](surveys/et_reporting_survey.rb) which uses a simple
Ruby-based DSL.  The gem's documentation explains this DSL in more
detail:

- ["Kitchen Sink" survey](https://raw.githubusercontent.com/NUBIC/surveyor/master/lib/generators/surveyor/templates/surveys/kitchen_sink_survey.rb)
- [Question Types](https://github.com/NUBIC/surveyor/blob/master/doc/question%20types.png)

This should allow non-coders to update the survey in the future
without the expense of implementing sophisticated survey editing
functionality.

### User management / authentication / invitation

We use the [`devise`](https://github.com/plataformatec/devise) and
[`devise_invitable`](https://github.com/scambra/devise_invitable)
gems.

## Running the application

### Install Ruby

The app is tested on Ruby 2.1.2 but you may have luck with older
versions.  It is suspected that anything older than 2.0 will not work.

On Linux or MacOS X, you can use [RVM](http://rvm.io/rvm/install), a
ruby version manager:

```bash
rvm install 2.1.2
```

### Clone the repository to your machine

First, [fork the repository](https://github.com/eio-org-uk/ET-reporting/fork).
Then clone from your fork, e.g.:

    git clone git@github.com:my-github-username/ET-reporting.git

### Install all the gems!

With Ruby 2.0, [`bundler`](http://bundler.io) should automatically be
available.

```bash
bundle install --without production
```

Use the `--without production` flag to avoid installing the `pg` gem
for PostgreSQL, which you don't need in development anyway!

### Setup the database

```bash
bundle exec rake db:create
bundle exec rake db:migrate
```

### Load the reporting survey

```bash
bundle exec rake surveyor FILE=surveys/et_reporting_survey.rb
```

If you update
[`surveys/et_reporting_survey.rb`](surveys/et_reporting_survey.rb) and
re-run the above `rake surveyor` command, then
[http://localhost:3000/surveys](http://localhost:3000/surveys) will
list a new version of the survey.  It keeps old versions and any
corresponding answers.

### Run the app!

```bash
bundle exec rails server
```

and now you should be able to visit: [http://localhost:3000/](http://localhost:3000/)

## Relevant Links

  - [HackPad](https://hack4good.hackpad.com/ET-Corporate-Reporting-9Cf6al4I7YD)
  - [Hipchat room: CP: 1% Project](https://hack4good.hipchat.com/chat)
