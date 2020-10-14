require 'rails_helper'

RSpec.describe 'UsersController', type: :controller do
  describe 'GET #new' do
    subject { get :new }
  end
end
