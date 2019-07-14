class TallyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tally_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
