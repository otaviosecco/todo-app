'use strict'
const mongoose = require('mongoose')
const Schema = mongoose.Schema

const TaskSchema = new Schema({
  name: String,
  date: Date,
  category: String,
  completed: Boolean,
}, {
  collection: 'task',
  timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' },
  toObject: { virtuals: true },
  toJSON: { virtuals: true },
  versionKey: false
})

module.exports = mongoose.model('Task', TaskSchema)
