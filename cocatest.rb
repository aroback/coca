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
b.frame(:name, "lefto").text_field(:name => "p").set "corruption"

#click search button
b.frame(:name, "lefto").button(:name => "B7").click

#wait five seconds for "rmid" frame to load
sleep 5

#check the checkbox in results frame
b.frame(:name, "rmid").checkbox(:name => "dox").set

#click context button
b.frame(:name, "rmid").button(:name => "button3").click

#wait five seconds for frame to load
sleep 5

#table = Nokogiri::HTML.parse(b.frame(:name, "rbottom").html)
f.puts b.frame(:name, "rbottom").text
#b.frame(:name, "rbottom").div(:id, "some-id").fire_event "onmouseover"
end

f.close

#b.frame(:name, "rbottom").each do |row|
#f.puts table





