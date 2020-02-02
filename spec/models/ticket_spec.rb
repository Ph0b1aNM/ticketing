require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
    it { should belong_to(:purchaser).class_name('User') }
  end

end
