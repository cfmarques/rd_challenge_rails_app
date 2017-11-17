# README

### Welcome to User tracking
User tracking is a rails application that persists user navigation in a website from a javascript library and displays the data for analysis.

### System dependencies
- Ruby 2.4.2. It's recommended an installation from RVM (https://rvm.io/);
- Postgres 10.1. It's recommended an installation from a package manager, such as brew, apt-get, etc;
- Bundler. After install ruby you can run gem install bundler to install it. (http://bundler.io/)

### Getting Started
After downloading or cloning this repository, at the command prompt run the commands:
```bash
$ bundle
$ rake db:drop db:create db:migrate
$ rails s
```

At that moment you start an application server.

Using a browser, go to http://localhost:3000 and you'll see the contact list.

### How to run the test suite
At the project path run:
```bash
$ rspec
```

### How to test the application locally
At project path, start the server with the command:
```bash
$ rails s
```
Using a browser, go to http://localhost:3000 and you'll see the contact list.

It is required a website and a javascript library to communicate with the application and generate data to be displayed.

I suggest my sample website which uses my javascript library and already integrates with this application.

Sample website: https://github.com/cfmarques/rd_challenge_website

Download or clone the rd_challenge_website repository (The sample website).

At sample website path, run this command:
```bash
$ ruby -run -e httpd . -p 8000
```

Using a browser, go to http://localhost:8000 and you'll see a website.

Browse the website and fill the email input at the contact page and press the button.

After you press the button your email and navigation will be registered.

Using a browser, go to http://localhost:3000 and you will see your data there.
