class Student

  @@all = [] 

  attr_reader :first_name

  def initialize(first_name)
    @first_name = first_name 
    @@all << self
  end

  def self.all
    @@all 
  end

  def add_boating_test(student_obj, test_name, status, inst_obj)
    BoatingTest.new(self, test_name, status, inst_obj)
  end 

  def self.find_student(first_name)
    self.all.select do |student|
      student.first_name == first_name
    end
  end 

  def grade_percentage
    #traverse through all boating tests and identify all the tests related to the student
    #traverse throught the students' tests and count how many passed tests there are  / .length of the array 
    my_tests = BoatingTest.all.select do |test| 
      test.student == self 
    end
    my_test_statuses = my_tests.map do |test| 
      test.status
    end
    number_passed = (my_test_statuses.count("passed")) / (my_test_statuses.length).to_f
  end

end #end of Student class
