require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://www.americancorpus.org/')
entry_form = page.form('zabba')
page = agent.submit(entry_form)
pp page
#successful test of form submit on COCA website
