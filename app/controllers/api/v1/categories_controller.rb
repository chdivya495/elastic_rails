module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      def index
        @query = params[:query]

        if @query.present?
          @categories = Category.search(@query)
        else
          @categories = Category.all
        end

        render json: @categories
      end

      def show
        render json: @category
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
      
      def destroy
        if @category.destroy
          render json: @category.errors, status: :unprocessable_entity
        else
          render json: "Category with id #{params[:id]} Successfully Deleted"
        end
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :state, :vertical_id, courses_attributes: [:name, :author, :state])
      end
    end
  end
end
