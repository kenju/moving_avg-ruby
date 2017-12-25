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
end
