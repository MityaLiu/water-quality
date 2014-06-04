require 'spec_helper'

describe WaterSample do
  it { should validate_presence_of(:site) }
  it { should validate_presence_of(:chloroform) }
  it { should validate_presence_of(:bromoform) }
  it { should validate_presence_of(:bromodichloromethane) }
  it { should validate_presence_of(:dibromichloromethane) }

  let(:water_sample) { FactoryGirl.create(:water_sample) }
  let(:factor_weights) { FactoryGirl.create(:factor_weights) }
  
  context 'find' do
    it 'sould return an object' do
      ws = WaterSample.find(water_sample.id)
      expect(ws).to_not be_nil
      expect(ws).to eq(water_sample)
    end
    
    it 'sould contain correct values' do
      ws = WaterSample.find(water_sample.id)
      
      expect(ws.site).to eq('LA Aquaduct Filteration Plant Effluent')
      expect(ws.chloroform).to eq(0.00104)
      expect(ws.bromoform).to eq(0)
      expect(ws.bromodichloromethane).to eq(0.00149)
      expect(ws.dibromichloromethane).to eq(0.00275)
    end
  end

  context 'factor' do
    it 'should return correct value' do
      water_sample.factor(factor_weights.id).should eq(0.003067)
    end
  end

  context 'all_factors' do
    it 'should calculate all the factors' do
      fw = FactoryGirl.create(:factor_weights)
      expect(water_sample.all_factors).to eq({:"factor_#{fw.id}" => water_sample.factor(fw.id)})
    end
  end

  context 'to_hash' do
    it 'should return all the attributes' do
      expect(water_sample.to_hash).to eq(water_sample.attributes)
    end

    it 'should return all the attributes and factors' do
      hash = water_sample.to_hash(true)
      expect(hash).to include(water_sample.attributes)
      expect(hash).to include(water_sample.all_factors)
    end
  end

end
