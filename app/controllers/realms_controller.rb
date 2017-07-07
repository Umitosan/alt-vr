class RealmsController < ApplicationController

  def home
    @realms = Realm.all
  end

end
