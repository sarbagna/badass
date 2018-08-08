require 'watir'
require 'colorize'

Before do
  # Do something before each scenario
  $b = Watir::Browser.new #By default Watir will open a Chrome Browser  
end

Given ("User is at Login Page") do
  $b.goto "https://mtoms-og20g.mev.atos.net/ctn"
end

Given("User enters {string} and {string}") do |string1, string2|
  un = $b.text_field name: 'j_username'
  un.exists?
  un.set(string1)
  pw = $b.text_field name: "j_password"
  pw.exists?
  pw.set(string2)
end  

And ("User hits Login") do
  btn = $b.button(:class => ['doPost button'], :text => 'Login')
  btn.wait_until_present
  btn.click
end

Then("User sees a {string} page") do |string|
  err = $b.div(:id => 'errorMessage')
  err.exists?
  puts "Invalid Login"
  spn = $b.span(:id => 'tab-1046-btnInnerEl')
  spn.exists?
  puts spn.text
  #expect(b.title.include?(string)).to be true #false will lead to step failure
  #b.close
end

After do
  $b.close
end