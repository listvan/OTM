# encoding: utf-8

FactoryGirl.define do
  factory :task do
    title 'Example Task'
    priority 5
    due_at '2011-05-16'
  end
end
