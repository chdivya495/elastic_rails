module Api
  module V1
    class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :update, :destroy]

      def index
        @query = params[:query]
        if @query.present?
        @courses = Course.search(@query)
        else
        @courses = Courses.all
        end

        render json: @courses
      end

      def show
        render json: @course
      end

      def create
        @course = Course.new(course_params)

        if @course.save
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      def update
        if @course.update(course_params)
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @course.destroy
          render json: @course.errors, status: :unprocessable_entity
        else
          render json: "Course with id #{params[:id]} Successfully Deleted"
        end
      end

      private

      def set_course
        @course = Course.find(params[:id])
      end

      def course_params
        params.require(:course).permit(:name, :author, :state, :category_id)
      end
    end
  end
end
