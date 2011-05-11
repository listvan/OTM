require "spec_helper"

describe "tasks/index.html.haml" do

  let(:tasks) {
    tasks = []
    tasks.stub(:order).and_return { tasks }
    tasks
  }

  before(:each) { assign(:tasks, tasks) }

  subject { render }

  it { should have_xpath('//h1', :content => 'Tasks') }

  it { should have_xpath('//ul[@class="tasks"]/li[@class="new"]/form',
                         :method => 'post',
                         :action => tasks_path) }

  context "given 2 tasks" do
    let(:tasks) {
      tasks = [
        stub_model(Task, :title => "test 1", :priority => 2),
        stub_model(Task, :title => "test 2", :priority => 3)
      ]
      tasks.stub(:order).and_return { tasks }
      tasks
    }

    it { should have_xpath('//ul[@class="tasks"]/li[@class="priority-2"]', :content => 'test 1') }
    it { should have_xpath('//ul[@class="tasks"]/li[@class="priority-3"]', :content => 'test 2') }

    it "renders tasks in priority and due_at order" do
      tasks.should_receive(:order).with(:priority, :due_at).and_return(tasks)
      subject
    end
  end
end
