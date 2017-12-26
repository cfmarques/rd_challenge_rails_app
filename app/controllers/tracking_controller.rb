class TrackingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def track
    tracking = Tracking.new(tracking_params)

    if tracking.valid?
      TrackJob.perform_later(tracking_params.to_h)
      render json: {}, status: :accepted
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def tracking_params
    params.require(:tracking).permit(
      :email,
      accessed_pages: [ :url, :pathname, :datetime ]
    )
  end
end
