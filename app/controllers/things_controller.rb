class ThingsController < ApplicationController
  before_action :set_store
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  
  def index
    @things = @store.things
  end

  def show
  end

  def new
    @thing = @store.things.new
    render partial: "form"
  end
  
  def create
    @thing = @store.things.new(thing_params)
    if @thing.save
      redirect_to [@store, @thing]
    else
      render :new
    end
  end
  
  def edit
    # render partial: "form"
  end

  def update
    if @thing.update
      redirect_to store_things_path
    else 
      render :edit
    end
  end

  def destroy
    @thing.destroy
    redirect_to store_things_path
  end

  private
  
    def set_store
      @stores = Store.find(params[:store_id])
    end

    def set_thing
      @thing = Thing.find(params[:id])
    end

    def thing_params
      params.require(:thing).permit(:name, :price, :color)
    end

end
