# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WaterSample.create([
  {site: 'LA Aquaduct Filteration Plant Effluent', chloroform: 0.00104, bromoform: 0, bromodichloromethane: 0.00149, dibromichloromethane: 0.00275},
  {site: 'North Hollywood Pump Station (well blend)', chloroform: 0.00291, bromoform: 0.00487, bromodichloromethane: 0.00547, dibromichloromethane: 0.0109},
  {site: 'Jensen Plant Effluent', chloroform: 0.00065, bromoform: 0.00856, bromodichloromethane: 0.0013, dibromichloromethane: 0.00428},
  {site: 'Weymouth Plant Effluent', chloroform: 0.00971, bromoform: 0.00317, bromodichloromethane: 0.00931, dibromichloromethane: 0.0116}
])

FactorWeight.create([
  {chloroform_weight: 0.8, bromoform_weight: 1.2, bromodichloromethane_weight: 1.5, dibromichloromethane_wieight: 0.7},
  {chloroform_weight: 1.0, bromoform_weight: 1.0, bromodichloromethane_weight: 1.0, dibromichloromethane_wieight: 1.0},
  {chloroform_weight: 0.9, bromoform_weight: 1.1, bromodichloromethane_weight: 1.3, dibromichloromethane_wieight: 0.6},
  {chloroform_weight: 0.0, bromoform_weight: 1.0, bromodichloromethane_weight: 1.0, dibromichloromethane_wieight: 1.7}
])