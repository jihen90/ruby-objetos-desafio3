class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end
    def occurs_on?(day)
        day == @day
    end
    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}"
    end
end

class DailyAppointment < Appointment
    
    def occurs_on?(hour,min)
        @hour == hour && @min == min
    end
    def to_s
      "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}" 
    end

end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end
    def occurs_on?(day,month,year)
        @day == day && @month == month && @year == year
    end

    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

a = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
b = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
c = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)

pp c.occurs_on?(4,6,2019)
pp b.occurs_on?(8,15)
pp a.occurs_on?(23)
