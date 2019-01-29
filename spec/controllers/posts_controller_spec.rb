require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    request.env['HTTP_REFERER'] = root_url
    @user = User.create!(email: 'test@test.com', password: 'testtest')
    allow(controller).to receive(:current_user) { instance_double('User', :id => @user.id) }
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #create' do
    it 'assigns a newly created posts as @post' do
      post :create, :params => {:post => {content: 'content' } }
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to be_persisted
    end
  end

  describe 'PUT #create - flash notice' do
    it 'post handle empty content and flash' do
      post :create, :params => {:post => {description: ''} }
      expect(controller).to set_flash[:notice]
      expect(response).to redirect_to root_url
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested post as @post' do
      post = Post.create!(content: 'content')
      get :edit, params: { id: post.id }
      assigns(:post).should eq(post)
    end
  end
  
  describe 'GET #show' do
    it 'should show post' do
      post = Post.create!(content: 'content')
      get :show, params: { id: post.id }
      expect(response.status).to eq(200)
    end
  end

end
