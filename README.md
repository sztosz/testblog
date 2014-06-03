## netguru RoR workshop - test blog

Hello stranger! You have just taken your first step on your adventure with programming in RoR. We are proud of you! Now, we challenge you to complete the following task. Ready, steady...

Follow the instructions:

1. Clone the repository: `git clone git@github.com:netguru/testblog.git`
2. Install an appropriate Ruby (2.1) - we recommend using [RVM](https://rvm.io/) - and run the command `bundle`
3. Launch the app and take a look around (`bundle exec rails s`)
4. Your job is to:
    * add a simple comment system
    * add a simple voting system (vote_up / vote_down is enough)
    * in the post view the date should be formatted like so – `21/07/2013 : 14:10`
    * after receiving three negative votes the comemnt should be marked as abusive and hidden from the user
    * that comment should still be visible to the author of the post on the comments list, the author should be able to cancel the 'abusive' state
    * user can't vote twice for the same comment
    * all those actions should be accessible through the app interface (you need to add/modify views - fixing the unit tests is not enough)
    * :exclamation: all [specs](#improve-your-workflow-with-automated-rspec-running) should be green :green_heart:
5. General rules:
    * don't fork the repository. Clone it and make a new one – we want all of you to have equal chances
    * try writing small, self-containing commits
    * do not modify the specs, only the application code
6. If you run into any difficulties you can always talk about them with other participants or one of the coaches on our [open channel](https://www.hipchat.com/gElgOYCSJ)
7. I see that you're doing great! When all tasks are done and the specs are green:
    * put the project on [Heroku](https://www.heroku.com/) (starter guide available [here](https://devcenter.heroku.com/articles/rails3))
    * fill out the [registration form](https://docs.google.com/forms/d/1UACYlrBSd7w1eSCpC4j8pPEeKkgWObPYc0-y84n73ng/viewform)
8. Splendid! You've finished the task. We will soon let you know about the result.

Remember – there is a lmited number of attendees, so the sooner you complete the task the better your chances are.

## Here are some great resources to help you with kicking off your adventure with Rails:

* [http://www.codeschool.com/paths/ruby](http://www.codeschool.com/paths/ruby) - free Ruby and Rails courses available at the elementary level
* you want to be sure your Rails basis are solid? Check out the Ruby Koans - [http://rubykoans.com/](http://rubykoans.com/)
* [http://guides.rubyonrails.org/](http://guides.rubyonrails.org/) - sooner or later this one will come in handy
* not feeling comfortable with JavaScript / jQuery? CodeSchool can help you with this one too - [http://www.codeschool.com/courses/try-jquery](http://www.codeschool.com/courses/try-jquery)

## Improve your workflow with automated rspec running

Technically, they way how you will be completing this task is called [Test-driven development (TDD)](http://stackoverflow.com/questions/11941/getting-started-with-agile-and-tdd). I found using [guard gem](https://github.com/guard/guard) in this programming methodology is very helpful. If you aren't familiar with TDD concept yet let me explain this in few words.

Idea of this programming methodology is to first write a test and then write a piece of code that will make this test pass :green_heart:.

In `testblog` app tests are already written. The 'only' thing you need to do is to make these tests pass and eventually add your own for custom behaviour of app (and also make them pass!). 

To make this process more friendly I would recommend you use [guard-rspec gem](https://github.com/guard/guard-rspec). How does it work?

It's very simple. By default Guard (with rspec addon) watches files in your working folder and when you make any change to them (add piece of code, remove file, etc.) it runs test so you can track your progress all the time without running `rspec` command anymore! 

It saves a lot of the time, help to track current and further tasks and what is more, if your new piece of code will destroy (bug :exlamation:) any behaviour in app you will get notified about it immedlity. As sooner you can react on bug as easier it is to remove this bug.

How to start? 

1. Open new tab/window of console/terminal/cmd that will be dedicated for guard runner.
2. Go to `testblog` directory and run `guard init rspec`

    You should see in console:

    ```
    21:02:07 - INFO - Writing new Guardfile to /path_where_you_cloned_this_repo/testblog/Guardfile
    21:02:07 - INFO - rspec guard added to Guardfile, feel free to edit it
    ```

3. Run `guard` command. Now this console/terminal/cmd tab will watch all files in project's directory untill you terminate it (`control+c on OS X`). You should see this console output:

    ```
    21:02:18 - INFO - Guard is using TerminalTitle to send notifications.
    21:02:18 - INFO - Guard::RSpec is running
    21:02:18 - INFO - Guard is now watching at '/path_where_you_cloned_this_repo/testblog'
    ```

4. Go write some code and get notified about your progress on live with guard!

You can also modify default behaviour of guard! For further read visit [guard-rspec repo](https://github.com/guard/guard-rspec) and/or [guard repo](https://github.com/guard/guard).
