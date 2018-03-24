require_relative '../lib/like_a_tree'

describe LikeATree do
  describe '.initialize' do
    context 'given negative height' do
      it 'explodes' do
        expect { LikeATree.new(-1) }.to raise_error 'Height must be positive'
      end
    end
  end

  describe '.draw' do
    context 'given single height' do
      it 'draws a asterix' do
        expect(LikeATree.new(1).draw).to eql ['*']
      end
    end

    context 'given small height' do
      it 'draws a small tree' do
        x = LikeATree.new 2
        expect(x.draw.length).to eql 2
        x_02 = [' *',
                '***']
        expect(x.draw).to eql x_02
      end
    end

    context 'given a proper height' do
      it 'draws an X' do
        x = LikeATree.new 11
        expect(x.draw.length).to eql 11
        x_11 = ['          *',
                '         ***',
                '        *****',
                '       *******',
                '      *********',
                '     ***********',
                '    *************',
                '   ***************',
                '  *****************',
                ' *******************',
                '*********************']
        expect(x.draw).to eql x_11
      end
    end
  end

  describe '#nearest_whole_number' do
    context 'given zero' do
      it 'returns 0' do
        x = LikeATree.new(0)
        expect(x.send(:nearest_whole_number, 0)).to eql(0)
      end
    end

    context 'given float number' do
      it 'returns a whole number' do
        x = LikeATree.new(0)
        expect(x.send(:nearest_whole_number, 88.8)).to eql(89)
      end
    end
  end
end
