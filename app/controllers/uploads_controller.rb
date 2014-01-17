class UploadsController < ApplicationController  
  skip_filter CASClient::Frameworks::Rails::Filter
  
  def create  
    #screen = b.screenshot.base64
    #RestClient.post('http://localhost:3000/uploads#new', :my_file => screen)
    #RestClient.post 'http://localhost:3000/uploads#new', :my_file => File.new("/Users/admin/Desktop/Screen Shot 2014-01-08 at 2.08.14 PM.png", 'rb')

    newName = "#{SecureRandom.uuid}.png"
    File.open(File.join("public/uploads", newName), 'wb') do|f|
      f.write(Base64.decode64(params["my_file"]))
    end
    
    respond_to do |format|
      format.json { render :json => {:status => "File Uploaded",:name => newName}.to_json}
    end
  end
  
  private 
  
  def skip_login? 
      true 
  end 
end
