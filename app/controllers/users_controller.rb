class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record
    def show
        user = User.find(params[:id])
        render json: user, include: :items
    end

    private
    def no_record
        render json: {error: 'No record found'}, status: :not_found
    end
end
