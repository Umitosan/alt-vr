class RealmsController < ApplicationController

  def index
    @realms = Realm.all
  end

end
