require 'nokogiri'
require 'open-uri'

require "#{File.dirname(__FILE__)}/main.rb"

task default: %w[load_data]

task :load_data do
  doc = Nokogiri::XML(open(ENV['URL_XML']))


  doc.xpath('//ajax-response/RedEstaciones/Estacion').each do |link|
    station = {}
    station[:number] = link.xpath("numero").text.to_i
    station[:name] = link.xpath("nombre").text
    station[:lat] = link.xpath("latitud").text.to_f
    station[:long] = link.xpath("longitug").text.to_f
    station[:hight] = link.xpath("altura").text.to_i
    station[:town] = link.xpath("localidad").text
    station[:state] = link.xpath("provincia").text
    station[:install_date] = Date.strptime(link.xpath("fechaInstalacion").text, "%d/%m/%Y")
    s=Station.find_or_initialize_by(station)
    if s.save
      puts s
    end

    sample = {}

    sample[:sample_date] = DateTime.strptime(link.xpath("fechaMuestra").text, "%d/%m/%Y %H:%M")
    sample[:temp] = link.xpath("temperatura").text.to_f
    sample[:temp_min] = link.xpath("temperaturaMinima").text.to_f
    sample[:temp_max] = link.xpath("temperaturaMaxima").text.to_f
    sample[:humidity] = link.xpath("humedad").text.to_i
    sample[:dew_point] = link.xpath("puntoRocio").text.to_f
    sample[:feels] = link.xpath("sensacionTermica").text.to_f
    sample[:wind] = link.xpath("velocidadViento").text.to_f
    sample[:wind_direction] = link.xpath("direccionViento").text
    sample[:precipitation_day] = link.xpath("precipitacionDia").text.to_f
    sample[:precipitation_week] = link.xpath("precipitacionSemana").text.to_f
    sample[:precipitation_month] = link.xpath("precipitacionMes").text.to_f

    sa = Sample.find_or_initialize_by(sample)

    s.samples << sa
    
  end

end
