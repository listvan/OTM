# encoding: utf-8
module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

    when /the page/
      "html > body"
    
    when /feladatok között/
      "ul.tasks"

    when /a hibaüzenetben/
      ".notifications .error"

    when /a státusz üzenetek között/
      ".notifications .notice"

    when /az (.+) című feladat sorában/
      task = Task.find_by_title($1)
      "li[data_id='#{task.id}']"
    
    when /a kiktől függök formon belül/
      "ul.dependency_on_me"

    when /a kik függenek tőlem formon belül/
      "ul.dependency_by_me"

    when /a kiktől függök feladatokban/
      "ul.incoming_dependencies"

    when /kik függenek tőlem feladatokban/
      "ul.outgoing_dependencies"

    when/a gyerek feladatok formon belül/
      "ul.child"

    when/a gyerek feladatokban/
      "ul.children"

    when /a szülő feladatban/
      ".parent_id"
    
    when /a megelőző feladatokban/
      "#preceding"

    when /a követő feladatokban/
      "#following"

     when /a gyerekek között/
      "ul.children"

    when /az (.+) című megelőző feladat sorában/
      task = Task.find_by_title($1)
      "ul[class='incoming_dependencies'] li[data_id='#{task.id}']"

    when /a folyamatok között/
      "ul.processes"
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #  when /the (notice|error|info) flash/
    #    ".flash.#{$1}"

    # You can also return an array to use a different selector
    # type, like:
    #
    #  when /the header/
    #    [:xpath, "//header"]

    # This allows you to provide a quoted selector as the scope
    # for "within" steps as was previously the default for the
    # web steps:
    when /"(.+)"/
      $1

    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
