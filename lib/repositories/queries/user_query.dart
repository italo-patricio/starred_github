const getRepoByUserQuery = r''' 
  query($login: String!) { 
    user(login: $login){
    name
    login
    company
    }
  }
''';
