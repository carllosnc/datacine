import 'package:ds1/ds1.dart';
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
      title: DS1Text(company.name!, fontSize: 15),
      leading: Icon(
        Icons.apartment,
        color: ProjectColors(context).featured,
      ),
      subtitle: DS1Text(
        company.originCountry!.isEmpty ? '―' : company.originCountry ?? '―',
        fontSize: 12,
        fontColor: ProjectColors(context).featured,
      ),
    );
  }
}
