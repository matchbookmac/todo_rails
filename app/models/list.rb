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
end
