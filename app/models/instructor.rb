class Instructor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def my_boating_tests
        BoatingTest.all.select do |test|
            test.instructor == self
        end
    end

    def pass_student(student, test_name)
        my_test = my_boating_tests.find do |test|
            test.student == student && test.name == test_name
        end
        if my_test
            my_test.status = "passed"
            my_test
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        my_test = my_boating_tests.find do |test|
            test.student == student && test.name == test_name
        end
        if my_test
            my_test.status = "failed"
            my_test
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end
end
