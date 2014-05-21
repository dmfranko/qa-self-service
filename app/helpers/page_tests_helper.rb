module PageTestsHelper
  def determine_phase(run)
    # if both are empty call queued
    if run.end_time.nil? && run.start_time.nil?
      "Queued"
    # if start time is populated and end time not running
    elsif ! run.start_time.nil? && run.end_time.nil?
      "Running"
    # If both populated it's complete
    elsif ! run.start_time.nil? && ! run.end_time.nil?
      "Finished"
    end
  end
end
