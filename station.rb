class Station

  attr_reader :train_list, :name 

  def initialize (name)
    @name = name
    @train_list = []
    @pas_train_list = []
    @cargo_train_list = []
  end

  def welcome (train)
    @train_list << train
  end

  def goodbye (train)
    @train_list.delete(train)
  end

  def pas_list
    amount = 0
    train_list.each {|item|
      if item.type == "passenger"
        puts item
        amount += 1
      end 
    }
    puts "total passenger trains =  #{amount}"
  end

  def cargo_list
    amount = 0
    train_list.each {|item|
      if item.type == "cargo"
        puts item
        amount += 1
      end 
    }
    puts "total cargo trains =  #{amount}"
  end

end
