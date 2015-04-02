json.pages (StartUp.count / @per_page + 1)
json.start_ups @start_ups do |s|
  json.(s, :id, :name, :link, :likes_count, :desc)
  json.logo_url s.logo('30')
end