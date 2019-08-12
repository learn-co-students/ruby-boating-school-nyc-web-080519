class Instructor

  @@all = [] 

  attr_reader :name 
  
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all 
  end


  def update_student_status(student_instance, test_name, status)
    BoatingTest.all.each do |test|
      if student_instance.first_name == test.student.first_name && test.instructor == self 
        test.status == status
        return test 
      end 
    end #end do 
    BoatingTest.new(student_instance, test_name, status, self)
  end #end update_student_status

  def pass_student(student_instance, name)
    self.update_student_status(student_instance, name, "passed")
  end


  def fail_student(student_instance, name)
    self.update_student_status(student_instance, name, "failed")
  end


end #end of Instructor class
