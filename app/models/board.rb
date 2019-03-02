class Board < ApplicationRecord
  after_create :generate_board

  BALTER_BEERWORKS = ['Good Neighbor', 'Maypop', 'Firebelly', 'Bear Blend']
  ALLIANCE_BREWING_COMPANY = ['Citra Blonde', 'Citra Mosaic Simcoe IPA',
    'Cubano coffee Brown', 'Kolsch', 'Outmeal Stout', 'Saison 4', 'Scotch Ale']
  PRETENTIOUS_BREWING_COMPANY = ['Perennial Smoke, Rosemary', 'Glassholes, Amarillo & Mosaic Edition',
    'Shout Out Saison', 'Imperial Table (tennis) Beer', 'Cathedral V. Enigma',
    'Honey Honey Honey', 'New Kids On the Floc', 'Abandoned Belgian Mansion With A View of A Vineyard',
    'Cowboy Henk, A Belgo', 'Clammy Wallop', 'Sultry V. Adam With Peaches, Pomegranate And White Tea',
    'Da Dank Drank', 'Two Legged Snake, Azacca Edition', 'Televangelist, An Al Pastor DIPA',
    '#superdupertrendyAF, Blueberry Pomegranate Creamsicle', 'Old School Is the New New School',
    'Attaboy', 'Surly Mistress', 'Burly Mistress', "Where There's Smoke, There's Fire",
    'Samuel Jackson’s M——- F——- Rye Wine', 'Beyond Logic And Raisin']
  LAST_DAYS_OF_AUTUMN = ['Pardon My Garden Double IPA', 'Pardon My Garden IPA', 'Biff’s Best IPA',
    'Juicy J IPA Series', 'Rye Pale Ale', 'Rye Pale Ale', 'Chamhopnay', 'Sharkbait Blonde Ale',
    'Last Days Berliner Weisse', 'Kentucky Common', 'Double Salted Caramel Porter',
    'Smoked Brown Ale', 'Delph’s Coffee Stout', 'Pre Prohibition Ale']
  CRAFTY_BASTARD = ['ESB', 'Vanilla Stout', 'Crafty Bastard Stratosphere 11.0',
    'Bourbon Barrel Imperial Scotch Ale', 'Framboise', 'Spicy Ginger Ale',
    'The Crafty Russian Imperial Stout', 'Big Bastard DIPA', 'Imperial Milk Stout',
    'Tessellation IPA', 'Hop Candy IPA']
  ELKMONT_EXCHANGE = ['Wheat & Rye Lager', 'Elkmont Table Beer With Blackberry',
    'Light Lager', 'Vienna Lager', 'Hefeweizen', 'American Pale Ale', 'India Pale Lager (IPL)',
    'Elkmont Table Beer', 'Norwegian Farmhouse Ale with Butternut Squash',
    'Norwegian Farmhouse Ale with Roasted Peaches', 'Post Modern Funk', 'Botanical Rye Farmhouse Ale',
    'Brown Ale', 'Outmeal Stout', 'Imperial Stout', 'IPA', 'Multigrain IPA', 'Rye IPA',
    'Wild IPA', 'Hoppy Belgian', 'Double IPA', 'Coffee Lager', 'Light Lager With Grapefruit',
    'Barrel Aged Smoked & Spiced Porter']
  DOWNTOWN_GRILL_AND_BREWERY = ['White Mule Ale', 'Woodruff IPA', 'New World Porter', 'Nut Brown Ale',
    'State Street Stout', 'Downtown Blonde Ale', 'Alt', "Grey Beard's Barley Wine"]
  BREWERIES = [PRETENTIOUS_BREWING_COMPANY, LAST_DAYS_OF_AUTUMN,
    BALTER_BEERWORKS, ALLIANCE_BREWING_COMPANY, CRAFTY_BASTARD,
    ELKMONT_EXCHANGE, DOWNTOWN_GRILL_AND_BREWERY]
  def generate_board
    25.times do
      beer = BREWERIES.sample.sample
      compressed_beers = beers.map{ |x| x[:beer] }

      while compressed_beers.include?(beer)
        beer = BREWERIES.sample.sample
      end
      beers << { beer: beer, drank: false }
    end
    beers[12] = { beer: 'Get on the bus', drank: true}
    save
  end
end
