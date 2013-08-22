# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(email: 'admin@zgzfts.com', password:'111222')
News.create(title:'请添加新闻',body:'这是测试新闻',posttime:Time.now)
Notice.create(title:'请添加公告',body:'这是测试公告',posttime:Time.now)
Distribution.create(title:'请添加经销商信息',body:'这是测试信息',posttime:Time.now)
