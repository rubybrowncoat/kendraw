class SharedActivesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'shared_actives'
  end
end
