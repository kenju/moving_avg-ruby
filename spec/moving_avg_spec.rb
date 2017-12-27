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
      # factor = 2.0 / (4 + 1) = 0.4
      # s_1 = 100
      # s_2 = 0.4 * 200 + 0.6 * 100 = 140
      # s_3 = 0.4 * 200 + 0.6 * 140 = 164
      # s_4 = 0.4 * 500 + 0.6 * 164 = 298.4
      expected = 298.4
      expect(actual).to eq expected
    end
  end

  describe "modified_moving_average" do
    it do
      data = [100, 200, 200, 500]
      actual = MovingAvg::Base.mma(data)
      # factor = 1.0 / 4 = 0.25
      # s_1 = 100
      # s_2 = 0.25 * 200 + 0.75 * 100 = 125
      # s_3 = 0.25 * 200 + 0.75 * 125 = 143.75
      # s_4 = 0.25 * 500 + 0.75 * 143.75 = 232.8125
      expected = 232.8125
      expect(actual).to eq expected
    end
  end
end
