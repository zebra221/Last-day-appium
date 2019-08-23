Given(/^I have selected "(.*)" as base numbers$/) do |type|
    @pages.numbers_screen.select_base_type type
end

And(/^I have selected "(.*)" as the conversion type$/) do |type|
    @pages.numbers_screen.conversion_type type
end

And(/^I enter "(.*)" on the keyboard$/) do |number|
    @pages.keyboard.input_number number
end

And(/^I see "(.*)" in the conversion section$/) do |number|
    expect(@pages.numbers_screen.conversion_section_text).to eql number
end

And(/^I enter "(.*)" on the keyboard and see "(.*)" in the conversion section$/) do |base_value, conversion_value|
    step "I enter \"#{base_value}\" on the keyboard"
    step "I see \"#{conversion_value}\" in the conversion section"
    @saved_data = SavedData.new(base_value, conversion_value)
end