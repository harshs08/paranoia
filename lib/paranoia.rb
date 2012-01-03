module Paranoia
  def self.included(klazz)
    klazz.extend Query
  end

  module Query
    def paranoid? ; true ; end

    def only_deleted
      unscoped {
        where("deleted_at is not null")
      }
    end
  end

  def destroy
    _run_destroy_callbacks { delete }
  end

  def delete    
    self.class.where(:id => self.id).update_all(:deleted_at => Time.now) if !deleted? && persisted?
    self.reload
    
    puts 'third time'
#    if !deleted? && persisted?
#      self.deleted_at = Time.now
#      self.save(:validate => false)
#    end
    freeze
  end
  
  def restore!
    update_attribute :deleted_at, nil
  end

  def destroyed?
    !self.deleted_at.nil?
  end
  alias :deleted? :destroyed?
end

class ActiveRecord::Base
  def self.acts_as_paranoid
    alias_method :destroy!, :destroy
    alias_method :delete!,  :delete
    include Paranoia
    default_scope :conditions => { :deleted_at => nil }
  end

  def self.paranoid? ; false ; end
  def paranoid? ; self.class.paranoid? ; end
end
