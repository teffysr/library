require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let(:valid_attributes) do
    {
      user_id: 1,
      book_id: 1,
      returned: false
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a not found response for non-existent loan' do
      get :show, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end


  describe 'PUT #return' do
    it 'returns a not found response for non-existent loan' do
      put :return, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
