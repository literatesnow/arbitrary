require_relative '../lib/x_marks_the_spot'

describe XMarksTheSpot do
  describe '.initialize' do
    context 'given negative height' do
      it 'explodes' do
        expect { XMarksTheSpot.new(-1) }.to raise_error 'Height must be positive'
      end
    end
  end

  describe '.draw' do
    context 'given single height' do
      it 'draws a asterix' do
        expect(XMarksTheSpot.new(1).draw).to eql ['*']
      end
    end

    context 'given small height' do
      it 'draws a small X' do
        x = XMarksTheSpot.new 2
        expect(x.draw.length).to eql 3
        x_03 = ['*   *',
                '  *',
                '*   *']
        expect(x.draw).to eql x_03
      end
    end

    context 'given a proper height' do
      it 'draws an X' do
        x = XMarksTheSpot.new 11
        expect(x.draw.length).to eql 11
        x_11 = ['*                   *',
                '  *               *',
                '    *           *',
                '      *       *',
                '        *   *',
                '          *',
                '        *   *',
                '      *       *',
                '    *           *',
                '  *               *',
                '*                   *']
        expect(x.draw).to eql x_11
      end
    end
  end

  describe '#nearest_odd_number' do
    context 'given zero' do
      it 'returns 1' do
        x = XMarksTheSpot.new(0)
        expect(x.send(:nearest_odd_number, 0)).to eql(1)
      end
    end

    context 'given odd number' do
      it 'returns that number' do
        x = XMarksTheSpot.new(0)
        expect(x.send(:nearest_odd_number, 15)).to eql(15)
      end
    end

    context 'given even number' do
      it 'returns an odd number' do
        x = XMarksTheSpot.new(0)
        expect(x.send(:nearest_odd_number, 8)).to eql(9)
      end
    end
  end
end
