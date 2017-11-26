module Api::V1
  class UptimeController < ApiController
    include ActionView::Helpers::DateHelper

    def show
      @data = {
        started_at: Time.now,
      }
      render json: @data, status: 200
    end
  end
end
