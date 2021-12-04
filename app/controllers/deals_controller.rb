class DealsController < ApplicationController

    # after_action, around_action : HW
	before_action :set_deal, only: [:show, :edit, :update, :destroy, :sell_product]
	before_action :require_user
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def show
	end
	
	def index
		@deals = Deal.where(state: 'active')
	end
	
	def edit
	end

	def new
			@deal = Deal.new
	end

	def create
		@deal = Deal.new(deal_params)
		@deal.user = current_user
		if @deal.save
				flash[:notice] = "Deal was created successfully."
				redirect_to deal_path(@deal)
		else 
				render 'new'
		end
	end

	def update
		if @deal.update(deal_params)
				flash[:notice] = "Deal was updated successfully."
				redirect_to @deal
		else
				render 'edit'
		end
	end

	def destroy
		@deal.destroy
		redirect_to deals_path
	end

	def sell_product
		Deal.transaction do
			if @deal.is_already_purchased?(current_user)
				@deal.update!(quantity: @deal.quantity - 1)
				flash[:notice] = "Successfully purchased the product"
			else
				flash[:error] = "Deal can be used single time by a user"
			end
		end
		redirect_back(fallback_location: root_path)
	end

	private

	def set_deal
		@deal = Deal.find(params[:id])
	end

	def deal_params
		params.require(:deal).permit(Deal.columns.map(&:name))
	end

	def require_same_user
		if current_user != @deal.user && !current_user.admin?
			flash[:alert] = "You can only edit or delete your own deal."
			redirect_to @deal
		end
	end
end