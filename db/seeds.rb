finn = Person.create(
  first_name: 'Finn',
  last_name: 'Stöcker',
  email: 'stoecki@der-ball-ist-rund.net'
)

finns_party = Party.create(
  date: Date.new(2016, 8, 6),
  title: 'Finns Geburtstagsfeier',
  person: finn
)

