require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe '.done' do
    it 'returns all done tasks' do
      task = Task.new description: 'Do Laundry'
      task.save
      task.update done: true
      expect(Task.done).to eq([task])
    end
  end

  describe '.not_done' do
    it 'returns all incomplete tasks' do
      task_0 = Task.new description: 'Do Laundry'
      task_0.save
      task_0.update done: true
      task_1 = Task.new description: 'Fold Laundry'
      task_1.save
      expect(Task.not_done).to eq([task_1])
    end
  end
end
