# coding: utf-8

class AddTransactionToAtm
  prepend SimpleCommand
  attr_reader :banknotes, :atm

  def initialize(atm, banknotes, operation)
    @banknotes = banknotes
    @atm = atm
    @operation = operation
  end

  def call
    ActiveRecord::Base.transaction do
      @banknotes.each do |key, value|
        banknote = Banknote.find_by(value: key)
        deposit = AtmBanknote.new(atm: @atm, banknote: banknote, amount: value, operation: @operation)
        deposit.save!
      end
    end
  rescue => exception
    errors.add(:deposit, exception.to_s)
  end
end
