class ExpireAllBusinessJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
   Business.expire_all
  end
end
