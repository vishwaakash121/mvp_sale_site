class PagesController < ApplicationController
    def home
        redirect_to deals_path if logged_in?
    end
end
