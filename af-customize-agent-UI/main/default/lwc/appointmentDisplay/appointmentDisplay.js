import { LightningElement, api } from "lwc";

export default class AppointmentDisplay extends LightningElement {
  @api value;  

  appointmentData = [];
  
  formatRatings(rating) {    
    let stars = new Array();
    for (let i = 0; i < rating; ++i) {
      stars.push(i);
    }
    return stars;
  }

  connectedCallback() {
    const timeSlots = this.value?.timeSlots || [];
    
    this.appointmentData = timeSlots.map((app) => ({
        ...app,
        stars: this.formatRatings(app.rating)
    }));
  }
}