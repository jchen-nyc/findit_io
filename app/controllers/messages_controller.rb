class MessagesController < ApplicationController
  def index
    @messages = Message.all
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

    if @message.save
      redirect_to "/messages", :notice => "Message updated successfully."
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
