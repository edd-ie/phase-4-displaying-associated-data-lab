class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_record
    def index
        items = Item.all
        render json: items, include: :user
    end

    private
    def no_record
        render json: {error: 'No record found'}, status: :not_found
    end
end
