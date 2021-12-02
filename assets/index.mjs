import SQLite from "sqlite-async"

async function getAllEvents(){
    const db = await SQLite.open('../assets/db/mybackend')
    
    const allEvents = await db.all(`
        SELECT * FROM events 
        LEFT JOIN dates_by_event ON events.id = dates_by_event.event_id
        LEFT JOIN attendees_by_date ON attendees_by_date.date_id = dates_by_event.id
    `)
    
    const ret = allEvents.reduce((ac, cv) => {
        if(cv.attendee === null)
        return ac 
        
        const _event = ac.find(x => x.id === cv.event_id)
    
        const newAttendee = {
        name: cv.attendee,
        available: cv.available
        }
    
        const newDate = {
        date: cv.event_date,
        attendees: [newAttendee]
        }
        
        if(!_event){
        ac.push({
            id: cv.event_id,
            event_name: cv.event_name,
            event_author: cv.event_author,
            event_description: cv.event_description,
            dates: [newDate]
        })
        }
        else{
        const _date = _event.dates.find(x => x.date === cv.date)
        if(!_date)
            _event.dates.push(newDate)
        
        else
            _date.attendees.push(newAttendee)
        }
        
        return ac
    }, [])
    
    console.log(JSON.stringify(ret, null, 2))
    db.close()
    
    return allEvents
}


async function insertNewDate(id, date){
    const db = await SQLite.open('./mybackend');

    console.log(id, date);

    const addDateEvent = await db.run(
        "INSERT INTO date_by_event (eventId, eventDate) VALUES (?, ?)", [id, date]
    );

    console.log(addDateEvent);
    db.close();

    return addDateEvent;
}

async function updateDate(){
    const db = await SQLite.open('./mybackend');

    const modifydate = await db.run('UPDATE date_by_event SET eventDate = "2021-12-29" WHERE eventDate = "2021-12-30"');

    db.close;

    return modifydate;
}

async function deleteDate(){
    const db = await SQLite.open('./mybackend');

    const supprDate = await db.run('DELETE FROM date_by_event WHERE eventDate = "2021-12-29"');

    db.close

    return supprDate
}

getAllEvents()
//insertNewDate(1, '2021-12-30')
//updateDate()
//deleteDate() 