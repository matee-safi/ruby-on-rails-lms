class PagesController < ApplicationController
  def Index
  end

  def Home
    # Assuming `latest_courses` is defined in CoursesController
    courses_controller = CoursesController.new
    courses_controller.latest_courses

    # Now @courses should be available in the PagesController
    @courses = courses_controller.instance_variable_get(:@courses)
  end

  def Dashboard
  end
end
