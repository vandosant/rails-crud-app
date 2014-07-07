def new_wine(attributes = {})
  defaults = {
    :name => 'Poison Okra',
    :style => 'Country',
    :color => 'Green',
    :rating => 77
  }
  Wine.new(defaults.merge(attributes))
end