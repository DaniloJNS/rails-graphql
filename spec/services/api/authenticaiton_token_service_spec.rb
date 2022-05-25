require 'rails_helper'

describe Api::GoogleCloud::Auth::AuthenticationTokenService do
  let(:token) { described_class.call(1) }

  it 'return an authentication token' do
    decoded_token = JWT.decode token,
                               described_class::HMAC_SECRET,
                               true,
                               { algoritm: described_class::ALGORITM_TYPE }

    decoded_token.map!(&:symbolize_keys)

    expect(decoded_token).to eq([{ credentials: 1 }, { alg: 'HS256' }])
  end

  it 'decode an authentication token' do
    expect(described_class.decode(token)).to eq({ credentials: 1 })
  end
end
