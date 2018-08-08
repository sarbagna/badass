require 'watir'
require 'colorize'
b = Watir::Browser.new #By default Watir will open a Chrome Browser

Given ("I am at www.google.com") do
  b.goto "https://www.google.com"
end

When ("I enter atos in the search field") do
  t = b.text_field name: 'q'
  t.exists?
  t.set("atos")
end

When ("I hit Google Search") do
  btn = b.button name: 'btnK'
  btn.exists?
  btn.click
end

Then ("I see a results page") do
  dv = b.div(id: 'resultStats').wait_until_present
  puts dv.text
  expect(b.title.include?("atos - Google Search")).to be true #false will lead to step failure
  b.close
end
