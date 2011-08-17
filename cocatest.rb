require "rubygems"
require "config/constants"
require "firewatir"
require "nokogiri"

output_file = OUTPUT_PATH + "coca_data.txt"

begin
f = File.new(output_file, "w+")

Watir::Browser.default = 'firefox'

b = Watir::Browser.new

#open COCA page
b.goto "http://corpus.byu.edu/coca/"

#click "enter" button
b.button(:name => "B1").click

#log in
#b.frame(:name, "login").text_field(:name => "email").set EMAIL
#b.frame(:name, "login").text_field(:name => "password").set PASSWORD
#b.frame(:name, "login").form(:name => "myform").submit

#enter n-gram
b.frame(:name, "lefto").text_field(:name => "p").set "toad"

#click search button
b.frame(:name, "lefto").button(:name => "B7").click

#wait five seconds for "rmid" frame to load
sleep 5

#check the checkbox in results frame
b.frame(:name, "rmid").checkbox(:name => "dox").set

#click context button
b.frame(:name, "rmid").button(:name => "button3").click

#wait five seconds for "rbottom" frame to load
sleep 5

#get N minus last two pages
#what I would like to do is grab only the text and set variables so that when I write to the file, I am writing CSV data.  As the program is written, I will just grab html data which I will have to parse on the back end.
  loop do
	table = b.frame(:name, "rbottom").table(:index =>2).html
	#f.puts b.frame(:name, "rbottom").table(:index =>2).each.text
	table.each do |row|
	f.puts(row)
	end
	b.frame(:name, "rbottom").link(:index =>3).click
	sleep 5
	page_next = b.frame(:name, "rbottom").link(:index =>3).href
	page_last = b.frame(:name, "rbottom").link(:index =>4).href
	if  page_next == page_last then
	break
	
  end
  end

#get last two pages
	table.each do |row|
	f.puts(row)
	end
  b.frame(:name, "rbottom").link(:index =>3).click
  sleep 5
  f.puts b.frame(:name, "rbottom").text

end

f.close


