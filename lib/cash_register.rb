require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @last_item = price * quantity
        @total += (price * quantity)
        quantity.times { @items.push(title) }
    end

    def apply_discount
        if @discount > 0
            percent_discount = @discount / 100.0
            @total = @total - (@total * percent_discount).to_i
            return "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        void_item = @items.pop(1)
        @total -= @last_item
      end


end
