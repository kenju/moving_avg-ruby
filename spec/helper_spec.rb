RSpec.describe MovingAvg::Helper do
  describe ".build_with_sliding" do
    it do
      items = [100, 200, 300, 400, 500]
      actual = MovingAvg::Helper.build_with_sliding(
        items: items,
        window_size: 3,
        strategy: :simple_moving_average,
      )
      expected = [
        MovingAvg::Base.sma([100, 200, 300]),
        MovingAvg::Base.sma([200, 300, 400]),
        MovingAvg::Base.sma([300, 400, 500]),
      ]
      expect(actual).to eq expected
    end
  end

  describe ".map_with_sliding" do
    it do
      items = [100, 200, 300, 400, 500]
      actual = MovingAvg::Helper.map_with_sliding(items: items, window_size: 2)
      expected = [[100, 200], [200, 300], [300, 400], [400, 500]]
      expect(actual).to eq expected
    end
  end
end
