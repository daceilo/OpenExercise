package org.openexercise

class Program {

    ProgramDay monday = new ProgramDay(dayOfWeek: "Monday")
    ProgramDay tuesday = new ProgramDay(dayOfWeek: "Tuesday")
    ProgramDay wednesday = new ProgramDay(dayOfWeek: "Wednesday")
    ProgramDay thursday = new ProgramDay(dayOfWeek: "Thursday")
    ProgramDay friday = new ProgramDay(dayOfWeek: "Friday")
    ProgramDay saturday = new ProgramDay(dayOfWeek: "Saturday")
    ProgramDay sunday = new ProgramDay(dayOfWeek: "Sunday")

    static constraints = {
        monday nullable: false, blank: false
        tuesday nullable: false, blank: false
        wednesday nullable: false, blank: false
        thursday nullable: false, blank: false
        friday nullable: false, blank: false
        saturday nullable: false, blank: false
        sunday nullable: false, blank: false
    }
}

