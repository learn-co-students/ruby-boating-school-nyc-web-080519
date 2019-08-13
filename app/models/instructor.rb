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

    def pass_student(given_student, given_test)
        if BoatingTest.all.find {|bt| bt.student == given_student && bt.test_name == given_test}
            BoatingTest.all.select do |bt|
                if bt.student == given_student && bt.test_name == given_test
                    bt.status = "passed"
                end
            end
        else
            BoatingTest.new(given_student, given_test, "passed", self)
        end
    end

    def fail_student(given_student, given_test)
        if BoatingTest.all.find {|bt| bt.student == given_student && bt.test_name == given_test}
            BoatingTest.all.select {|bt| bt.status = "failed" if bt.student == given_student && bt.test_name == given_test}
        else
            BoatingTest.new(given_student, given_test, "failed", self)
        end
    end

end
