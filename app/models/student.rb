class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end

    def my_boating_tests
        BoatingTest.all.select do |boating_test|
            boating_test.student == self
        end
    end

    def grade_percentage
        my_status_arr = my_boating_tests.map do |boating_test|
            boating_test.status
        end
        passed_num = 0
        my_status_arr.each do |status|
            if status == "passed"
                passed_num += 1
            end
        end
        return (passed_num.to_f / my_status_arr.length.to_f) * 100
    end

    def self.all
        @@all
    end

    def self.find_student(name)
        all.select do |student|
            student.first_name == name
        end
    end
end
