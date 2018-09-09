class Genre < ApplicationRecord
  belongs_to :book

  TYPE = ['Science fiction', 'Satire', 'Drama', 'Action and Adventure', 'Romance', 'Mystery', 'Horror', 'Self help', 'Fantasy']

end

