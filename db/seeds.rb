# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

types = ['台式计算机', '笔记本电脑', '复印机', '打印机', '传真机', '扫描仪', '照相机', '摄像机', '投影仪', '碎纸机']

types.each do |type|
	Type.create(name: type)
end

brands = ['惠普', '佳能', '华三', '联想']

brands.each do |brand|
	Brand.create(name: brand)
end

departments = ['领导干部', '助理、副总师', '财务资产部', '人力资源部', '安全监察质量部', '运维检修部', '办公室', '变电检修中心', '党群工作部', '赣州运维分部', '监察审计部', '财务资产部', '人力资源部', '助理、副总师', '财务资产部', '人力资源部']

departments.each do |department|
	Department.create(name: department)
end

maintenancers = ['梅立奇', '刘湖钰', '吴赛', '汪磊', '史书采', '涂静芝', '赖韵宇', '李逸凡', '刘晓翠']

maintenancers.each do |maintenancer|
	Maintenancer.create(name: maintenancer)
end