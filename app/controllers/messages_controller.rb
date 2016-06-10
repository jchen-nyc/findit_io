class MessagesController < ApplicationController
  def index
    @q = Message.ransack(params[:q])
    @messages = @q.result(:distinct => true).includes(:recipient, :item)
    # @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    @message.item_id = params[:item_id]
    @message.recipient_id = params[:recipient_id]
    @message.user_id = params[:user_id]
    @message.message = params[:message]

    number_to_send_to = @message.recipient.phone_number

    twilio_sid = "ACb3e9823198eff9d9f21e2bc283e212c5"
    twilio_token = "9ca6ba7302212af7d9e6ac575d77a8ce"
    twilio_phone_number = "16072164346"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.messages.create(
    :from => "+1#{twilio_phone_number}",
    :to => number_to_send_to,
    :body => "From #{current_user.email}:
    #{@message.message}
    Locaton: #{@message.item.location}",
    # :media_url => "http://localhost:3000#{@message.item.image}"
    )

    if @message.save
      redirect_to "/messages", :notice => "Message sent successfully."
    else
      render 'new'
    end

  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    @message.item_id = params[:item_id]
    @message.recipient_id = params[:recipient_id]
    @message.user_id = params[:user_id]
    @message.message = params[:message]

    number_to_send_to = @message.recipient.phone_number

    twilio_sid = "ACb3e9823198eff9d9f21e2bc283e212c5"
    twilio_token = "9ca6ba7302212af7d9e6ac575d77a8ce"
    twilio_phone_number = "16072164346"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
    :from => "+1#{twilio_phone_number}",
    :to => number_to_send_to,
    :body => "From #{current_user.email}:
    #{@message.message}
    Locaton: #{@message.item.location}",
    :media_url => "#{@message.item.image}"
    )

    if @message.save
      redirect_to "/messages", :notice => "Message resent successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    redirect_to "/messages", :notice => "Message deleted."
  end
end
