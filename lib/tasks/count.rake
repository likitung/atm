desc "First report for get products after Amazon Connect"
task :seed => :environment do
  seed
end

def seed
  Atm.create(name:"first ATM")
  Banknote.create(value: '1')
  Banknote.create(value: '2')
  Banknote.create(value: '5')
  Banknote.create(value: '10')
  Banknote.create(value: '25')
  Banknote.create(value: '50')
end