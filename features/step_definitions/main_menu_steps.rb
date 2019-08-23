Given(/^I am on Home screen$/) do
  @pages.keyboard.keyboard.displayed?
end

When(/^I press on Menu icon$/) do
  @pages.header_section.invoke_side_menu
end

When(/^I swipe (right|left)$/) do |direction|
  MOBILE.swipe(direction)
end

When(/^I select "([^"]*)" category by swiping (.*)$/) do |category, direction|
  @pages.side_menu.select_category(category, direction)
end

Then('I should see side menu') do
  expect(@pages.side_menu.side_menu_sections).not_to be_empty
end

Given(/^I am in the "(.*)" screen by swiping (.*)$/) do |screen_name, direction|
  @pages.header_section.invoke_side_menu
  @pages.side_menu.select_category(screen_name, direction)
end