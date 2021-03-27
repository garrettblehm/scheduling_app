# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Ensure shit is clean
User.destroy_all
Business.destroy_all

User.create(name: 'Admin', email: 'admin@email.com', password: 'password', admin: true)
User.create(name: 'John User', email: 'user@email.com', password: 'password')
owner = User.create(name: 'Bill Owner', email: 'owner@email.com', password: 'password')

Business.create(user: owner, name: "Bill's Dev Class",
                description: 'We offer a broad range of classes that allow you to be the best developer you can be!',
                address: { street: '123 Address', city: 'City', state: 'State', zipcode: '12345' })
User.all.each(&:confirm)
