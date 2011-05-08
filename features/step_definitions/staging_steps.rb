# encoding: utf-8

Amennyiben /^az? (.+(?:on|en|án|én|n)) vagyok$/ do |page_name|                  
  Given %{I am on #{page_name}}
end

Akkor /^az? (.+(?:on|en|án|én|n)) kell lennem$/ do |page_name| 
  Then %{I should be on #{page_name}}
end  

Ha /^ráklikkelek az? "([^"]*)" linkre(?: (.+))?$/ do |link,selector|            
  if selector
    When %{I follow "#{link}" within #{selector}}
  else
    When %{I follow "#{link}"}
  end
end

Akkor /^azt kell látnom(?: (.+))?, hogy "([^"]*)"$/ do |selector,text|
  if selector
    Then %{I should see "#{text}" within #{selector}}
  else                                                                          
    Then %{I should see "#{text}"}
  end
end

Ha /^begépelem az?(?: (.+))? "([^"]*)" mezőbe az? "([^"]*)" szöveget$/ do |selector, field, text|                                                               
  if selector
    When %{I fill in "#{field}" with "#{text}" within #{selector}}
  else 
    When %{I fill in "#{field}" with "#{text}"}
  end
end  

Ha /^kiválasztom az? "([^"]*)" mezőből a "([^"]*)" (?:.*)$/ do |field, value|   
  When %{I select "#{value}" from "#{field}"}
end

Ha /^megnyomom az? "([^"]*)" gombot(?: (.+))?$/ do |button_name, selector|
  if selector
    When %{I press "#{button_name}" within #{selector}}
  else
    When %{I press "#{button_name}"}
  end
end

Akkor /^sikeres választ kell kapnom$/ do
  if page.respond_to? :should                                                
    page.should have_xpath('//div[@id="container"]')
    page.should have_no_xpath('//*[@id="notifications"]/*[@class="error"]')
  else
    assert page.has_xpath?('//div[@id="container"]')
    assert page.has_no_xpath?('//*[@id="notifications"]/*[@class="error"]')
  end
end

Akkor /^látnom kell az?(?: (.+))? a következő (?:.*)$/ do |selector, table|
  table.raw.each do |attributes|
    attributes.each do |data|
      if selector
        Then %{I should see "#{data}" within #{selector}}
      else
         Then %{I should see "#{text}"}
      end
    end
  end
end
