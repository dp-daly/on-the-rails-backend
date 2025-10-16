require 'rails_helper'

RSpec.describe 'Api::V1::Resources', type: :request do
  describe 'GET /api/v1/resources' do
    it 'returns a successful response' do
      get '/api/v1/resources'
      expect(response).to have_http_status(:ok)
    end

    it 'returns all resources' do
      create(:resource, title: 'Unique Title 1', link: 'Unique Link 1')
      create(:resource, title: 'Unique Title 2', link: 'Unique Link 2')
      create(:resource, title: 'Unique Title 3', link: 'Unique Link 3')
      get '/api/v1/resources'
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end

  describe 'GET /api/v1/resources/:id' do
    it 'returns the requested resource' do
      resource = create(:resource)
      get "/api/v1/resources/#{resource.id}"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(resource.id)
    end
  end

  describe 'POST /api/v1/resources' do
    let(:valid_params) { { resource: attributes_for(:resource) } }
    let(:invalid_params) { { resource: { title: '' } } }

    it 'creates a new resource with valid params' do
      expect {
        post '/api/v1/resources', params: valid_params
      }.to change(Resource, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'returns errors with invalid params' do
      post '/api/v1/resources', params: invalid_params
      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  describe 'PUT /api/v1/resources/:id' do
    let(:resource) { create(:resource) }

    it 'updates the resource with valid params' do
      put "/api/v1/resources/#{resource.id}", params: { resource: { title: 'Updated Title' } }
      expect(response).to have_http_status(:ok)
      expect(resource.reload.title).to eq('Updated Title')
    end

    it 'returns errors with invalid params' do
      put "/api/v1/resources/#{resource.id}", params: { resource: { title: '' } }
      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  describe 'DELETE /api/v1/resources/:id' do
    let!(:resource) { create(:resource) }

    it 'deletes the resource' do
      expect {
        delete "/api/v1/resources/#{resource.id}"
      }.to change(Resource, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
