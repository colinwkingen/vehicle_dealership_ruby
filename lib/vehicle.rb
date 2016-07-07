class Vehicle
  def initialize (make,model,year)
    @make = make
    @year = year
  end

  define_method(:age) do
    current_year = Time.new.year
    age = current_year.-(@year)
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler","Ford",'GM']
    american = american_cars.include?(@make)
    new_enough = age().<=(15)
    american.&(new_enough)
  end
end
