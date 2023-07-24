import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      onTap: () {
        context.push('/company', extra: company);
      },
      title: Text(
        company.name!,
        style: const TextStyle(fontSize: 14),
      ),
      leading: Icon(
        Icons.factory,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
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
