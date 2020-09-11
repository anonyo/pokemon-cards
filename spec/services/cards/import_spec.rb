require 'rails_helper'

describe Cards::Import do
  describe '#process' do
    after(:all) do
      Card.destroy_all
    end

    it 'imports cards from pokemon endpoint' do
      # pagination is 100 be default, so we expect that many cards to get crated
      expect { described_class.new.process }.to change { Card.count }.by(100)
    end

    context 'sets card attributes' do
      let(:card) { Card.first }

      before do
        described_class.new.process
      end

      it 'sets name' do
        expect(card.name).not_to be_nil
      end

      it 'sets image url' do
        expect(card.image_url).not_to be_nil
      end

      it 'sets hit points for some' do
        expect(Card.where.not(hp: nil).last.hp).not_to be_nil
      end

      it 'sets rarity' do
        expect(card.rarity).not_to be_nil
      end
    end
  end
end
