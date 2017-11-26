# coding: utf-8

class DepositToAtm
  prepend SimpleCommand
  attr_reader :banknotes, :atm

  def initialize(atm, banknotes)
    @banknotes = banknotes
    @atm = atm
  end

  def call
    ActiveRecord::Base.transaction do
      @banknotes.each do |key, value|
        banknote = Banknote.find_by(value: key)
        deposit = AtmBanknote.new(atm: @atm, banknote: banknote, amount: value)
        deposit.save!
      end
    end
  rescue => exception
    errors.add(:deposit, exception.to_s)
  end
end
