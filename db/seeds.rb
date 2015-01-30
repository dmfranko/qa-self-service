# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ user_name: 'Dan',netid: 'df336',is_administrator:1 },
  { user_name: 'Jason Shuff',netid: 'jrs26',is_administrator:1 },
  { user_name: 'Doug Vynalek',netid: 'dv223',is_administrator:1 },
  { user_name: 'Test User',netid: 'ti3',is_administrator:0 }
  ])
  
apps = Application.create([name: "Demo app.",
    owner: 0,
    description: "This is the demo app.",
    tags: ["yale", "regression"],
    envs:{:test => "This is test"}
    ])
