# README

### Welcome to User tracking
User tracking is a rails application that persist user navigation in website from javascript library and show the datas for analysis.

### System dependencies
- Ruby 2.4.2. I recommend install form RVM (https://rvm.io/);
- Postgres 10.1. I recommed install using a package manager as brew, apt-get, etc;

### Getting Started
After download or clone this repository, at the command prompt run the commands:
```bash
$ bundle
$ rake db:drop db:create db:migrate
$ rails s
```

At moment you start a application server.

Using a browser, go to http://localhost:3000 and you'll see the contact list.

### How to run the test suite
At the project path run:
```bash
$ rspec
```

### How to test the application locally
At project path, start server with the command:
```bash
$ rails s
```
Using a browser, go to http://localhost:3000 and you'll see the contact list.

It is required a website and javascript library to call the application and generate datas for be displayed.

I suggest my sample website that use my javascript library and already integrate with this application. 

Sample website: https://github.com/cfmarques/rd_challenge_website

Download or clone the rd_challenge_website respository (The samplewebsite).

At sample website path, run this command:
```bash
$ ruby -run -e httpd . -p 8000
```

Using a browser, go to http://localhost:8000 and you'll see a website.

Navegate by website and fill email input in contact page and press the button.

After you press the button your email and navigation will registered.

Using a browser, go to http://localhost:3000 and will see your datas is present.
