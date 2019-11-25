require "byebug"
require "selenium-webdriver"
require "wait"
require 'dotenv/load'


driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://mydom.dominionenergy.com/siteminderagent/forms/login.fcc?TYPE=33554433&REALMOID=06-b1426164-283c-487c-b4ad-645d5f3e03af&GUID=&SMAUTHREASON=0&METHOD=GET&SMAGENTNAME=FTym4CzlYxlWQmppoRodMtOB72IsaekMnbsUs4TpBqmjxyc89Akr5Hrundmzou72&TARGET=-SM-https%3a%2f%2fmydom%2edominionenergy%2ecom%2f'
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

    # fill in username & password then submit
    wait.until { get_by_name(driver, 'USER')}
    username = get_by_name(driver, 'USER')
    un = ENV["USERNAME"]
    username.send_keys "#{un}"

    wait.until { get_by_name(driver, 'PASSWORD')}
    password = get_by_name(driver, 'PASSWORD')
    pw = ENV["PW"]
    password.send_keys "#{pw}"

    submit = get_by_id(driver, 'btnSubmit')
    submit.click


    # due date
    wait.until { get_by_class(driver, 'bodyTextGreen') }
    due_date = get_by_class(driver, 'bodyTextGreen')[0].text
    # bill amount
    bill_amount = get_by_class(driver, 'bodyTextGreen')[1].text

    # get to usage page
    wait.until { driver.find_element(:link, 'Analyze Energy Usage')}
    usage_page = driver.find_element(:link, 'Analyze Energy Usage')
    usage_page.click

    # start date
    wait.until {driver.find_elements(:tag_name, "td")}
    start_date = driver.find_elements(:tag_name, "td")[4].text

    # end_date
    wait.until { get_by_class(driver, "tbl-td-center") }
    end_date = get_by_class(driver, "tbl-td-center")[0].text

    # usage
    wait.until { get_by_class(driver, "tbl-td-center") }
    usage = get_by_class(driver, "tbl-td-center")[2].text

# output with user data
puts ("Bill Amount: #{bill_amount}
Bill Due Date: #{due_date}
Usage: #{usage} kWh
Service Start Date: #{start_date}
Service End Date: #{end_date}")
