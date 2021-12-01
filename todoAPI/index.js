'use strict';

const Hapi = require('@hapi/hapi');
const config = require('./config')
const Task = require('./task')
const { DateTime } = require("luxon");

const init = async () => {

    const server = Hapi.server({
        port: 3000,
        host: '192.168.0.103'
    });

    server.route({
        method: 'POST',
        path: '/',
        handler: async (request, h) => {
            try {
                config.dbConnection()
                const payload = request.payload

                payload.date = DateTime.fromISO(payload.date).plus({hours: 3})
                console.log(payload, payload.name)
                await Task(payload).save()

                return {statusCode: 201}
            } catch (e) {
                console.log(e)
            }
        }
    });
    server.route({
        method: 'GET',
        path: '/',
        handler: async (request, h) => {
            try {
                config.dbConnection()
                const {date, filter} = request.query

                const conditions = {}
                conditions.date = {$gte: new Date(DateTime.fromISO(date).startOf('day').toISO())}
                if (filter == 0){
                    conditions.date['$lt'] = new Date(DateTime.fromISO(date).endOf('day').toISO())
                }
                console.log(filter)
                console.log(conditions)
                const tasks = await Task.find(conditions)

                // const tasks = {}
                return tasks
            } catch (e) {
                console.log('Deu merda')
                console.log(e)
            }
        }
    });
    server.route({
        method: 'PUT',
        path: '/{taskid}',
        handler: async (request, h) =>{
            try{
                const id = request.params.taskid
                const payload = request.payload
                config.dbConnection()

                await Task.updateOne({_id:id}, {$set: payload})

                console.log(' mudou')
                return {statusCode: 204};
            }
            catch(e){
                console.log('Ta igual irmao')
                console.log(e)
            }
        }
    })

    server.route({

        method: 'DELETE',
        path: '/{taskid}',
        handler: async (request, h) => {
            try{

                const { taskid } = request.params
                config.dbConnection()

                await Task.deleteOne({_id: taskid})
                console.log('Morreu')
                return {statusCode: 204}
            }
            catch(e){
                console.log('Ele vive')
                console.log(e)
            }
        }
    })

    await server.start();
    console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {

    console.log(err);
    process.exit(1);
});

init();
