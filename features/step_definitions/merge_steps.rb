Given /^the following articles exist:$/ do |table|
  Article.create table.hashes
end

Given /^the following comments exist:$/ do |table|
  Comment.create table.hashes
end