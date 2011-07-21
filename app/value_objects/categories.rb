# This module is used to add basic categories to stock items
#
module Categories
  # Returns all possible categories
  #
  def self.all
    ['breakfast', 'vegetable', 'legume', 'fruit', 'fish', 'meat', 'sauces',
      'drinks', 'pasta', 'snack', 'lactic', 'other', 'hygiene', 'clean' ]
  end
end
