class TallyChannel < ApplicationCable::Channel
  def subscribed
    debugger
    stream_from "tally_channel_#{params[:place_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
