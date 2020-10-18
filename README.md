# URL - Shortener

URL shortening is used with long URLs to establish shorter aliases. We call these shortened aliases "short links." When they enter these short links, users are redirected to the original URL. When viewed, typed, mailed, or tweeted, short links save a lot of room. Additionally, it is less common for users to mistype shorter URLs.

##  Requirements and Goals of the System

1. Requirements for Functional: 

-  Our service should create a shorter and unique alias from it, provided a URL. This is called a short link. To be readily copied and pasted into applications, this connexion should be short enough. 
- Our service can guide them to the original connexion when users access a short link. 
- Optionally, users should be able to select a custom short connexion for their URL. 
- After a normal default timespan, ties will expire. It should be possible for users to determine the expiration period.

2. Requirements for Non-Functional: 

- The system should be extremely accessible. This is needed because all the URL redirects will start failing if our service is down. 
- With minimal latency, URL redirection should occur in real-time. 
- Shortened (not predictable) connexions should not be guessable.

3. Requirements Extended: 

- Analytics; e.g., how many times did a redirect occur? IP Addresses? Country?

### Getting Started

The following steps walk through getting the application running. Before you start,

1. [Clone the project](#1-clone-the-project)
2. [Install and set up the environment](#2-install-and-set-up-the-environment)
3. [Run the tests](#3-run-the-tests)
4. [Start the app](#4-start-the-app)


#### 1. Clone the project
1. Navigate to your project's chosen parent directory, e.g. `$ cd ~/Documents/assignment`
2. [Clone the project](https://help.github.com/articles/cloning-a-repository/), e.g. `git clone https://github.com/Indrajitnaiya09/url-shortner.git`
3. Navigate into the project directory: `$ cd url-shortner`
4. [Clone the project](https://help.github.com/articles/cloning-a-repository/), e.g. `git clone https://github.com/Indrajitnaiya09/url-shortner-front-end.git`
5. Navigate into the project directory: `$ cd url-shortner-front-end`

#### 2. Install and set up the environment

* Go to config/enviroment/development.rb and config (line no 10) the value according to your setup (whitelist your ngrok url)
 for nrgok download and set-up please follow -> https://ngrok.com/download

```
config.hosts << 'fa88515f0a59.ngrok.io'
```

* Make sure your Ruby version 2.7.1, Rails 6.0.3.4 and PostgreSQL 12 React 16.14.0 how to check?

```
$ ruby -v
$ rails -v
$ psql --version
$ npm view react version
$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

* If there is any missmatch please open the link and follow the instruction.

1. Ruby installation -> https://gorails.com/setup/osx/10.15-catalina
2. PostgreSQL installation -> https://www.postgresql.org/
3. React set-up -> https://www.youtube.com/watch?v=00kXjx9k3Os


* Go to config/database.yml and config the value according to your setup


#### 3. Run the tests

Run `rspec` to run all the tests and make sure everything works.

If you just want to run a single test file you can pass the path to the file, either using `rspec`:
```
bundle exec rspec <path to test>
```

This can also be used with specific line number (running only that one test), for example:
```
bundle exec rspec spec/requests/urls_spec.rb 10
```

#### 4. Start the app

```
$ cd url_shortner
$ rails s -p 4000
$ cd url-shortner-front-end
$ npm install
$ npm start 

```


##### 5. Documentation

1. Requirement Doc : https://docs.google.com/document/d/1Gd0Jh6-jDO3QuC6rlOZHutIrVes5UH3NshvkKLIbh4o/edit?usp=sharing
2. Design Doc: https://docs.google.com/document/d/1hmQZVZjYwfLdNJ4JATXs5Ye02LL7gsOHbi-WoIV5y-s/edit?usp=sharing
3. ADA Doc: https://docs.google.com/document/d/18_NMvfOn5kKXe5uxoUt97q5SkSYAOc9gP4IkinWWJfA/edit?usp=sharing