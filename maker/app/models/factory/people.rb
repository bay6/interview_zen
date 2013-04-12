class Person < ActiveRecord::Base
  has_many :events
  has_many :meals, :through => :events, :source => :eventable,
    :source_type => "Meal"
  has_many :workouts, :through => :events, :source => :eventable,
    :source_type => "Workout"
  validates :currency_code,
    :presence => true,
    :inclusion => { :in => proc { |record| record.all_codes } }

  def all_codes
    ['some', 'dynamic', 'result', 'based', 'upon', 'the', 'record']
  end
end

class Widget < ActiveRecord::Base
  has_many :widget_groupings

  has_many :people, :through => :widget_groupings, :source => :person, :conditions => "widget_groupings.grouper_type = 'Person'"
  has_many :aliens, :through => :widget_groupings, :source => :alien, :conditions => "video_groupings.grouper_type = 'Alien'"
end

class Person < ActiveRecord::Base
  has_many :widget_groupings, :as => grouper
  has_many :widgets, :through => :widget_groupings
end

class Alien < ActiveRecord::Base
  has_many :widget_groupings, :as => grouper
  has_many :widgets, :through => :widget_groupings  
end

class WidgetGrouping < ActiveRecord::Base
  belongs_to :widget
  belongs_to :grouper, :polymorphic => true
end