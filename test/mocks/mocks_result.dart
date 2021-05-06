const mockResultSuccess = {
  "user": {
    "name": "Italo ",
    "login": "italo-patricio",
    "avatarUrl":
        "https://avatars.githubusercontent.com/u/4944749?u=a64253a4395752b285b2f1dc7d5990c1f3ae83f5&v=4",
    "bio": "",
    "location": "Natal-RN",
    "email": "italopatriciosouza@hotmail.com",
    "url": "https://github.com/italo-patricio"
  }
};

const mockResultError = {
  "data": {"user": null},
  "errors": [
    {
      "type": "NOT_FOUND",
      "path": ["user"],
      "locations": [
        {"line": 2, "column": 2}
      ],
      "message": "Could not resolve to a User with the login of 'italo-pa'."
    }
  ]
};

const mockResultSearch = {
  "search": {
    "nodes": [
      {
        "name": "Italo ",
        "avatarUrl":
            "https://avatars.githubusercontent.com/u/4944749?u=a64253a4395752b285b2f1dc7d5990c1f3ae83f5&v=4",
        "bio": "",
        "location": "Natal-RN",
        "email": "italopatriciosouza@hotmail.com",
        "url": "https://github.com/italo-patricio"
      }
    ]
  }
};
