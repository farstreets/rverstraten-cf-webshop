class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 'data' argument will contain the product ID.
  def listen(data)
    stop_all_streams
    stream_for data["product_id"]
  end
end
