require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

  describe "get#index" do 
    it "renders the users index" do 
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  describe "get#show" do 
    before(:each) do 
      create(:user)
    end

    it "renders the users show" do
       get(:show, params: { id: User.last })
       expect(response).to render_template(:show)
    end
  end

  describe "get#new" do
    it "renders the new template" do 
      get(:new)
      expect(response).to render_template(:new)
    end 
  end

  describe "post#create" do 
    before(:each) do 
      create(:user)
    end
    let(:valid_params) {{user:{username: "hello", password: "puppies"}} }
    let(:invalid_params) {{user:{username: "hello", password: "puke"}} }

    context "with valid params" do
      # it "logs in user" do
      #   post(:create, params: valid_params)
      #   expect(User.last.logged_in?).to be(true)
      # end
      it "redirects to user show page" do
         post(:create, params: valid_params)
         expect(response).to redirect_to(user_url(User.last.id))
      end
    end

    context "with invalid params" do
      before(:each) do
        post(:create, params: invalid_params)
      end
      it "shows errrrror on page" do
        expect(flash.now[:errors]).to be_present
      end

      it "renders the same page" do
          expect(response).to render_template(:new) 
      end

    end
  end

  

end