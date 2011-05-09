require 'spec_helper'

describe TasksController do
  describe "GET #index" do
    before(:each) { get :index }

    it { should assign_to(:tasks) }
    it { should render_template('tasks/index') }
    it { should respond_with(200) }
  end

  describe "GET #show" do
    before(:each) { Factory.create(:task, :id => 1) }
    before(:each) { get :show, :id => '1' }

    it { should assign_to(:task) }
    it { should render_template('tasks/show') }
    it { should respond_with(200) }
  end
end
