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

#wait five seconds for "rmid" frame to load
sleep 5

#check the checkbox in results frame
b.frame(:name, "rmid").checkbox(:name => "dox").set

#click context button
b.frame(:name, "rmid").button(:name => "button3").click

#wait five seconds for frame to load
sleep 5

Nokogiri::HTML.parse(b.frame(:name, "rbottom").html)

b.frame(:name, "rbottom").each do |row|
puts row.text
end




