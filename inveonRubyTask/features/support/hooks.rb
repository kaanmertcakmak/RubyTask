#encoding: UTF-8
After do |scenario|
  take_screenshot(@browser, scenario)
end

def take_screenshot(browser, scenario)
  if scenario.failed?
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = './failed_png/' + time + ' - ' + scenario_name + '.png'
  end
  page.save_screenshot(screenshot_path)
end

