import SQLite from "sqlite-async"

async function gotAllEvent(){
    const db = await SQLite.open('./mybackend')

    const allEvent = await db.all('SELECT * FROM event')
    console.log(allEvent)

    db.close()

    return allEvent
}

async function 
gotAllEvent()