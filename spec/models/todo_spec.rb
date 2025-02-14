require 'rails_helper'

RSpec.describe Todo, type: :model do
  it 'returns error when title is missing' do
    todo = build :todo
    todo.title = nil
    
    expect(todo).to be_invalid
  end

  it 'returns error when title exceeds length' do
    todo = build :todo
    todo.title = 'x' * 201
    
    expect(todo).to be_invalid
  end

  it 'should be valid when title presents and length <= 200' do
    todo = build :todo
    todo.title = 'x' * 200
    
    expect(todo).to be_valid
  end
end