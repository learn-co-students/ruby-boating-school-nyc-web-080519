class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def get_matching_test(student, test_name)
        BoatingTest.all.select do |boatingTest|
            boatingTest.student == student && boatingTest.name == test_name
        end
    end

    def pass_student(student, test_name)
        my_test = get_matching_test(student, test_name)
        if my_test.length > 0
            my_test[0].status = "passed"
            return my_test[0]
        else
            return BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        my_test = get_matching_test(student, test_name)
        if my_test.length > 0
            my_test[0].status = "failed"
            return my_test[0]
        else
            return BoatingTest.new(student, test_name, "failed", self)
        end
    end

    def self.all
        @@all
    end
end
