require './features/modules/base_numbers'
# contains all application's keyboard elements
class NumbersScreen < BaseNumbersScreen
  def initialize(driver)
    @driver = driver
  end

  def type_element(type)
    type_elements = @driver.find_elements(id: 'select_unit_spinner')
    case type
    when 'base'
      type_elements.first
    when 'conversion'
      type_elements.last
    else
      raise 'Unsupported type'
    end
  end

  def type_popup_elements
    @driver.find_elements(id: 'select_unit_spinner_menu_name')
  end

  def conversion_section_element
    @driver.find_element(id: 'target_value')
  end
  def base_section_element
    @driver.find_element(id: 'source_value')
  end

end
