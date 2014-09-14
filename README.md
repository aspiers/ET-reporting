# The 1% Project

A Rails app that allows submissions on of data from companies and carbon analysts (volunteers who trawl company websites and extract data about carbon emissions etc.)


## Background information

We use the surveyor gem to allow the survey questions to be specified by a simple DSL 
- [Kitchen Sink](https://raw.githubusercontent.com/NUBIC/surveyor/master/lib/generators/surveyor/templates/surveys/kitchen_sink_survey.rb)
- [Question Types](https://github.com/NUBIC/surveyor/blob/master/doc/question%20types.png)

This should allow non-coders to update the survey in the future without the expense of implementing sophisticated survey editing functionality.

### Getting Started


First, [fork](https://github.com/aspiers/ET-reporting/fork) the repository

### Install Ruby

To do that, you can use [RVM](http://rvm.io/rvm/install), a ruby version manager.

```bash
rvm install 2.1.2
```

### Clone the repository to your machine

  `git clone git@github.com:aspiers/ET-reporting.git`

### Install all the gems!

```bash
gem install bundler
bundle install --without production
```

Use the `--wihout production` flag to avoid installing the `pg` gem for PostgreSQL, which you don't need in development anyway!

### Setup the database

```bash
bundle exec rake db:create
bundle exec rake db:migrate
```

### Load the reporting survey

```bash
bundle exec rake surveyor FILE=surveys/et_reporting_survey.rb
```

  *If you update `surveys/et_reporting_survey.rb` then re-run the above `rake surveyor` command and http://localhost:3000/surveys will list a new version of the survey.  It keeps old versions and any corresponding answers.


### Run the app!

```bash
bundle exec rails server
```

## Relevant Links
  - [HackPad](https://hack4good.hackpad.com/ET-Corporate-Reporting-9Cf6al4I7YD)
  - [CP: 1% Project](https://hack4good.hipchat.com/chat)
