class Address < ApplicationRecord
  belongs_to :resident, polymorphic: true
end
