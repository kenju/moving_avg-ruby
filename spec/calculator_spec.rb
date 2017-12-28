RSpec.describe MovingAvg::Calculator do
  describe ".moving_avg" do
    let(:calculator) { MovingAvg::Calculator.new(strategy: :sma) }
    let(:items) { [100, 200, 200, 500] }

    it { expect(calculator.moving_avg(items)).to eq 250.0 }
  end
end
