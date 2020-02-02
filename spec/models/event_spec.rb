require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'associations' do
    it { should belong_to(:catagory) }
    it { should have_many(:tickets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number_of_tickets) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:catagory_id) }
  end

  context 'Model Method - availble_ticket_count - return ticket count' do
    it 'should return a ticket count as string' do
      catagory = create(:catagory)
      event = create(:event, catagory_id: catagory.id)
      create_list(:ticket, 5, event_id: event.id, purchaser_id: nil)
      binding.pry
      expect(event.availble_ticket_count).to eq("5")
    end
  end

  context 'Model Method - availble_ticket_count' do
    it 'should return a ticket count as Sold Out' do
      user = create(:user, type: "Normal")
      catagory = create(:catagory)
      event = create(:event, catagory_id: catagory.id)
      create_list(:ticket, 5, event_id: event.id, sold_originally: true, purchaser_id: user.id)
      expect(event.availble_ticket_count).to eq("Sold Out!")
    end
  end

  context 'Model Method - tickets_for_marketplace' do
    it 'should return all tickets marked true on_resell' do
      user = create(:user, type: "Normal")
      catagory = create(:catagory)
      event = create(:event, catagory_id: catagory.id)
      create_list(:ticket, 2, event_id: event.id, purchaser_id: user.id, on_resell: true)
      expect(event.tickets_for_marketplace.count).to eq(2)
    end
  end

end
