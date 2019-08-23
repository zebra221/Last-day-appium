# APPIUM WORKSHOP

## Getting started

### Creating environment

1. Download VirtualBox software from https://www.virtualbox.org/;
2. Download VirtualBox Extension Pack;
3. Install VirtualBox;
4. Install Extension Pack
5. Download pre-configured virtual machine;
6. Add the VM image to VirtualBox;

### Accessing physical device through VM

1. If VM has been started, shut it down;
2. Connect device to a USB port on the host machine;
3. In VirtualBox app, right click on the VM;
4. Select Settings;
5. Select "Ports" tab;
6. Select USB 3.0 checkbox;
7. Click on the add a USB device filter button (One of the buttons with a + sign, next to USB device filters section)
8. Select the device;
9. Save changes;
10. Start up the VM;
11. Type `adb devices` in terminal to confirm (device ID should be listed there)
12. On physical device allow access permissions (be sure to check the always allow checkbox)

### Running the project

1. Start appium server (`appium` command in terminal or using the executable)
2. In terminal: navigate to project's directory
3. Install app using `adb install -r PreciseUnitConversion.apk`
4. Run command `cucumber`

### Excercise

1. Create 2 scenarios for History feature:

   - Scenario which checks that the previous conversions are being saved

     - Create feature file
     - Create step definitions file
     - Parent class with actions
     - Child class with elements
     - Create a new object in Pages class (e.g. `History.new`)

   - Scenario which checks that the proper information is displayed if the user selects one of the history items
     - Reuse as much as possible
     - BONUS (we did not use it in our examples): create a class which manages test data:
     ```ruby
     class SavedConversionData
         attr_reader :base_value, ...
         def initialize(base_value, ...)
             @base_value = base_value
             ...
         end
     end
     ```
     Save the data within step definitions:
     ```ruby
     And(/^Some step$/) do
        base_value = @pages.numbers.entered_text
        conversion_value = @pages.numbers.conversion_section_text
        @saved_data = SavedConversionData.new(base_value, conversion_value)
     end
     ```
     Then use the data:
     ```ruby
     And(/^I check that the value is the same  as when I navigate back from history$/)
     expect(@pages.numbers.base_section_text).to eql @saved_data.base_value
     ```

2. Add app installation on runtime:
   - Use "app" capability (http://appium.io/docs/en/writing-running-appium/caps/)
3. Add a command line argument for the parallel runner so that we can run it with specific tags:
   - Quick way: https://code-maven.com/argv-the-command-line-arguments-in-ruby)
   - Advanced way: https://ruby-doc.org/stdlib-2.5.3/libdoc/optparse/rdoc/OptionParser.html (don't forget to add `require optparse`)
