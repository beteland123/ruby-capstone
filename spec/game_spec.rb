describe Game do
  describe '#can_be_archived?' do
    context 'when the game is not archived and last played more than 2 years ago' do
      it 'returns true' do
        Time.now
        (3 * 365 * 24 * 60 * 60) # 3 years ago
        game = Game.new('04/3/2023', true, '2021-01-01')

        expect(game.can_be_archived?).to be(false)
      end
    end

    context 'when the game is not archived and last played less than 2 years ago' do
      it 'returns false' do
        Time.now
        (1 * 365 * 24 * 60 * 60) # 1 year ago
        game = Game.new('04/3/2023', true, '2021-01-01')

        expect(game.can_be_archived?).to be(false)
      end
    end

    context 'when the game is already archived' do
      it 'returns true' do
        Time.now
        (3 * 365 * 24 * 60 * 60) # 3 years ago
        game = Game.new('04/3/2023', true, '2021-01-01')
        game.archive

        expect(game.can_be_archived?).to be(false)
      end
    end
  end
end
