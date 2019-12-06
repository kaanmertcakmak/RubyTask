#encoding: UTF-8
After do |scenario|
  if scenario.failed?
    take_screenshot(@browser, scenario)
  end
  time = Time.now.getutc

  ReportBuilder.configure do |configure|
    configure.json_path = 'results/report.json'
    configure.report_path = 'results/cucumber_web_report'
    configure.report_types = [:html]
    configure.report_tabs = %w[Overview Features Scenarios Errors]
    configure.report_title = 'Cucumber web automation test results'
    configure.compress_images = false
    configure.additional_info = { 'Project name' => 'Test', 'Platform' => 'Integration', 'Report generated' => time }
  end
  ReportBuilder.build_report
end

def take_screenshot(browser, scenario)
  scenario_name = scenario.name.gsub /[^\w\-]/, ' '
  time = Time.now.strftime("%Y-%m-%d %H%M")
  screenshot_path = './failed_png/' + time + ' - ' + scenario_name + '.png'
  page.save_screenshot(screenshot_path)
end




