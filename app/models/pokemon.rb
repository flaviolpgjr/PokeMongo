class Pokemon
  include Mongoid::Document
  field :name, type: String
  field :image_url, type: String
  field :atacks, type: Array
  field :special_atacks, type: Array
end
