require 'watir'
require 'colorize'

b = Watir::Browser.new #By default Watir will open a Chrome Browser
$m = "info"

#Before do
  # Do something before each scenario
  #$b = Watir::Browser.new #By default Watir will open a Chrome Browser  
#end

Given ("User is at Login Page") do
  b.goto "https://mtoms-og20g.mev.atos.net/ctn"
end

Given("User enters {string} and {string}") do |string1, string2|
  un = b.text_field name: 'j_username'
  un.exists?
  un.set(string1)
  pw = b.text_field name: "j_password"
  pw.exists?
  pw.set(string2)
end  

And ("User hits Login") do
  btn = b.button(:class => ['doPost button'], :text => 'Login')
  btn.wait_until_present
  btn.click
end

Then("User sees a {string} page") do |string|
  err = b.div(:id => 'errorMessage')
  if(err.exists?)
      $m = "Failed Login"
  else    
    spn = b.div(:id => 'panel-1044-innerCt')
    spn.exists?
    $m = spn.text
  end
  puts "Hello world -->"+$m
  #expect(b.title.include?(string)).to be true #false will lead to step failure
  #b.close
end

After do
#  b.close
end