class Plant < ApplicationRecord
    validates :name, :location, :plant_type, presence:{message:"please include %{attribute}"}
    validates :name, uniqueness: {message:"Name must be unique"}
    
end
