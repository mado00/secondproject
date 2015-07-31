# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: "111", password: "111", email:"111@111.com")

bookmarks = [{name: 'facebook', url: 'https://www.facebook.com/', logo: 'https://d3n8a8pro7vhmx.cloudfront.net/frankkitchen/pages/37/attachments/original/1411680425/facebook_icon_large.png?1411680425', user_id: user.id},
	{name: 'linkedin', url: 'https://www.linkedin.com/',logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/768px-LinkedIn_logo_initials.png', user_id:user.id },
	{name: 'google', url:'https://www.google.com', logo: 'http://fineprintnyc.com/images/blog/history-of-logos/google/google-logo.png', user_id:user.id },
	{name: 'youtube', url:'https://www.youtube.com/', logo: 'http://3.bp.blogspot.com/-tcXBBmJSzPc/TbI0AdcJgqI/AAAAAAAAAYw/Bg3sqCG9bEs/s1600/youtube-logo.png', user_id:user.id },
	{name: 'galvanize', url:'http://www.galvanize.com/', logo: 'http://women2.com/wp-content/uploads/2014/09/galvanize_logo.jpg', user_id:user.id },
	{name: 'ebay', url: 'http://www.ebay.com/', logo: 'https://upload.wikimedia.org/wikipedia/commons/4/48/EBay_logo.png', user_id:user.id },
	{name: 'apple', url: 'https://www.apple.com/', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/2000px-Apple_logo_black.svg.png', user_id:user.id },
	{name: 'yahoo', url: 'https://www.yahoo.com/', logo: 'http://img4.wikia.nocookie.net/__cb20150504184654/logopedia/images/c/ca/FoodnetLogo.png', user_id:user.id }]

	bookmarks.each do |bookmark|
  	Bookmark.create(bookmark)
  end

	category_bookmarks = [{name:'Music', user_id:user.id}, 
												{name: 'Social', user_id: user.id}]


	category_bookmarks.each do |category_bookmark|
	  CategoryBookmark.create(category_bookmark)
	end

	i = 0
	cb_ids = CategoryBookmark.all.pluck(:id)
	Bookmark.all.each do |b|
		Favorite.create(bookmark_id: b.id, category_bookmark_id: cb_ids[i%2])
		i += 1
	end










