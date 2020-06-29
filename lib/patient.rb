
class Patient

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|i| i if i.patient == self}
  end

  def new_appointment(doctor,date)
    Appointment.new(date, self, doctor)
  end

  def doctors
    self.appointments.map {|i| i.doctor}
  end

end
