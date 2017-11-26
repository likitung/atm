

desc "First report for get products after Amazon Connect"
task :my_count => :environment do
  count
end


def count
  @amount = AtmBanknote.where(atm_id: 1).all

  banknotes = Banknote.order(value: :desc).all
  banknote_hash = {}
  banknotes.each do |banknote|
    banknote_hash[banknote.value] = 0
  end

  @amount.each do |one_operation|
    if one_operation.deposit?
      banknote_hash[one_operation.banknote.value] += one_operation.amount
    end
    if one_operation.withdraw?
      banknote_hash[one_operation.banknote.value] -= one_operation.amount
    end
  end

  @result = 237

  @resulting_hash = {}

  p "Current Bankomat cash"
  p banknote_hash

  p "Current BANKNOTE Values------------"
  p "//////////////////////////////////////////////"

  banknotes.each do |bank|
    # break if @result.zero?
    p "NEW LOOP"
    next if banknote_hash[bank.value].to_i == 0
    cash = @result
    p banknote_hash[bank.value]

    @result = @result.divmod(bank.value)
    p @result
    number_of_needed_banknotes = @result[0]
    ostatok = @result[1]
    evaliable_bunknotes = banknote_hash[bank.value]

    p " Начальня сума #{cash}"
    p " Количество нужных банкнот #{number_of_needed_banknotes}"
    p " Остаток от деления #{ostatok}"
    p " Number of evailble bunknotes #{banknote_hash[bank.value]}"

    @result = evaliable_bunknotes - number_of_needed_banknotes

    if number_of_needed_banknotes > evaliable_bunknotes
      number_of_needed_banknotes = evaliable_bunknotes
    else
      @result = 0
    end

    @result = @result.abs * bank.value + ostatok

    p "Результрующая сумма после первого прохода #{@result}"

    @resulting_hash[bank.value] = number_of_needed_banknotes

    p "СКОЛЬКО МОЖНО ВЗЯТЬ БАНКНОТ #{@resulting_hash[bank.value]}"
  end

  p "FINAL RESULT"
  p @resulting_hash
end