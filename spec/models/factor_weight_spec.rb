require 'spec_helper'

describe FactorWeights do
  it { should validate_presence_of(:chloroform_weight) }
  it { should validate_presence_of(:bromoform_weight) }
  it { should validate_presence_of(:bromodichloromethane_weight) }
  it { should validate_presence_of(:dibromichloromethane_wieight) }

  let(:factor_weights) { FactoryGirl.create(:factor_weights) }
end
