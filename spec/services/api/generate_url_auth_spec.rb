require 'rails_helper'

describe Api::GoogleCloud::Auth::GenerateUrlAuthService do
  context 'generate url' do
    it 'with successfully' do
      expect(described_class.call[:url]).to include 'https://www.googleapis.com/auth/userinfo.profile'
    end
  end
end
