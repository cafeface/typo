Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |spec|
    article = Article.new(spec)
    article.user = User.find_by_name('cafeface')
    article.save!
  end
end

When /^I fill in "(.*?)" with the id for "(.*?)"$/ do |field, title|
  fill_in field, :with => Article.find_by_title(title).id
end
