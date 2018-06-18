class TrackJob < ApplicationJob
  queue_as :default

  def perform(tracking_attributes)
    tracking = Tracking.new(tracking_attributes)
    Track.new.call(tracking)
  end
end
