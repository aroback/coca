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

#enter n-gram
b.frame(:name, "lefto").text_field(:name => "p").set "corruption"

#click search button
b.frame(:name, "lefto").button(:name => "B7").click

#wait five seconds for "rmid" frame to load
sleep 5

#check the checkbox in results frame
table = b.frame(:name, "rmid").table(:index, 2)

f.puts table

f.close
end
#b.frame(:name, "rbottom").each do |row|
#f.puts table





