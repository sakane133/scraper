# scraper

This application is a web scraper that is gathering Bill Information Data from a users account on Dominion Energy in Virginia.

To start please create a file called .env

This file will contain the username and password for the account we are collecting data from.

Add the Dominion Energy Username and Password with the variables UNAME and PW. Below is what the .env file should look like.

UNAME = 'abhalla1'
PW = 'QxoQH5FAdVFJPqQhWa1g0qXo'

\*\*\*Please note: This github repository is private, the provided username and password above has not been made public on github.\*\*\*

After creating the .env with those two lines of code, which is already hidden in the .gitignore, run the scraper.

To use the Scraper, in the terminal, run:

1.  bundle Install
2.  ruby scraper.rb

Due to Dominion Energy's captcha, there is a byebug on submit of the login information to complete the Captcha manually. If the captcha no longer exists, the byebug can be taken out and everything should run smoothly on it's own.

After getting through the captcha, return to your terminal to type 'continue' to proceed with the scraper and get out of the byebug.

Once the application is complete, it will print out the Bill information. The usage, bill amount, service start date, service end date, and bill due date for the current bill will be printed in the terminal for you to read.
