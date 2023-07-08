import 'package:flutter/material.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;
import '/components/components.dart';
import '/domain/domain.dart';

class PersonView extends StatefulWidget {
  final String id;

  const PersonView({super.key, required this.id});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView>
    with AutomaticKeepAliveClientMixin<PersonView> {
  PersonDetailsRepository personDetailsRepository = PersonDetailsRepository(
    http.Client(),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var getPersonDetails = personDetailsRepository.getPerson(
      id: widget.id,
    );

    return FutureBuilder(
      future: getPersonDetails,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        ConnectionState connectionState = snapshot.connectionState;

        if (connectionState == ConnectionState.waiting) {
          return const LoadingView();
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        }

        var (PersonDetails person, _) = snapshot.data!;

        return PersonContent(person: person);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
