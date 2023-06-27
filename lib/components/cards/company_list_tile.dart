import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class CompanyListTile extends StatelessWidget {
  final Company company;

  const CompanyListTile({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        company.name!,
        style: const TextStyle(fontSize: 15),
      ),
      leading: Icon(
        Icons.apartment,
        color: ProjectColors(context).featured,
      ),
      subtitle: Text(
        company.originCountry!.isEmpty ? '―' : company.originCountry ?? '―',
        style: TextStyle(
          fontSize: 12,
          color: ProjectColors(context).featured,
        ),
      ),
    );
  }
}
