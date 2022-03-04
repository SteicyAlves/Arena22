module Print
    def save_print(file_name, result)
        file_path = "reports/screenshots/test_#{result}"
        image = "#{file_path}/#{file_name}.png"
        page.save_screenshot(image)
        attach(image, 'image/png')        
    end
end