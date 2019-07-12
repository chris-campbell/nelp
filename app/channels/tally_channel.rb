class TallyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tally_channel"
    stream_from "tally_channel_#{params[:place_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
