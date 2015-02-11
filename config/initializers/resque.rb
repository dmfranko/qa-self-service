=begin
module Resque # :nodoc:

  # Module to include in your worker class to get resque-status
  # and resque-scheduler integration
  module ScheduledJobWithStatus

    extend ActiveSupport::Concern

    included do
      # Include status functionalities
      include Resque::Plugins::Status
    end

    # :nodoc:
    module ClassMethods

      # This method will use a custom worker class to enqueue jobs
      # with resque-scheduler plugin with status support
      def enqueue_at(timestamp, *args)
        class_name = self.to_s # store class name since plain class object are not "serializable"
        Resque.enqueue_at(timestamp, JobWithStatusRunner, class_name, *args)
      end

      # Identical to enqueue_at but takes number_of_seconds_from_now
      # instead of a timestamp.
      def enqueue_in(number_of_seconds_from_now, *args)
        puts args
        enqueue_at(Time.now + number_of_seconds_from_now, *args)
      end

    end
  end

  # Wrapper worker for enqueuing
  class JobWithStatusRunner
    # default queue for scheduling jobs with status
    @queue = :delayed

    # Receive jobs from {Resque::ScheduledJobWithStatus} queue them in Resque
    # with support for status informations
    def self.perform(status_klass, *args)
      # Retrieve original worker class
      klass = status_klass.to_s.constantize
      # Check if supports status jobs
      unless klass.included_modules.include? Resque::Plugins::Status
        Rails.logger.warn("Class #{klass} doesn't support jobs with status")
        return false
      end
      Rails.logger.debug("Enqueing jobs #{klass} with arguments #{args}")
      klass.create(*args)
    rescue NameError
      Rails.logger.error("Unable to enqueue jobs for class #{status_klass} with args #{args}")
      false
    end
  end
end

=end

# simple worker class
# class SleepJob
# 
  # # This provides integrations with both resque-status and resque-scheduler
  # include Resque::ScheduledJobWithStatus
# 
  # # Method triggered by resque
  # def perform
    # total = (options['length'] || 60).to_i
    # 1.upto(total) { |i| at(i, total, "At #{i} of #{total}"); sleep(1) }
  # end
# 
# end

# run the job delayed
#SleepJob.enqueue_in(5.minutes)
# or
#SleepJob.enqueue_at(5.minutes.from_now)

# module Resque
  # class JobWithStatus
    # # Wrapper API to forward a Resque::Job creation API call into
    # # a JobWithStatus call.
    # def self.scheduled(queue, klass, *args)
      # create(*args)
    # end
# 
    # def self.enqueue_at(queue, klass, *args)
      # create(*args)
    # end
# 
  # end
# end

module ResqueScheduler
  def job_to_hash(klass, args)
    {:class => klass.to_s, :args => args, :queue => queue_from_class(klass), :custom_job_class => klass.to_s}
  end  
  def job_to_hash_with_queue(queue, klass, args)
    {:class => klass.to_s, :args => args, :queue => queue, :custom_job_class => klass.to_s}
  end
end

Resque.extend ResqueScheduler

Resque.redis = "localhost:6379" # default localhost:6379
Resque::Plugins::Status::Hash.expire_in = (24 * 60 * 60) # 24hrs in seconds