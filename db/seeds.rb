finn = User.create(
  password: '123456',
  first_name: 'Finn',
  last_name: 'Stöcker',
  email: 'stoecki@der-ball-ist-rund.net'
)

kira = User.create(
  password: '123456',
  first_name: 'Kira',
  last_name: 'Katze',
  email: 'kira@katze.com'
)

hugo = User.create(
  password: '123456',
  first_name: 'Hugo',
  last_name: 'Hase',
  email: 'hugo@hase.com'
)

finns_party = Party.create(
  date: Date.new(2016, 8, 6),
  title: 'Finns Geburtstagsfeier',
  user: finn
)

kiras_party = Party.create(
  date: Date.new(2016, 9, 6),
  title: 'Kiras Geburtstagsfeier',
  user: kira
)

WishListItem.create(
  name: 'Lego Vulkan-Forschungstruck 60121',
  img_url: 'http://cache.lego.com/r/catalogs/-/media/catalogs/products/city/volcano%20explorers/lego_60121_web_pri_1488.jpg?l.r2=-2065780416',
  location: 'toysRus',
  price: 19.99,
  user: finn
)

WishListItem.create(
  name: 'Lego WeltRaumjet mit Transporter 60079',
  img_url: 'http://cache.lego.com/r/catalogs/-/media/catalogs/products/product%20portal/pri_1488/lego_60079_prod_pri_1488.jpg?l.r2=1220832522',
  location: 'toysRus',
  price: 49.99,
  user: finn
)

guest_kira = Guest.create(
  party: finns_party,
  user: kira
)

guest_hugo = Guest.create(
  party: finns_party,
  user: hugo
)

guest_hugo = Guest.create(
  party: kiras_party,
  user: finn
)
