module ApplicationCable
  class Channel < ActionCable::Channel::Base


  def subscribed
    stream_from "messages"
  end

  end


end

# ApplicationCable::Channel

	class NotificationChannel < ApplicationCable::Channel
	  def subscribed
	    stream_from "messages"
	  end

	  def unsubscribed
	    # TODO: Any cleanup needed when channel is unsubscribed
	  end
	end
