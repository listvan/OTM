# encoding: utf-8
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /feladatokat listázó oldal.*/
      '/'
    when /új feladat létrehozásának az oldal.*/
      '/tasks'
      
    when /(.+) című feladat szerkesztésének az oldal.*/ 
      "/tasks/#{Task.find_by_title($1).id}/edit"
  
    when/(.+) című feladat részletes oldal.*/
      task = Task.find_by_title($1)
      "/tasks/#{task.id}"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
