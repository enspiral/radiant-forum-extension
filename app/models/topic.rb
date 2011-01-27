class Topic < ActiveRecord::Base
  has_site if respond_to? :has_site
  has_comments
  
  belongs_to :forum
  belongs_to :replied_by, :class_name => 'Reader'

  validates_presence_of :name
  validates_uniqueness_of :old_id, :allow_nil => true

  named_scope :imported, :conditions => "old_id IS NOT NULL"
  named_scope :stickyfirst, :order => "topics.sticky DESC, topics.replied_at DESC"
  named_scope :bydate, :order => 'replied_at DESC'
  named_scope :latest, lambda { |count|
    { :order => 'replied_at DESC', :limit => count }
  }

  def dom_id
    "topic_#{self.id}"
  end

  def visible_to?(reader=nil)
    return true if reader || Radiant::Config['forum.public?']
  end
  
  def reader
    posts.first.reader
  end
  
  def body
    posts.first.body
  end
  
  def created_at
    posts.first.created_at if posts.first
  end
  
  def title
    name
  end

end
