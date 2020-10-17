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
