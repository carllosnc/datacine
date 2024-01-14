import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

createNewCategory(BuildContext context) {
  return VWPage.open(
    context: context,
    appBar: AppBar(
      title: const FloatPageTitle(text: "New Category"),
    ),
    body: const CategoryForm(),
  );
}

class CategoryForm extends StatelessWidget {
  const CategoryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: VWColumn(
        padding: const EdgeInsets.all(20),
        gap: 20,
        children: [
          TextFormField(
            controller: nameController,
            validator: Validatorless.required('Name is required'),
            decoration: const InputDecoration(
              labelText: 'Name',
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          TextFormField(
            controller: descriptionController,
            validator: Validatorless.required('Description is required'),
            decoration: const InputDecoration(
              labelText: 'Description',
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          const Spacer(),
          VWButton(
            color: AppColors.buttonColor,
            label: 'Save',
            onTap: () {
              if (formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
