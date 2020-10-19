# Smart Pension Tech Test

## The goal

Write a script that will take a .log and:

1. Order unique sites by most viewed to least viewed
2. Order unique sites by most unique visits

## The Approach

- Create a LogParser Class which initializes with the provided .log
- Create a LogParser instance method which iterates through the log to create a hash of webpages with corresponding visitor IP addresses:
{ 'about' : [192.111.111, 123.456.789],
  'index' : [192.111.111, 192.111.111, 123.456.789]
}
- Create a LogParser instance method which orders the most visited pages and displays them
- Create a LogParser instance method which counts unique IPs in each webpage array and orders them, then displays them


## My Workflow

Before writing any code to iterate over the log file, I wanted to make sure I could get the log file into the script.  To do this, I decided to test that a `print_log` function would print out the contents the script was given as arguments.

Because I'm using RSpec as my testing library, I can't simply run the test script and pass in a log file. Instead, I need to account for making a class-based script callable, and then test accordingly. It is unfortunately not test-driven, but required. 