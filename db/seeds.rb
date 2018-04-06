u = User.create(name: 'Bill', email: 'bill@gmail.com')
u2 = User.create(name: 'Valerie', email: 'val@gmail.com')
u3 = User.create(name: 'Patricio', email: 'pat@gmail.com')

c = Code.create(code: 'A15', title: 'Respiratory tuberculosis', billable: false)
c2 = Code.create(code: 'A15.0', title: 'Tuberculosis of lung', billable: true, parent_id: 'c' )
c3 = Code.create(code: 'A15.4', title: 'Tuberculosis of intrathoracic lymph nodes', billable: true, parent_id: 'c')

# e = Exclusion.create(type:'1', description: 'tuberculosis specified as primary (A15.7)', code_id: 'c3')


f = Favorite.create(user_id: 'u2', code_id: 'c')
f1 = Favorite.create(user_id: 'u2', code_id: 'c2')
f2 = Favorite.create(user_id: 'u2', code_id: 'c3')

i = InclusionTerm.create(description: 'Tuberculous bronchiectasis', code_id: 'c2')
i2 = InclusionTerm.create(description: 'Tuberculous fibrosis of lung', code_id: 'c2')

r = Recent.create(user_id: 'u', code_id: 'c2')
r2 = Recent.create(user_id: 'u', code_id: 'c3')
r3 = Recent.create(user_id: 'u2', code_id: 'c2')
r4 = Recent.create(user_id: 'u3', code_id: 'c3')
