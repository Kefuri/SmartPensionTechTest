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

Before writing any code to iterate over the log file, I wanted to make sure I could get the log file into the script.  To do this, I decided to test that a `print_log` function would print out the name of the file the script was given as an argument.

Because I'm using RSpec as my testing library, I can't simply run the test script and pass in a log file. Instead, I need to account for making a class-based script callable, and then test accordingly. It is unfortunately not test-driven, but required.

Following Test-Driven Development as best as possible, all new features were built with an increasing test complexity. This meant that edge cases would be covered once the feature was absolutely finished.

Doing this was especially important when it came to sorting and printing lots of different domains - trying to solve the most complex data possibilities first would've meant that basic fundamentals of how the algorithm needed to be structured would have potentially been missed.

While building, I was consistently thinking of the steps I had initially planned out. As such, my class ended up with one extra method which reads the data out of the log, and another which acts as a helper script to tell the class what steps to act out. 

My longest method is 12 lines long which I would ideally like to cut down. Though refactoring said method seems quite tough without some unnecessary extraction to other methods. The main thing I spotted was the repetition when outputting the sorted results - the only difference is that one method uses the word unique in its output. Refactoring later on, this could be worked around and both methods could be cut down considerably.

### Liniting

To put my hands up, I wasn't running rubocop an incredible amount while building this script and ended up leaving linting till the end. Because this is a small script, this might be okay, but with much larger projects, rubocop must have no errors to pass CI tests - so I would usually be checking my linting before each commit.

Linting on testing is something I'm still conflicted about. If tests are structured properly I think that large blocks are acceptable if enough context and describe blocks are used within said block - but it would be great to know the approach to this in a commercial setting.

## Going Forward

If I did have more time available, there's a lot more work I'd like to do to this script. First of all, I'd split out all printing methods into their own class to maintain single-responsibility. The main reason I didn't do this in time was because of the rework needed on my spec files which would take up too much time.

On the topic of tests, I'd also make a lot more use of before blocks to properly configure tests. Using a before block to set up `logfile = ""` and `parser = LogParser.new(logfile)` would save two lines of repetition per test that needs this specific set-up, making the testing file far less bulky.
