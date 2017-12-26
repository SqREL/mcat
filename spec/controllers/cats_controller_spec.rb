require 'rails_helper'

describe CatsController do
  describe 'GET #index' do
    before do
      VCR.use_cassette 'catshevshe_and_catzetka_lists' do
        get 'index'
      end
    end

    it 'renders templates' do
      expect(response).to render_template(:index)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
