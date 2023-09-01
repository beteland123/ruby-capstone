describe Game do
  describe '#can_be_archived?' do
    context 'when the game is not archived and last played more than 2 years ago' do
      it 'returns true' do
        last_played_at = Time.now - (3 * 365 * 24 * 60 * 60) # 3 years ago
        game = Game.new('2021-01-01', true, last_played_at)

        expect(game.send(:can_be_archived?)).to be(false)
      end
    end

    context 'when the game is not archived and last played less than 2 years ago' do
      it 'returns false' do
        last_played_at = Time.now - (1 * 365 * 24 * 60 * 60) # 1 year ago
        game = Game.new('2021-01-01', true, last_played_at)

        expect(game.send(:can_be_archived?)).to be(false)
      end
    end

    context 'when the game is already archived' do
      it 'returns true' do
        last_played_at = Time.now - (3 * 365 * 24 * 60 * 60) # 3 years ago
        game = Game.new('2021-01-01', true, last_played_at)
        game.archive

        expect(game.send(:can_be_archived?)).to be(false)
      end
    end
  end
end
