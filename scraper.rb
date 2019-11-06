require "byebug"
require "selenium-webdriver"
require "wait"
require 'dotenv/load'


driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://www.dominionenergy.com/sign-in'
wait = Selenium::WebDriver::Wait.new(:timeout => 10)


def get_by_name(driver, name)
    driver.find_element(:name, name)
end

def get_by_id(driver, id)
    driver.find_element(:id, id)
end

def get_by_class(driver, class_name)
    driver.find_elements(:class, class_name)
end

def get_single_class(driver, class_name)
    driver.find_element(:class, class_name)
end



    # select login button
    login = get_single_class(driver, 'top-hitter')
    login.click

    # fill in username & password then submit
    wait.until { get_by_name(driver, 'USER')}
    username = get_by_name(driver, 'USER')
    un = ENV["UNAME"]
    username.send_keys "#{un}"

    password = get_by_name(driver, 'PASSWORD')
    pw = ENV["PW"]
    password.send_keys "#{pw}"

    submit = get_by_id(driver, 'btnSubmit')
    submit.click

byebug

    # due date
    wait.until { get_by_class(driver, 'bodyTextGreen') }
    due_date = get_by_class(driver, 'bodyTextGreen')[0].text
    # bill amount
    bill_amount = get_by_class(driver, 'bodyTextGreen')[1].text

    # get to usage page
    usage_page = driver.find_element(:link, 'Analyze Energy Usage')
    usage_page.click

    # start date
    start_date = driver.find_elements(:tag_name, "td")[4].text

    # end_date
    wait.until { get_by_class(driver, "tbl-td-center") }
    end_date = get_by_class(driver, "tbl-td-center")[0].text

    # usage
    usage = get_by_class(driver, "tbl-td-center")[2].text

# output
puts ("Bill Amount: #{bill_amount}
Bill Due Date: #{due_date}
Usage: #{usage} kWh
Start Date: #{start_date}
End Date: #{end_date}")