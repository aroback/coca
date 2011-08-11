require "rubygems"
require "firewatir"
require "nokogiri"

Watir::Browser.default = 'firefox'

b = Watir::Browser.new

#open COCA page
b.goto "http://corpus.byu.edu/coca/"

#click "enter" button
b.button(:name => "B1").click

#enter n-gram
b.frame(:name, "lefto").text_field(:name => "p").set "corruption"

#click search button
b.frame(:name, "lefto").button(:name => "B7").click

#WORKS UP TO HERE, BUT CAN'T GET DATA AFTER THAT
#fetch data--PARSES BUT DOES NOT RETURN THE DATA IN THAT RANGE
Nokogiri::HTML.parse(b.frame(:name, "rmid").html)



#click "Enter" button
entry_form = page.form("zabba")
page = agent.submit(entry_form)

puts "Entered COCA Website"

page = agent.get('login1.asp')

#log in
login_form = page.form("myform")
  login_form.email = EMAIL
  login_form.password = PASSWORD
page = agent.submit(login_form)
puts "Logged in"

page = agent.get('http://www.americancorpus.org/')

pp page
