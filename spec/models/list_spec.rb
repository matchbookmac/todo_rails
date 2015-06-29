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

  describe '#not_done' do
    it 'returns all incomplete tasks for a list' do
      list = List.new(name: "home", description: "Things to do at home")
      task_0 = list.tasks.new description: 'Do Laundry'
      task_0.save
      task_1 = list.tasks.new description: 'Fold Laundry'
      task_1.save
      task_0.update(done: true)
      expect(list.not_done).to eq([task_1])
    end
  end

  describe '.select_options' do
    it 'returns array of arrays of list name and corresponding id' do
      list_0 = List.new(name: "home", description: "Things to do at home")
      list_1 = List.new(name: "work", description: "Things to do at work")
      list_2 = List.new(name: "fun", description: "Things to do for fun")
      list_0.save
      list_1.save
      list_2.save
      expect(List.select_options).to eql([[list_0.name, list_0.id], [list_1.name, list_1.id], [list_2.name, list_2.id]])
    end
  end
end
