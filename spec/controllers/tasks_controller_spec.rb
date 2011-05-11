require 'spec_helper'

describe TasksController do
  describe "GET #index" do
    before(:each) { get :index }

    it { should assign_to(:tasks) }
    it { should render_template('tasks/index') }
    it { should respond_with(:success) }
  end

  describe "GET #show" do
    before(:each) { Factory.create(:task, :id => 1) }
    before(:each) { get :show, :id => '1' }

    it { should assign_to(:task) }
    it { should render_template('tasks/show') }
    it { should respond_with(:success) }
  end

  describe "POST #create with valid attributes" do
    before(:each) { post :create, :task => { :title => "New Example Task", :priority => 5 } }

    it { should assign_to(:task) }
    it { should redirect_to(tasks_path) }
    it { should set_the_flash.to('models.task.created_successfully') }
  end

  describe "POST #create with invalid title" do
    before(:each) { post :create, :task => { :title => "A", :priority => 5 } }

    it { should assign_to(:task) }
    it { should render_template('tasks/new') }
    it { should respond_with(:not_acceptable) }
    it { should set_the_flash.to('models.task.create_failed') }
  end
end
