require 'pry'

class Doctor

  attr_accessor :name
  @@all = []


### Instance Methods
  def initialize(name)
    @name = name

    @@all << self
  end

  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor = self
    end
  end

  def patients
    self.appointments.map do |appointment|
      appointment.patient
    end
  end


### Class Methods
  def self.all
    @@all
  end

end # End of Doctor Class
