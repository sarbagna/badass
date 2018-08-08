#######################################################
#   Major Events:                                     #
#   Step Definition File - reads data from YAML       #
#######################################################
require 'watir'
require 'colorize'
require 'yaml'

b = Watir::Browser.new #By default Watir will open a Chrome Browser; Else Watir::Browser.new :firefox
$m = "\r\n*************:Console:************* \n\r"

#$env = ARGV[0]    #reads from CMD line argument 
config = YAML.load_file("./config.yml")
#puts config.inspect
$url = config["Dev"]["url"]  #Dev/Stage/Prod
$mcount = config["menu-left"]["menu-count"]
$mclick1 = config["menu-left"]["menu-click1"]
$mclick2 = config["menu-left"]["menu-click2"]


Before do
  # Do something before each scenario
#  puts "OUTPUT: "+$mcount #Dir.pwd  
end

Given ("User is at Login Page") do 
  b.goto($url) ##{config[$env]["url"]}
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
    $m = $m + "Failed Login\n\r"
  else    
    spn = b.div(:data_ref => 'innerCt')
    spn.exists?
    $m = $m + "Good Login!\n\r"
  end
end

Given("User is Logged in to Dashboard Page") do
  #pending # Write code here that turns the phrase above into concrete actions
end

Given("User clicks on primary link on the left hand nav") do
  #count the vertical menu items
  mdv = b.div(:class => 'x-grid-item-container').wait_until_present  #=> Finds DIV with class 'x-grid-item-container'
  tbls = mdv.tables
  sleep(2)  #else tables are not populated
  $m = $m + "Menu Items: "+ b.tables.count.to_s
  #expand the menu through double click
  spn = b.span(:class => 'x-tree-node-text  ', :text => $mclick1)
  spn.exists?
  spn.double_click
  spn = b.span(:class => 'x-tree-node-text', :text => $mclick2)
  spn.exists?  
  spn.double_click  
end

Then("User sees linked tab opend with listing of primary menu") do
  spn = b.div(:class => ['x-title-text x-title-text-default x-title-item'], :text => $mclick1) #need error handling
  spn.exists?
  spn = b.div(:class => ['x-toolbar-text x-box-item x-toolbar-item x-toolbar-text-default'], :text => /Displaying/) #need error handling
  spn.exists?  
  puts "Count: "+spn.text
end

After do
  #b.close
  sleep(3) #Say cheese! 
  b.screenshot.save ("screen.png")  
  puts $m
end