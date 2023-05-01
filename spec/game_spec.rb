require 'game'

RSpec.describe Game do
  describe '#roll' do
    it 'adds the number of pins to the rolls array' do
      game = Game.new
      game.roll(3)
      expect(game.instance_variable_get(:@rolls)).to eq([3])
    end
  end

  describe '#score' do
    context 'when the player rolls a gutter game' do
      it 'returns a score of 0' do
        game = Game.new
        20.times { game.roll(0) }
        expect(game.score).to eq(0)
      end
    end

    context 'when the player rolls a game of all ones' do
      it 'returns a score of 20' do
        game = Game.new
        20.times { game.roll(1) }
        expect(game.score).to eq(20)
      end
    end

    context 'when the player rolls a spare' do
      it 'adds the spare bonus to the frame score' do
        game = Game.new
        game.roll(5)
        game.roll(5)
        game.roll(3)
        17.times { game.roll(0) }
        expect(game.score).to eq(16)
      end
    end

    context 'when the player rolls a strike' do
      it 'adds the strike bonus to the frame score' do
        game = Game.new
        game.roll(10)
        game.roll(3)
        game.roll(4)
        16.times { game.roll(0) }
        expect(game.score).to eq(24)
      end
    end

    context 'when the player rolls a perfect game' do
      it 'returns a score of 300' do
        game = Game.new
        12.times { game.roll(10) }
        expect(game.score).to eq(300)
      end
    end

    context 'when the player rolls a game with spares and strikes' do
      it 'returns the correct score' do
        game = Game.new
        game.roll(10)
        game.roll(5)
        game.roll(5)
        game.roll(7)
        game.roll(2)
        game.roll(10)
        game.roll(10)
        game.roll(10)
        game.roll(9)
        game.roll(0)
        game.roll(8)
        game.roll(2)
        game.roll(9)
        game.roll(1)
        game.roll(10)
        expect(game.score).to eq(187)
      end
    end
  end
end
