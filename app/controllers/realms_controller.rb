class RealmsController < ApplicationController
  before_action :authorize, only: [:index, :new, :create, :show]

  def index
    @realms = Realm.all
  end

  def new
    @realm = Realm.new
  end

  def create
    @realm = Realm.new(realm_params)
    if @realm.save
      flash[:notice] = "( realm saved )"
      redirect_to realms_path
    else
      render :new
    end
  end

  def show
    @realm = Realm.find(params[:id])
  end

  def edit
    @realm = Realm.find(params[:id])
  end

  def update
    @realm = Realm.find(params[:id])
    if @realm.update(realm_params)
      redirect_to realms_path
    else
      render :edit
    end
  end

  def destroy
    @realm = Realm.find(params[:id])
    realmName = @realm.name
    @realm.destroy
    flash[:notice] = "( Realm '#{realmName}' deleted forever )"
    redirect_to realms_path
  end

  private

  def realm_params
    params.require(:realm).permit(:name, :description, :price, :image_url)
  end


end
