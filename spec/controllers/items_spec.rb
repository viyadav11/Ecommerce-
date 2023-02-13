# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET index' do
    it 'renders a successful response to index page' do
      item = Item.create(name: 'a', price: 500, rating: 1)
      get :edit, params: { id: item.id }

      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    it 'renders a successful response to show page' do
      item = Item.create(name: 'a', price: 500, rating: 1)
      get :show, params: { id: item.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET edit' do
    it 'render a successful response for edit' do
      product = Item.create(name: 'a', price: 500, rating: 1)
      get :edit, params: { id: product.id }
      expect(response.status) == 200
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested product' do
      product = Item.create(name: 'a', price: 500, rating: 1)
      delete :destroy, params: { id: product.id, product: { name: 'a', description: 'abc', price: 1 } }
      expect(response.status) == 200
    end
  end

  describe 'GET New' do
    it 'renders to a new form page' do
      get :new
      expect(response.status) == 200
    end
  end
end
