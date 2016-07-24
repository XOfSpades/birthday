finn = User.create(
  first_name: 'Finn',
  last_name: 'Stöcker',
  email: 'stoecki@der-ball-ist-rund.net'
)

finns_party = Party.create(
  date: Date.new(2016, 8, 6),
  title: 'Finns Geburtstagsfeier',
  user: finn
)

WishListItem.create(
  name: 'Lego Vulkan-Forschungstruck 60121',
  img_url: 'http://cache.lego.com/r/catalogs/-/media/catalogs/products/city/volcano%20explorers/lego_60121_web_pri_1488.jpg?l.r2=-2065780416',
  location: 'toysRus',
  price: 19.99,
  user: finn
)

