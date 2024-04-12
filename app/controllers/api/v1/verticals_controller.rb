module Api
  module V1
		class VerticalsController < ApplicationController
  		before_action :set_vertical, only: [:show, :update, :destroy]

		  def index
				@query = params[:query]

		    if @query.present?
		      @verticals = Vertical.search(@query)
		    else
		      @verticals = Vertical.all
		    end

		    render json: @verticals
		  end

		  def show
		    render json: @vertical
		  end

		  def create
		    @vertical = Vertical.new(vertical_params)

		    if @vertical.save
		      render json: @vertical
		    else
		      render json: @vertical.errors, status: :unprocessable_entity
		    end
		  end

		  def update
		    if @vertical.update(vertical_params)
		      render json: @vertical
		    else
		      render json: @vertical.errors, status: :unprocessable_entity
		    end
		  end
		  
		  def destroy
        if @vertical.destroy
          render json: @vertical.errors, status: :unprocessable_entity
        else
          render json: "Vertical with id #{params[:id]} Successfully Deleted"
        end
      end

		  private

	    def set_vertical
	      @vertical = Vertical.find(params[:id])
	    end

	    def vertical_params
        params.require(:vertical).permit(:name, categories_attributes: [:name, :state])
	    end
		end
	end
end
