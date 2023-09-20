import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

mixin PersonService<T extends StatefulWidget> on State<T> {
  PersonDetailsRepository personDetailsRepository = PersonDetailsRepository(
    http.Client(),
  );

  bool isLoading = true;
  bool isError = false;
  late PersonDto person;

  fetchPerson({required dynamic id}) async {
    try {
      var (personDetails, _) = await personDetailsRepository.getPerson(id: id);

      setState(() {
        person = PersonDto(person: personDetails);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }
}
