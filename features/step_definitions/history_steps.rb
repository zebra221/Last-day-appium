Given(/^I create history item in the history section$/) do 
   step "I am in the \"Numbers\" screen by swiping down"
   step "I have selected \"Decimal\" as base numbers"
   step "I have selected \"Roman numerals\" as the conversion type"
   step "I enter \"10\" on the keyboard and see \"X\" in the conversion section"
end
  
And(/^The numbers are saved$/) do
    @saved_data = SavedData.new(@saved_data.base_value, @saved_data.conversion_value)
  end
  
  And(/^I see that conversions are being saved correctly$/) do
    historyLine = @driver.find_element(id: 'history_single_line')
    historyLine.click
    expect(@pages.numbers_screen.conversion_section_text).to eql @saved_data.conversion_value
    expect(@pages.numbers_screen.base_section.text).to eql @saved_data.base_value
  end