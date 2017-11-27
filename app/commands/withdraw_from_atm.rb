# coding: utf-8

class WithdrawFromAtm
  prepend SimpleCommand
  attr_reader :atm, :amount

  def initialize(atm, amount)
    @atm = atm
    @amount = amount.to_i
  end

  def call
    atm_operations = AtmBanknote.where(atm_id: @atm.id).all

    banknotes = Banknote.order(value: :desc).all

    banknotes_hash = {}

    banknotes.each do |banknote|
      banknotes_hash[banknote.value] = 0
    end

    atm_operations.each do |one_operation|
      if one_operation.deposit?
        banknotes_hash[one_operation.banknote.value] += one_operation.amount
      end
      if one_operation.withdraw?
        banknotes_hash[one_operation.banknote.value] -= one_operation.amount
      end
    end

    @resulting_hash = {}

    banknotes.each do |banknote|
      next if banknotes_hash[banknote.value].to_i == 0

      @amount = @amount.divmod(banknote.value)
      number_of_needed_banknotes = @amount[0]
      modulo = @amount[1]
      evaliable_banknotes = banknotes_hash[banknote.value]
      @amount = evaliable_banknotes - number_of_needed_banknotes

      if number_of_needed_banknotes > evaliable_banknotes
        number_of_needed_banknotes = evaliable_banknotes
      else
        @amount = 0
      end

      @amount = @amount.abs * banknote.value + modulo

      unless number_of_needed_banknotes.zero?
        @resulting_hash[banknote.value] = number_of_needed_banknotes
      end
    end

    raise('No money') if @amount > 0

    command = AddTransactionToAtm.call(@atm, @resulting_hash, :withdraw)

    unless command.success?
      errors.add(:withdraw, command.errors[0])
    end
  rescue => exception
    errors.add(:withdraw, exception.to_s)
  else
    @resulting_hash
  end
end
