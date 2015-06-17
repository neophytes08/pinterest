class PinsController < ApplicationController
  before_action :find_pin, only:[:show, :edit, :update, :destroy, :upvote, :getPin]
  before_action :authenticate_user!, except: [:index, :show , :fetch, :getPin , :save_pin]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
  end
  def new
  	@pin = current_user.pins.build
  end

  def create
  @pin = current_user.pins.build(pin_params)
  
    if @pin.save
        redirect_to @pin, notice: "Pin was Successfully save!"
      else
        render 'new'
      end
  end

  def edit

  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  #API
  def fetch 
    @allPins = Pin.all.order("created_at DESC")
    @allUsers = User.all
    render json: { pins: @allPins.to_json( :methods => [:avatar_url] ) , users: @allUsers } , status: :ok
  end
  
  def save_pin
    puts params[:title]
    render json: { status: "ok" } , status: :ok
  end

  def getPin
     response = { pin: @pin,
                  avatar: @pin.avatar_url }
    render json: response, status: :ok
  end

  private
  def pin_params
  	params.require(:pin).permit(:title, :description, :image)
  end

  def comment_params
    params.require(:comment).permit(:comment_text, :pin_id)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end  
end
