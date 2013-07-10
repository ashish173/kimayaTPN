require 'spec_helper'

describe TpnMarketAdditive do
  
  it "is invalid without name" do
    expect(build(:tpnMarketAdditive, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a market name" do
    expect(build(:tpnMarketAdditive, market_name: nil)).to have(1).errors_on(:market_name)
  end

  it "is invalid if constant is not a number" do
    expect(build(:tpnMarketAdditive, constant: "some constant")).to have(1).errors_on(:constant)
  end

  it "is invalid if constant is not present" do
    expect(build(:tpnMarketAdditive, constant: nil)).to have(2).errors_on(:constant)
  end

  it "is invalid without unit" do
    expect(build(:tpnMarketAdditive, unit: nil)).to have(1).errors_on(:unit)
  end

end
