class Route

  attr_reader :stations, :begin_station, :final_station

  def initialize(begin_station, final_station)
    @stations = [begin_station, final_station]
  end

  def add_station(station)
    @stations.insert(@stations.length - 1, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def print_station_list
    @stations.each  {|item| puts item.name}
  end

end
