require "spec_helper"

describe "tasks/_form.html.haml" do

  before(:each) { assign(:task, task) }
  subject { render }

  context "given a new task" do
    before(:each) { Task.stub(:order).with(:title).and_return([mock("Task", :to_s => 'xxx (1)', :id => 111)]) }

    let(:task) { Factory.build(:task) }

    it { should_not have_xpath('//ul[@class="preceding//select"]') }

    it { should have_xpath('//ul[@class="parent"]//select', :id => 'task_parent_id') }
    it { should have_xpath('//ul[@class="parent"]//select/option', :value => '111', :content => 'xxx (1)') }

    it { should have_xpath('//ul[@class="task"]//select', :id => 'task_priority') }
    it { should have_xpath('//ul[@class="task"]//select/option', :value => '5', :content => '5', :selected => 'selected') }

    it { should have_xpath('//ul[@class="task"]//input', :id => 'task_title', :value => 'Example Task') }

    it { should have_xpath('//ul[@class="task"]//textarea', :id => 'task_description', :content => '') }

    it { should have_xpath('//ul[@class="task"]//select', :id => 'task_due_at') }
    it { should have_xpath('//ul[@class="task"]//select/option', :value => Time.now.strftime('%Y-%m-%d')) }

    it { should_not have_xpath('//ul[@class="children//select"]') }
    it { should_not have_xpath('//ul[@class="following//select"]') }
  end

  context "given a new task with errors" do
    let(:task) {
      t = Factory.build(:task, :title => 'a')
      t.save
      t
    }

    it { should have_xpath('//div[@class="field_with_errors"]/input', :id => 'task_title', :value => 'a') }
  end

end

