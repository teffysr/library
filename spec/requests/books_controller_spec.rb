require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a list of books' do
      book = create(:book)
      get :index
      expect(assigns(:books)).to include(book)
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }

    it 'returns a success response' do
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end

    it 'return the correct book' do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

    it 'returns an error if the workbook does not exist' do
      get :show, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { title: 'Nuevo Libro', author: 'Autor', editorial: 'Editorial', available: true } }

    it 'create a new book' do
      expect {
        post :create, params: valid_attributes
      }.to change(Book, :count).by(1)
    end

    it 'returns the created workbook' do
      post :create, params: valid_attributes
      expect(assigns(:book)).to be_persisted
    end

    it 'returns an error if the workbook data is invalid' do
      post :create, params: { book: { title: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    let(:book) { create(:book) }
    let(:valid_attributes) { { id: book.id, title: 'Nuevo Libro', author: 'Autor', editorial: 'Editorial', available: true } }
    let(:invalid_attributes) { { id: 'nonexistent', title: 'Nuevo Libro', author: 'Autor', editorial: 'Editorial', available: true } }

    it 'update book details' do
      patch :update, params: valid_attributes
      book.reload
      expect(book.title).to eq(valid_attributes[:title])
    end

    it 'returns the updated workbook' do
      patch :update, params: valid_attributes
      expect(assigns(:book)).to eq(book)
    end

    it 'returns an error if the workbook does not exist' do
      patch :update, params: invalid_attributes
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'DELETE #destroy' do
    let!(:book) { create(:book) }

    it 'delete the book' do
      expect {
        delete :destroy, params: { id: book.id }
      }.to change(Book, :count).by(-1)
    end

    it 'returns a success message' do
      delete :destroy, params: { id: book.id }
      expect(response.body).to eq({ message: 'El libro se ha eliminado correctamente' }.to_json)
    end

    it 'returns an error if the workbook does not exist' do
      delete :destroy, params: { id: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end
end