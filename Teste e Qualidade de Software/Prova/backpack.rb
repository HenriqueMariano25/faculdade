class Backpack
  def initialize(capacity)
    @capacity = capacity
    @itens = []
  end

  def add(item)
    if item.quantity < available_space
      if @itens.include?(item)
        item.add_quantity
      else
        @itens << item
        item.add_quantity
      end
    end
  end

  def items
    @itens
  end

  def available_space
    @capacity - @itens.reduce(0){ |res , item| res + item.total_size }
  end

  def quantity(item)
    item.quantity
  end
end

class Item
  attr_reader :size, :quantity, :name
  def initialize(name,size,quantity = 0)
    @name = name
    @size = size
    @quantity = quantity
  end

  def total_size
    @quantity * @size
  end

  def alter_quantity(quantity)
    @quantity = quantity
  end

  def add_quantity
    @quantity += 1
  end
end
