public class AppointmentTimeService {
    
    /**
     * Service Request DAO
	 */
    public class ServiceRequest {
        @InvocableVariable(required=true description='Number of Appointments')
        public Integer noOfAppointments;        
    }  
    
    /**
     * Service Response DAO
	 */
    public class ServiceResponse {         
        @InvocableVariable
        public AvailableTimes availableTimes;         
    }

    public class AvailableTimes {        
        public List<TimeSlot> timeSlots;       
    }
    
    public class TimeSlot {
        @InvocableVariable(description='Appointment Id')
        public String appointmentId;

        @InvocableVariable(required=true description='Appointment Time')
        public String appointmentTime;

        @InvocableVariable(required=true description='Appointment Duration')
        public Decimal duration;
        
        @InvocableVariable(required=true description='Appointment Location')
        public String location;
        
        @InvocableVariable(required=true description='Rating')
        public Integer rating;        
    }
    
    /**
     * Currency Convert Function
     * @param List<ServiceRequest> request
     * @response List<Decimal> 
	 */
    @InvocableMethod(label='Agent Find Avaiable Time Slots')
    public static List<ServiceResponse> findAvaiableTimeSlots(List<ServiceRequest> requests) { 
        ServiceRequest request = (requests != null) ? requests[0] : new ServiceRequest();
        List<ServiceResponse> responses = new List<ServiceResponse>();             
        
        ServiceResponse res = new ServiceResponse();  
        res.availableTimes = new AvailableTimes();
        res.availableTimes.timeSlots = new List<TimeSlot>();
        
        TimeSlot ts = new TimeSlot();
        ts.appointmentId = '1111';
        ts.appointmentTime = '08:30';
        ts.duration = 30.0;
        ts.location = 'Dubai Hills Mall';
        ts.rating = 3;
        res.availableTimes.timeSlots.add(ts);
        
        ts = new TimeSlot();
        ts.appointmentId = '2222';
        ts.appointmentTime = '10:30';
        ts.duration = 30.0;
        ts.location = 'Mall of Emirtes';
        ts.rating = 1;
        res.availableTimes.timeSlots.add(ts);
        
        ts = new TimeSlot();
        ts.appointmentId = '3333';
        ts.appointmentTime = '14:30';
        ts.duration = 30.0;
        ts.location = 'Dubai Mall';
        ts.rating = 2;
        res.availableTimes.timeSlots.add(ts);
        
        responses.add(res);     
        system.debug('*** responses = ' + responses);
       
        return responses;
    }
}