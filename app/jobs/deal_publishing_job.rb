class DealPublishingJob < ActiveJob::Base
	queue_as :default

	def perform
		deal = Deal.where(publish_date: Date.today).last
		if deal.present?
			begin
				Deal.update_all(state: 'archive')
				deal.update(state: 'active')
			rescue => exception
				logger = Rails.logger
				logger.info "error occured during publishing #{deal.id}"
			end
		end
	end
end