require "rubygems"
require "config/constants"
require "firewatir"

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

#START PROCESS ITERATION HERE--SEARCH TERMS MUST BE IN ALL CAPS
array = [ "HIGH SPEED RAIL", "TOAD" ]

array.each do |i|

#enter n-gram
b.frame(:name, "lefto").text_field(:name => "p").set "#{i}"

#click search button
b.frame(:name, "lefto").button(:name => "B7").click

#wait five seconds for "rmid" frame to load
sleep 5

#check for search term--if it is in "rmid frame, continue, else, move on to next term
term_found = b.frame(:name, "rmid").text.include? "#{i}"
if term_found != true then
next
else

#check the checkbox in results frame
b.frame(:name, "rmid").checkbox(:name => "dox").set

#click context button
b.frame(:name, "rmid").button(:name => "button3").click

#wait five seconds for "rbottom" frame to load
sleep 5

#get N minus last two pages
#what I would like to do is grab only the text and set variables so that when I write to the file, I am writing CSV data.  As the program is written, I will just grab html data which I will have to parse on the back end.
  loop do
	f.puts b.frame(:name, "rbottom").table(:index =>2).html
	next_page = b.frame(:name, "rbottom").text.include? ">>" 
	if next_page != true then
	break
	else
#if link to next page exists, do the following, if not, break
		b.frame(:name, "rbottom").link(:index =>3).click
		sleep 5
		page_next = b.frame(:name, "rbottom").link(:index =>3).href
		page_last = b.frame(:name, "rbottom").link(:index =>4).href
		if  page_next == page_last then
		f.puts b.frame(:name, "rbottom").table(:index =>2).html
		b.frame(:name, "rbottom").link(:index =>3).click
		sleep 5
		f.puts b.frame(:name, "rbottom").html
		break
		else
  end#if 1
  end#if 2
  end#if 3

#get last two pages
  

end
end

f.close

end
