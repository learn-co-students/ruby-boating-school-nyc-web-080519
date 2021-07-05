require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Student.new("Dan")
s2 = Student.new("Lucie")
s3 = Student.new("Charlotte")

i1 = Instructor.new("Scott")
i2 = Instructor.new("Karl")

t1 = s1.add_boating_test("Knot Test", "passed", i1)
t2 = s1.add_boating_test("Scuba Test", "failed", i2)
t3 = s2.add_boating_test("Knot Test", "failed", i1)
t4 = s1.add_boating_test("Scuba Test", "passed", i2)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line

