require 'spec_helper'

require 'cgi'
require 'tempfile'

describe SFax do
  let(:encryption_key) { 'a' * 32 }
  let(:init_vector) { 'z' * 16 }
  let(:file) { Tempfile.new('abc.pdf') }

  let(:faxer) { SFax::Faxer.new('user', 'api_key', init_vector, encryption_key) }
  let(:fake_faraday) { double('faraday') }
  let(:fake_faraday_response) { double('faraday_response', body: '{}') }

  before do
    @request_urls = []

    allow(Faraday).to receive(:new).and_return(fake_faraday)
    allow(fake_faraday).to receive(:post) do |url|
      @request_urls << url
      fake_faraday_response
    end
  end

  describe '#send_fax' do
    describe 'OptionalParams' do
      it 'leaves OptionalParams empty if they are not provided' do
        faxer.send_fax('+15555551212', file.path, 'Todd')
        optional_params_string = @request_urls.last.match('OptionalParams=(.*)&')[1]
        expect(optional_params_string).to eq('')
      end

      it 'can send additional OptionalParams when faxing' do
        faxer.send_fax(
          '+15555551212',
          file.path,
          'Todd',
          {
            'TrackingCode' => 'CoolFax id 12345',
            'CoverPageRemarks' => 'CoolFax id 12345'
          }
        )

        optional_params_string = @request_urls.last.match('OptionalParams=(.*)&')[1]
        actual_optional_params = optional_params_string.split(';').map { |pair| pair.split('=') }
        expected_optional_params = [
          ['TrackingCode', URI.escape('CoolFax id 12345')],
          ['CoverPageRemarks', URI.escape('CoolFax id 12345')]
        ]
        expect(actual_optional_params).to eq(expected_optional_params)
      end
    end
  end
end
