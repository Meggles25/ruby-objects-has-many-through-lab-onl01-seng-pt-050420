class Patient
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def appointments
    Appointment.all.select {|appointment| appointment.patient == self}
    
  def doctors
    appointments.collect {|appointment| appointment.doctor}
    doctors = []
    appointments.each do |appointment|
      doctors << appointment.doctor
    end
    doctors
  end
  end  

  def new_appointment(doctor, date)
    Appointment.new(self, date, doctor)
  end  
end