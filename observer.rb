class Payroll
	def update ( changed_employee )
		puts ("#{changed_employee.name}のために小切手を切ります")
		puts ("彼の給料はいま#{changed_employee.salary}です")
	end
end


class Employee
	attr_reader :name, :title
	attr_reader :salary

	def initialize( name, title, salary)
		@name = name
		@title = title
		@salary = salary
		@observers = []
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end
end

fred = Employee.new("hoge", "fuga", 300000)

payroll = Payroll.new
fred.add_observer( payroll )

fred.salary = 350001
fred.salary = 200


