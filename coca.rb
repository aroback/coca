require "rubygems"
require "mechanize"
require "config/constants"

agent = Mechanize.new

#open COCA page
page = agent.get('http://www.americancorpus.org/')

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


