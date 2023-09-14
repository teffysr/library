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
    let(:loan) { create(:loan) }
    it 'returns a success response' do
      get :show, params: { id: loan.id }
      expect(response).to be_successful
    end

    it 'returns a not found response for non-existent loan' do
      get :show, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do

    let(:book) { create(:book) }
    let(:user) { create(:user) }
    context 'with valid params' do
      it 'creates a new loan' do
        expect do
          post :create, params: { user_id: user.id, book_id: book.id }
        end.to change(Loan, :count).by(1)
      end

      it 'renders a JSON response with the new loan' do
        post :create, params: { user_id: user.id, book_id: book.id }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        post :create, params: { user_id: nil, book_id: book.id }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #return' do
    let(:loan) { create(:loan) }
    let(:book) { create(:book) }

    it 'returns a success response' do
      put :return, params: { id: loan.id }
      expect(response).to be_successful
    end

    it 'returns a not found response for non-existent loan' do
      put :return, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end

    it 'updates the loan to returned and the book availability to true' do
      # loan = Loan.create! valid_attributes
      # book = Book.create!(title: 'Sample Book', author: 'Author', editorial: 'Editorial', available: false)
      put :return, params: { id: loan.id }
      loan.reload
      book.reload
      expect(loan.returned).to be(true)
      expect(book.available).to be(true)
    end
  end
end
