require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

wework = Startup.new("wework","bill", "work")
galvanize = Startup.new("galvanize", "katie", "tech")
oracle = Startup.new("oracle", "tim", "tech")
richie = VentureCapitalist.new("richie", 30000000000)
poor = VentureCapitalist.new("poor", 2000000)
wework.sign_contract(richie, "a", 1000000)
wework.sign_contract(poor, "b", 55445)
galvanize.sign_contract(richie, "a", 99999)
oracle.sign_contract(richie, "a", 99999)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
