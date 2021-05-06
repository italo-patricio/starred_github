const mockResultSuccess = {
  "data": {
    "user": {
      "name": "Italo ",
      "login": "italo-patricio",
      "company": "Elo7 @elo7 "
    }
  }
};

const mockResultError = {
  "data": {"user": null},
  "errors": [
    {
      "type": "NOT_FOUND",
      "message": "Could not resolve to a User with the login of 'italopa'."
    }
  ]
};
