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
    appointments = Appointment.all.select {|s| s.patient == self}
    doctors = []
    appointments.each do |appointment|
      doctors << appointment.doctor
    end
    doctors
  end

  def new_appointment(doctor, date)
    Appointment.new(self, date, doctor)
  end  
end