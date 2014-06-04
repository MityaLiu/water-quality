# Represents water quality sampled  at various sites.
class WaterSample < ActiveRecord::Base
  validates :site, :chloroform, :bromoform, :bromodichloromethane,
    :dibromichloromethane, presence: true

  # Finds a record by given id.
  #
  # @param [Fixnum] sample_id
  # @raise [ActiveRecord::RecordNotFound] Raised if record is not found.
  # @return [WaterSample]
  def self.find(sample_id)
    super
  end

  # A list of contaminants studied in this sample.
  #
  # @return [Hash]
  def contaminants
    self.attributes.keys - %w(id site)
  end

  # Linear combination of the nth {FactorWeights}.
  #
  # @param [Fixnum] factor_weights_id
  # @raise [ActiveRecord::RecordNotFound] Raised if record is not found.
  # @return [Float]
  def factor(factor_weights_id)
    weights = FactorWeights.find(factor_weights_id)
    
    contaminants.map {|contaminant|
      factor_weight = weights["#{contaminant}_weight"] || 0
      factor_weight * self[contaminant]
    }.sum
  end
  
  # A list of factors for all {FactorWeights}.
  #
  # @return [Hash]
  def all_factors
    Hash[FactorWeights.ids.map {|factor_weights_id|
      [:"factor_#{factor_weights_id}", factor(factor_weights_id)]
    }]
  end

  # Converts object to a hash.
  #
  # @return [Hash]
  def to_hash(include_factors = false)
    result = self.attributes
    result.merge(all_factors) if include_factors
    result
  end
end
