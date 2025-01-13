'use strict'

const mongoose = require('mongoose');

const dbConnection = async () => {
    try {
        await mongoose.connect('mongodb+srv://user:u0mjOdo927D4eluV@cluster0.nw1ci.mongodb.net/?retryWrites=true&w=majority&appName=Cluster', {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            // outras opções de configuração
        });
        console.log('Database connected');
    } catch (error) {
        console.error('Database connection error:', error);
    }
};

module.exports = { dbConnection };

//user
//u0mjOdo927D4eluV