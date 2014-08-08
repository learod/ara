class Sample
  include Mongoid::Document

    field :sample_date, type: DateTime
    field :temp, type: Float
    field :temp_max, type: Float
    field :temp_min, type: Float
    field :humidity, type: Integer
    field :dew_point, type: Float
    field :feels, type: Float
    field :wind, type: Float
    field :wind_direction, type: String
    field :precipitation_day, type: Float
    field :precipitation_week, type: Float
    field :precipitation_month, type: Float
    field :operative, type: Integer
    field :record, type: Integer
    field :note, type: String

    validates :sample_date, uniqueness: { scope: [:temp] }
    embedded_in :station

end
