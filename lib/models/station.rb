class Station
  include Mongoid::Document

  field :number, type: Integer
  field :name, type: String
  field :lat, type: Float
  field :long, type: Float
  field :hight, type: Integer
  field :town, type: String
  field :state, type: String
  field :install_date, type: Date

  embeds_many :samples
  accepts_nested_attributes_for :samples

  validates_uniqueness_of :number

  def to_s
    "#{town}: #{number}"
  end

end
