require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salarieshash)

        @name = name
        @funding = funding
        @salaries = salarieshash
        @employees = []

    end

    def valid_title?(title)
        @salaries.key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise ArgumentError.new "tu título es inválido"
        else
            @employees << Employee.new(employee_name, title)
        end

    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if(@funding >= salary)
            employee.pay(salary)
            @funding -= salary
        else
            raise RuntimeError.new("no hay bastante dinero para pagar al empleado")
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        return 0 if employees.size == 0
        @employees.inject(0) {|acc, curr| acc + @salaries[curr.title]}/@employees.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @salaries = startup.salaries.merge(@salaries)
        @employees += startup.employees
        startup.close
    end

end
