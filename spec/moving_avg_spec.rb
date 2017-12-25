RSpec.describe MovingAvg do
  it "has a version number" do
    expect(MovingAvg::VERSION).not_to be nil
  end

  describe "simple_moving_average" do
    it do
      data = [100, 200, 200, 500]
      actual = MovingAvg::Base.sma(data)
      expected = 250.0
      expect(actual).to eq expected
    end
  end

  describe "weighted_moving_average" do
    it do
      data = [100, 200, 200, 500]
      actual = MovingAvg::Base.wma(data)
      expected = (100 * 4 + 200 * 3 + 200 * 2 + 500 * 1).to_f / (4 + 3 + 2 + 1)
      expect(actual).to eq expected
    end
  end

  describe "exponentially_weighted_moving_average" do
    it do
      data = [100, 200, 200, 500]
      actual = MovingAvg::Base.ewma(data)
      expected = 298.4
      expect(actual).to eq expected
    end
  end
end
