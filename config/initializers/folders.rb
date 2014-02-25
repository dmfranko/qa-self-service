screensDirectory = Rails.root.join('app/assets', 'images','screens')
Dir.mkdir(screensDirectory.to_s) if ! Dir.exists?(screensDirectory.to_s)