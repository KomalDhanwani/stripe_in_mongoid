class Plan
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :subscriptions


  field :name, type: String
  field :price, type: Integer
  
  validates_presence_of :name

end
