every :day, at: '10am' do
  runner 'DealPublishingJob.new.perform'
end