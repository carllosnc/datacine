import 'package:flutter/material.dart';
import '/imports.dart';

class PersonView extends StatefulWidget {
  final String id;

  const PersonView({super.key, required this.id});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> with PersonService {
  @override
  void initState() {
    super.initState();
    fetchPerson(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: LoadingView(),
      );
    }

    if (isError || !person.hasName) {
      return const Scaffold(
        body: ErrorView(),
      );
    }

    return PersonContent(person: person);
  }
}
