class Api::ApiController < ApplicationController
  before_filter :set_default_render_format

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(class_name = nil, message = nil)
    class_name ||= params[:controller].classify.demodulize.underscore

    render json: {
      code: 404,
      errors: [message || "Couldn't find #{class_name} with id=#{params[:id]}"]
    }, status: :not_found
  end

  private

    def set_default_render_format
      request.format = :json
    end

end
