# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ name: 'Dan',netid: 'df336',admin:1 },
  { name: 'Brian Wolson',netid: 'bw52',admin:1 },
  { name: 'Jason Shuff',netid: 'jrs26',admin:1 },
  { name: 'Doug Vynalek',netid: 'dv223',admin:1 },
  { name: 'Naveen Kamtamaneni',netid: 'nk342',admin:1 },
  { name: 'Hari Adusumilli',netid: 'ha239',admin:1 },
  { name: 'Test User',netid: 'ti3',admin:0 }
  ])
  
apps = App.create([name: "Demo app.",
    owner: 0,
    description: "This is the demo app.",
    tags: ["yale", "regression"],
    envs:{:test => "This is test"}
    ])
