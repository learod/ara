# <numero>32001</numero>
# <nombre>Virasoro</nombre>
# <latitud>-28.089</latitud>
# <longitud>-56.0299</longitud>
# <altura>149</altura>
# <localidad>Virasoro</localidad>
# <provincia>Corrientes</provincia>
# <fechaInstalacion>18/12/2013</fechaInstalacion>

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


  validates_uniqueness_of :number

end
