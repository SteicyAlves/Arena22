class ReportBuilderGenerator
    
    def add_screenshot(scenario)
        nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
        nome_cenario = nome_cenario.gsub(' ','_').downcase!
        screenshot = "reports/screenshots/#{nome_cenario}.png"
        page.save_screenshot(screenshot)
        embed(screenshot, 'image/png', 'Print :)')
    end
    
    def add_browser_logs
        time_now = Time.now
        # Getting current URL
        current_url = Capybara.current_url.to_s
        # Gather browser logs
        logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
    # Remove warnings and info messages
        logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
        logs.any? == true
        embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
    end
    
#    at_exit do
#        time = Time.now.getutc
#        ReportBuilder.configure do |config|
#        config.json_path = 'reports/report.json'
#        config.report_path = 'reports/cucumber_web_report'
#        config.report_types = [:html]
#        config.report_tabs = %w[Visão Geral das Funcionalidades e Cenários de Erros]
#        config.report_title = 'Resultados do Teste Automatizado Web do Arena 22'
#        config.compress_images = false
#        config.additional_info = { 'Projeto' => 'Arena22', 'Plataforma' => 'Integração', 'Navegador' => ENV["BROWSER"].capitalize ,'Relatório Gerado' => time }
#        end
#        ReportBuilder.build_report
#    end
end