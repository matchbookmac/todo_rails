class List < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true
  validates :description, presence: true

  def done
    Task.where("list_id = ? AND done = ?", id, true)
  end

  def not_done
    Task.where("list_id = ? AND done = ?", id, false)
  end

  def self.select_options
    select_options = []
    List.all.each { |list| select_options.push [list.name, list.id] }
    select_options
  end
end
