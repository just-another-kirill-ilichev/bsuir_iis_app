import 'package:bsuir_iis_app/state/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Номер группы'),
                keyboardType: TextInputType.number,
                validator: _validateGroup,
                onSaved: (value) => _onGroupSaved(context, value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onGroupSaved(BuildContext context, String? value) async {
    var bloc = Provider.of<ScheduleBloc>(context, listen: false);

    if (value != null) {
      bloc.setGroup(value);
    }
  }

  String? _validateGroup(String? value) {
    if (value != null && value.length == 6 && int.tryParse(value) != null) {
      return null;
    } else {
      return 'Введите корректный номер группы';
    }
  }
}
