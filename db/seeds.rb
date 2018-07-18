user = User.create(name: 'Luke Skywalker',
                   email: 'luke@republic.com',
                   password: 'maytheforcebewithyou')

50.times { user.rewards.create(status: rand(0..5)) }
