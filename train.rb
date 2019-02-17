class Train
  attr_reader :current_speed, :railcar_quantity, :current_station, :future_station, :previous_station, :type
  def initialize (number, type, railcar_quantity)
    @number =  number
    @type = type
    @railcar_quantity = railcar_quantity
    @current_speed = 0
    @current_route = nil
    @current_station = nil
    @previous_station = nil
    @future_station = nil
    @station_counter = nil
  end

  def increase_speed (value)
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
    @railcar_quantity -= 1 if @current_speed == 0
    puts "Can't add railcar the train is moving" if @current_speed > 0
  end

  def take_route(route)
    @current_station = route.begin_station
    @station_counter = 0
    @current_route = route
    @current_station.welcome(self)
  end

  def go_forward
    if @current_station == @current_route.final_station 
      puts "We are currently at the final station of the route, only go back"
    else
      @current_station.goodbye(self)
      @previous_station = @current_station
      @station_counter += 1
      @current_station = @current_route.total_station_list[@station_counter]
      @current_station.welcome(self)
      @future_station = @current_route.total_station_list[@station_counter + 1]
    end
  end

  def go_back
    if @current_station == @current_route.begin_station 
      puts "We are currently at the begin station of the route, only go forward"
    else
      @current_station.goodbye(self)
      @previous_station = @current_station
      @station_counter -= 1
      @current_station = @current_route.total_station_list[@station_counter]
      @current_station.welcome(self)
      if @station_counter < 0
        @future_station = nil
      else
        @future_station = @current_route.total_station_list[@station_counter - 1]
      end
    end
  end

end
