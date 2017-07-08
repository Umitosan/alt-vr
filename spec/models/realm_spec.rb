require 'rails_helper'

describe Realm do

  it { should validate_presence_of :name }

  it { should have_many :reviews }

end
