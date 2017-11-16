require 'rails_helper'

describe TrackingController do
  describe 'post track' do
    context 'with invalid tracking parameters' do
      let(:invalid_tracking) { { email: '', accessed_pages: [] } }
      let(:params) { { tracking: invalid_tracking } }

      before do
        post :track, params: params
      end

      it 'returns status code 422' do
        expect(response.status).to eq(422)
      end
    end

    context 'with valid tracking parameters' do
      let(:accessed_pages) { [ { url: 'https://www.resultadosdigitais.com.br', pathname: '/', datetime: DateTime.current } ] }
      let(:tracking) { { email: 'cf.marques@live.com', accessed_pages: accessed_pages } }
      let(:params) { { tracking: tracking } }

      it 'call Track service with a Track instance' do
        expect_any_instance_of(Track).to receive(:call).with(an_instance_of(Tracking))
        post :track, params: params
      end

      it 'returns status code 201' do
        post :track, params: params
        expect(response.status).to eq(201)
      end
    end
  end
end
