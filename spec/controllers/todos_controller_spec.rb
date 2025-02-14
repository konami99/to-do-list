require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  
  it 'should create a todo' do
    post :create, params: { todo: { title: 'test', description: 'test', completed: false } }
    expect(response).to have_http_status(:success)
  end

  it 'should get all todos' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'should update a todo' do
    todo = create :todo
    put :update, params: { id: todo.id, todo: { title: 'test', description: 'description', completed: true } }
    expect(response).to have_http_status(:success)
    body_in_json = JSON.parse(response.body)

    expect(body_in_json['todo']['title']).to eq('test')
    expect(body_in_json['todo']['description']).to eq('description')
    expect(body_in_json['todo']['completed']).to be true
  end

  it 'should destroy a todo' do
    todo = create :todo
    delete :destroy, params: { id: todo.id }
    expect(response).to have_http_status(:success)

    body_in_json = JSON.parse(response.body)
    expect(body_in_json['todo']).to eq(todo.id)
  end

  it 'should show a todo' do
    todo = create :todo
    get :show, params: { id: todo.id }
    expect(response).to have_http_status(:success)
    body_in_json = JSON.parse(response.body)
    
    expect(body_in_json['title']).to eq('John Doe')
    expect(body_in_json['description']).to eq('This is a description')
    expect(body_in_json['completed']).to be false
  end
end