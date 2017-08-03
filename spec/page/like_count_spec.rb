require 'spec_helper'

RSpec.describe 'Fb::Page#like_count' do

  context 'given a page with insights data' do
    let(:user) { Fb::User.new access_token: ENV['FB_TEST_ACCESS_TOKEN'] }
    let(:page) { user.pages[1] }

    it 'returns the number of likes for the page' do
      expect(page.like_count).to be_a(Integer)
    end

    it 'returns less likes if given an until date' do
      most_recent = page.like_count
      with_until = page.like_count until: Date.today - 7
      expect(with_until).to be_a(Integer)
      expect(with_until).to be < most_recent
    end
  end
end
