class MailWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  def perform
    Timeout::timeout(60 * 60) {
      TestMailer.test_email.deliver
    }
  end
end
