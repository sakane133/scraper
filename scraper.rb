require "byebug"
require "selenium-webdriver"
require "wait"
require 'dotenv/load'


driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://www.dominionenergy.com/sign-in'
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

# click login button
login = driver.find_element(class: 'top-hitter')
login.click

# fill in username & password then submit
wait.until { driver.find_element(:name, 'USER') }
username = driver.find_element(:name, 'USER')
un = ENV["UNAME"]
username.send_keys "#{un}"

password = driver.find_element(:name, 'PASSWORD')
pw = ENV["PW"]
password.send_keys "#{pw}"

submit = driver.find_element(:id, 'btnSubmit')
submit.click

 byebug

# due date
wait.until { driver.find_element(:class, 'bodyTextGreen') }
due_date = driver.find_elements(:class, 'bodyTextGreen')[0].text

# bill amount
bill_amount = driver.find_elements(:class, 'bodyTextGreen')[1].text

# get to usage page
usage_page = driver.find_element(:link, 'Analyze Energy Usage')
usage_page.click

# start date
start_date = driver.find_elements(:tag_name, "td")[4].text

# end_date
wait.until { driver.find_element(:class, "tbl-td-center") }
end_date = driver.find_elements(:class, "tbl-td-center")[0].text

# usage
usage = driver.find_elements(:class, "tbl-td-center")[2].text

# output
puts ("Bill Amount: #{bill_amount}
Bill Due Date: #{due_date}
Usage: #{usage} kWh
Start Date: #{start_date}
End Date: #{end_date}")