require './features/modules/base_side_menu'
# contains all side menu elements
class SideMenu < BaseSideMenu

  def initialize(driver)
    @driver = driver
  end

  def side_menu_sections
    @driver.find_elements(id: 'drawerCategoryName')
  end

end