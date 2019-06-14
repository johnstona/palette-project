class LikesController < ApplicationController

    def new
        @like = Like.new
    end

    def create
        if logged_in?
            like = Like.create like_params
            redirect_to like
        else
            redirect_to :login
        end
    end
    
end
