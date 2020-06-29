class Doctor

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
    Appointment.all.select {|i| i if i.doctor == self}
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def patients
    appointments.map {|i| i.patient}
  end

end
