const getRepoByUserQuery = ''' 
  query { 
	user(login: "italo-patricioa"){
   name
   login
   company
  }
}
''';
