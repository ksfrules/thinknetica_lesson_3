class Route

  attr_reader :total_station_list, :begin_station, :final_station

  def initialize (begin_station, final_station)
    @begin_station = begin_station
    @final_station = final_station
    @tranzit_station_list = []
    @total_station_list = [@begin_station] + @tranzit_station_list + [@final_station]
  end

  def add_station(station)
    @tranzit_station_list << station
    @total_station_list = [@begin_station] + @tranzit_station_list + [@final_station]
  end

  def remove_station(station)
    @tranzit_station_list.delete(station)
    @total_station_list = [@begin_station] + @tranzit_station_list + [@final_station]
  end

  def print_station_list
    @total_station_list.each  {|item| puts item.name}
  end

end
