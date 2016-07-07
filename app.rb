require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/vehicle'
require './lib/dealership'

@@helpful_hash = {:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"}

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicles_form/new') do
  erb(:vehicles_form)
end

get('/dealerships/new') do
   erb(:dealerships_form)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  erb(:vehicle)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership_vehicles_form)
end

get '/vehicles_form/:id/new' do
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  erb(:dealership_vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  color = params.fetch('color')
  engine_size = params.fetch('engine_size')
  number_of_doors = params.fetch('number_of_doors')
  @vehicle = Vehicle.new({:make=> make, :model=> model, :year=> year, :color=> color, :engine_size=> engine_size, :number_of_doors=> number_of_doors})
  @vehicle.save()
  @dealership = Dealership.find(params.fetch(@id).to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end
