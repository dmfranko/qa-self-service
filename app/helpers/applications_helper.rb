module ApplicationsHelper
  def last_status(app)
    if app.tests.empty?
      "No run"
    else
      if app.tests.last.test_result_details.where(:is_pass => 0).count > 0
        "Failed" 
      else 
        "Passed"
      end
    end
  end
end
