require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  
  def setup
    @budget = Budget.new(name: "Groceries", amount: "23.3",
                                  description: "Bought some stuff")
  end
  
  test "Proper amounts should be valid" do
    valid_amounts = ["123.123", "123", "-123", "-123.123", "0", ".123"]
    valid_amounts.each do |valid_amount|
      @budget.amount = valid_amount
      assert @budget.valid?
    end
  end
  
  test "Improper amounts should be rejected" do
    improper_amounts = ["123.3.3", "asd", "!ASd", "123,23", ".", ""]
    improper_amounts.each do |improper_amount|
      @budget.amount = improper_amount
      assert_not @budget.valid?
    end
  end


end
