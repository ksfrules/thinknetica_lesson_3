class Train
  attr_reader :current_speed, :railcar_quantity, :station_index, :type

  def initialize(number, type, railcar_quantity)
    @number =  number
    @type = type
    @railcar_quantity = railcar_quantity
    @current_speed = 0
  end

  def increase_speed(value)
    @current_speed += value
  end

  def decrease_speed(value)
    @current_speed -= value
    if @current_speed < 0 
      @current_speed = 0
    end
  end

  def add_railcar
    @railcar_quantity += 1 if @current_speed == 0
    puts "Can't add railcar the train is moving" if @current_speed > 0
  end

  def remove_railcar
    @railcar_quantity -= 1 if @current_speed == 0 && @railcar_quantity > 0
    puts "Can't add railcar the train is moving" if @current_speed > 0
    puts "There are no railcars" if @railcar_quantity == 0
  end

  def take_route(route)
    @station_index = 0
    @current_route = route
    @current_route.stations[0].welcome(self)
  end

  def current_station
    @current_route.stations[@station_index]
  end

  def previous_station
    if @station_index == 0
      nil
    else
      @current_route.stations[@station_index - 1]
    end
  end

  def next_station
    @current_route.stations[@station_index + 1]
  end

  def go_forward
    if @station_index == @current_route.stations.length -  1
      puts "We are currently at the final station of the route, only go back"
    else
      @current_route.stations[@station_index].goodbye(self)
      @station_index += 1
      @current_route.stations[@station_index].welcome(self)
    end
  end

  def go_back
    if @station_index == 0
      puts "We are currently at the begin station of the route, only go forward"
    else
      @current_route.stations[@station_index].goodbye(self)
      @station_index -= 1
      @current_route.stations[@station_index].welcome(self)
    end
  end

end
