class Mission
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :image, type: String
  field :current_points, type: Integer
  field :goal_points, type: Integer
  
  validates_uniqueness_of :_id
  validates_presence_of :name, :message => "You must set a name parameter with a value. Example: name=Goodwill"
  validates_presence_of :image, :message => "You must have an image parameter with a value. Example: image=goodwill.png"
  validates_presence_of :goal_points, :message => "You must set a goal_points parameter with an integer. Example: goal_points=3000"
  validates_numericality_of :goal_points, :greater_than =>0, :message => "goal_points must be great than zero. Example: goal_points=3000"
end
