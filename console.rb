require_relative('model/bounty.rb')

bounty1 = Bounty.new(
  {'name' => 'Robbie', 'bounty_value' => '500', 'favourite_weapon' => 'Sword', 'homeworld' => 'Earth'}
)

bounty2 = Bounty.new(
  {'name' => 'Pat', 'bounty_value' => '800', 'favourite_weapon' => 'Laser Gun', 'homeworld' => 'Mars'}
)

bounty3 = Bounty.new(
  {'name' => 'Pawel', 'bounty_value' => '100', 'favourite_weapon' => 'Banana', 'homeworld' => 'Moon'}
)


p Bounty.find_by_name('Pat')
p Bounty.find_by_id(1)



# # bounty3.save()
# bounty3.delete()
