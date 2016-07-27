finn = User.all.select { |u| u.email = 'stoecki@der-bll-ist-rund.net' }[0]
finn ||= User.create(
  password: '123456',
  first_name: 'Finn',
  last_name: 'Stöcker',
  email: 'stoecki@der-ball-ist-rund.net'
)

unless finn.parties.any?
  Party.create(
    date: Date.new(2016, 8, 6),
    title: 'Finns Geburtstagsparty',
    user: finn
  )
end

WishListItem.create(
  user: finn,
  name: 'Playmobil 6042 Gespenst',
  location: 'Rossmann',
  img_url: 'http://mytoys.scene7.com/is/image/myToys/ext/3536856-02.jpg?$rtf_mt_prod-main_xl$',
  price: 8.99
)

WishListItem.create(
  user: finn,
  name: 'Lego 31028 Wasserflugzeug',
  location: 'Rossmann',
  img_url: 'https://www.conrad.de/medias/global/ce/2000_2999/2600/2600/2609/1294469_RB_00_FB.EPS_1000.jpg',
  price: 4.99
)

WishListItem.create(
  user: finn,
  name: 'Lego 71012 Minifiguren',
  location: 'Rossmann',
  img_url: 'http://i.ebayimg.com/images/g/HQ8AAOSw-RRXDAC0/s-l300.jpg',
  price: 2.99
)

WishListItem.create(
  user: finn,
  name: 'Lego 60072 Abriss Experten',
  location: 'Rossmann',
  img_url: 'https://assets.galeria-kaufhof.de/media/716388?format=rmain',
  price: 9.99
)

WishListItem.create(
  user: finn,
  name: 'Lego 60072 Star Wars AT-AT',
  location: 'Rossmann',
  img_url: 'https://images-na.ssl-images-amazon.com/images/I/51LozDODdwL._SX425_.jpg',
  price: 7.00
)

WishListItem.create(
  user: finn,
  name: 'Lego 70599 Ninjago Master of Soinjitzu',
  location: 'Rossmann',
  img_url: 'http://www.toysrus.de/graphics/product_images/pTRUDE1-7438412dt.jpg',
  price: 9.99
)
