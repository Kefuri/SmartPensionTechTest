# Smart Pension Tech Test

## The goal

Write a script that will take a .log and:

1. Order unique sites by most viewed to least viewed
2. Order unique sites by most unique visits

## The Approach

- Create a Parser Class which initializes with the provided .log
- Create a Parser instance method which iterates through the log to create a hash of webpages with corresponding visitor IP addresses:
{ 'about' : [192.111.111, 123.456.789],
  'index' : [192.111.111, 192.111.111, 123.456.789]
}
- Create a Parser instance method which orders the most visited pages and displays them
- Create a Parser instance method which counts unique IPs in each webpage array and orders them, then displays them
