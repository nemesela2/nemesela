# Code challenge

Welcome to the iubenda testing engineer code challenge! 🎉

## Instructions for the candidate

In this repository you find a sample Rails5 blogging application. Your challenge consists of doing the following:

1. Run the Rails application following the **Setup instructions below**;
2. Find the main use cases of this application and write them down in a `USE_CASE.md` file, following a standard format: scenario, preconditions, postconditions. The file needs to be a **valid** markdown file;
3. For each of the use cases found, you'll need to write the [Capybara tests](https://github.com/teamcapybara/capybara), which check automatically that the application is working as expected.

The application is already set up in order to run capybara specs. You can find a test template under `spec/features` —all tests should live inside that folder.<br>
In order to run the tests you need to run the following command: `$ bundle exec rspec`.

All the created capybara tests and the `USE_CASE.md` file should be committed on this repository on a **separate branch** (you should already have commit access to this repository) and a **Pull Request** should be made, with the `master` branch of this repository as its base.

### Want to use another acceptance testing tool?

**Capybara** is the tool that we use in our company and that you'll need to use in your day-to-day job. However, you may use another tool if you feel more comfortable with it.<br>If you opt to do that, it's crucial that you also provide a `TESTING_INSTRUCTIONS.md` file that includes all the steps needed in order to run the tests you wrote.

Experience with Ruby on Rails is **not** decisive for this challenge. A solid understanding of OOP languages will suffice, so don't be disheartened if you never dealt with Ruby or Ruby on Rails before.

If something is not clear, please don't hesitate to ask us 🙂.

## What this application is about

This is a basic blogging application: a registered user can *list*, *create*, *edit* and *delete* **their own posts**.
The user can also *write comments* to the posts and *search* them through a search box on top.

## Setup instructions

### Requirements

- [Ruby 2.5.1](https://www.ruby-lang.org/en/documentation/installation/)
   - We recommend using RVM ([Ruby Version Manager](https://rvm.io/)) for installing Ruby
- Bundler installed on the ruby version
   - Run `$ gem install bundler` to install it, after installing the expected Ruby version
- MySQL >= 8 installed and running on your machine
   - This expects a `root` user with blank password. In case it doesn't exist, you can replace username & password in [config/database.yml](/config/database.yml).

### Instructions

In order to setup the app you need to run : `$ bin/setup`

A Demo user will be created with the following credentials: `email: 'test1@test.com', password: 'password1'`

If you want to run the server, you can do so with `$ bin/rails s`

If you have problems during the setup of the application feel free to contact us on our hiring platform workable.

**After you are done with the assessment**, please send us the zipped `.git` repository (with your changes) via email.

## Reporting problems during setup
If you run into problems and absolutely cannot set up the application in your machine, you may report your issue through this Google Form: https://forms.gle/CWvapTm1gDnoarL59

We will consider your case and provide assistance, depending on the nature of the problem.

**Be advised** that using this form will be taken into account towards your evaluation, as setting up the application is part of the test.
