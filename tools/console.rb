require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Student.new("Sean")
s2 = Student.new("Derek")
s3 = Student.new("Albert")

t1 = Instructor.new("Belinda")
t2 = Instructor.new("Sally")
t3 = Instructor.new("Andrew")

b1 = BoatingTest.new(s1, "Level 1", "failed", t1)
b2 = BoatingTest.new(s2, "Level 2", "passed", t2)
b3 = BoatingTest.new(s1, "Level 3", "passed", t3)
b4 = BoatingTest.new(s3, "Level 2", "failed", t3)
b5 = BoatingTest.new(s3, "Level 4", "passed", t3)

# puts s1.grade_percentage
puts t3.pass_student(s3, "Level 10")



#binding.pry
0 #leave this here to ensure binding.pry isn't the last line

