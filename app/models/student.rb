class Student
    attr_reader :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all 
        @@all
    end

    def add_boating_test(given_test, given_status, given_instructor)
        BoatingTest.new(self, given_test, given_status, given_instructor)
    end

    def self.find_student(given_name)
        Student.all.find {|student| student.first_name == given_name}
    end

    def test_taken
        BoatingTest.all.select {|bt| bt.student == self}.count
    end

    def grade_percentage
        test_pass = BoatingTest.all.select {|bt| bt.status == "passed"}.count
        ((test_pass+0.0)/self.test_taken)*100
    end
end
