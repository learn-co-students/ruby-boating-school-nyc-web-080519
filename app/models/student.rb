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

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end

    def self.find_student(name)
        self.all.find do |student|
            student.first_name == name
        end
    end

    def my_boating_tests
        BoatingTest.all.select do |test|
            test.student == self
        end
    end

    def grade_percentage
        my_passed_tests = self.my_boating_tests.select do |test|
            test.status == "passed"
        end
        (my_passed_tests.count / self.my_boating_tests.count.to_f) * 100
    end
end
