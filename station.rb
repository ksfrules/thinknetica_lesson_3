class Station

  attr_reader :train_list, :name 

  def initialize(name)
    @name = name
    @train_list = []
  end

  def welcome(train)
    @train_list << train
  end

  def goodbye(train)
    @train_list.delete(train)
  end

  def train_by_type(type = nil)
    puts "total #{type} trains =  #{train_list.select{|item| item.type == type}.count}"
    train_list.select{|item| item.type == type}
  end

end
