class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  # before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item.all
    @items = @items.where("price >= ?", params[:price_from]) if params[:price_from]
    @items = @items.where('created_at >= ?', 1.day.ago)            if params[:today]
    @items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]
    @items = @items.order('votes_count desc', 'price desc').limit(5)
    # @items = @items.includes(:image)
  end

  def expensive
    @items = Item.where('price > 1000')
    render 'index'
  end

  # /items/1 GET
  def show
    unless @item
      render text: 'Page not found', status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    @item = Item.create(item_params)

    if @item.errors.empty?
      redirect_to item_path(@item) # items/:id
    else
      render 'new'
    end
  end

  # /items/1 PUT
  def update
    @item.update(item_params)

    if @item.errors.empty?
      flash[:success] = 'Item successfully updated!'

      redirect_to item_path(@item) # items/:id
    else
      flash.now[:error] = 'You made mistakes in your form. Please correct them.'
      render 'edit'
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy

    redirect_to action: 'index'
    # render json: { success: true }

    ItemsMailer.item_destroyed(@item).deliver
  end

  def upvote
    @item.increment!(:votes_count)

    redirect_to action: :index
  end

  private
  def item_params
    params.require(:item).permit(:price, :name, :real, :weight, :description, :image)
  end

  def find_item
    @item = Item.find(params[:id])
    render_404 unless @item
  end
end
