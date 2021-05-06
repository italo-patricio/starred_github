const getUserByLoginQuery = r''' 
  query($login: String!) { 
    user(login: $login){
      name
      login
      avatarUrl
      bio
      location
      email
      url
      starredRepositories{
        totalCount
        nodes{
          name
          description
          stargazerCount
        }
      }
    }
  }
''';

const searchUsersBy = r'''
  query($search: String!) {
    search(type: USER, first: 100, query: $search) {
      nodes {
        ... on User {
            name
            login
            avatarUrl
            bio
            location
            email
            url
        }
      }
    }
  }
''';
