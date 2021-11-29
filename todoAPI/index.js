'use strict';

const Hapi = require('@hapi/hapi');
const config = require('./config')
const Task = require('./task')

const init = async () => {

    const server = Hapi.server({
        port: 3000,
        host: 'localhost'
    });

    server.route({
        method: 'POST',
        path: '/',
        handler: async (request, h) => {
            try {
                config.dbConnection()
                const payload = request.payload
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

                console.log('Teve um GET hein PORRA')
                const tasks = await Task.find({})
                // const tasks = {}
                console.log(tasks)
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

                console.log('Morreu')
                await Task.deleteOne({_id: taskid})
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
