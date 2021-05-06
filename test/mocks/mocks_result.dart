const mockResultSuccess = {
  "user": {
    "name": "Italo ",
    "login": "italo-patricio",
    "company": "Elo7 @elo7 "
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
