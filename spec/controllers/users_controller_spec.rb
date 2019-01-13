require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    request.env['HTTP_REFERER'] = root_url
    @user = User.new(:email => 'el@el.com', :password => '1234567')
    @user.save
  end
  
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      get :edit, params: { id: @user.id }
      assigns(:user).should eq(@user)
    end
  end

end
