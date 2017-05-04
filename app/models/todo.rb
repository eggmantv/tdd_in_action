class Todo < ApplicationRecord

  belongs_to :user

  enum state: %i[incomplete complete]

end
