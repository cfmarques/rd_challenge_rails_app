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

      it 'Track job was enqueued with tracking instance' do
        ActiveJob::Base.queue_adapter = :test

        expect{
          post :track, params: params
        }.to have_enqueued_job(TrackJob)
      end

      it 'returns status code 202' do
        post :track, params: params
        expect(response.status).to eq(202)
      end
    end
  end
end
