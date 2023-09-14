require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'John Doe',
      identification: '123456789',
      email: 'john@example.com',
      address: '123 Main St',
      phone: '555-123-4567'
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a list of users' do
      user = create(:user)
      get :index
      expect(assigns(:users)).to include(user)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end

    it 'returns a not found response for non-existent user' do
      get :show, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect do
          post :create, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post :create, params: valid_attributes
        expect(assigns(:user)).to be_persisted
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        post :create, params: { user: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do

    context 'with valid params' do
      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, name: 'Updated Name' }
        user.reload
        expect(user.name).to eq('Updated Name')
      end

      it 'renders a JSON response with the updated user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, name: 'Updated Name' }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    it 'returns a not found response for non-existent user' do
      put :update, params: { id: 'nonexistent', name: 'Updated Name' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end

    it 'returns a JSON response with a success message' do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }
      expect(response).to have_http_status(:see_other)
      expect(response.content_type).to eq('application/json')
      expect(JSON.parse(response.body)).to eq('message' => 'El usuario se ha eliminado correctamente')
    end

    it 'returns an error if the user does not exist' do
      delete :destroy, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
