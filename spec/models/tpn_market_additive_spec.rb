require 'spec_helper'

describe TpnMarketAdditive do
  let(:tma) { TpnMarketAdditive.create(name: "ashish", market_name: "assss", constant: 123, unit: "sfjhdf") }
  

  it "is invalid without name" do
    tma.name = nil
    expect(tma).to have(1).errors_on(:name)
  end

  it "is invalid without a market name" do
    tma.market_name = nil
    expect(tma).to have(1).errors_on(:market_name)
  end

  it "is invalid if constant is not a number" do
    tma.constant = "asd"
    p tma.errors.full_messages
    expect(tma).to have(1).errors_on(:constant)
  end
  it "is invalid if constant is not present" do
    tma.constant = nil
    expect(tma).to have(2).errors_on(:constant)
  end
  it "is invalid without unit" do
    tma.unit = nil
    expect(tma).to have(1).errors_on(:unit)
  end

end
