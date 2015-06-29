require 'rails_helper'

describe List do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should have_many :tasks }

  describe '#done' do
    it 'returns all done tasks for a list' do
      list = List.new(name: "home", description: "Things to do at home")
      task_0 = list.tasks.new description: 'Do Laundry'
      task_0.save
      task_1 = list.tasks.new description: 'Fold Laundry'
      task_1.save
      task_0.update(done: true)
      expect(list.done).to eq([task_0])
    end
  end
end
