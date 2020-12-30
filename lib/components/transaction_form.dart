import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    // move o foco entre os TextField
    final node = FocusScope.of(context);
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
              onEditingComplete: () => node.nextFocus(),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: _submitForm,
                  child: Text('Nova Transação'),
                  textColor: Colors.purpleAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final title = titleController.value.text;
    final value = double.tryParse(valueController.value.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    onSubmit(title, value);
  }
}
