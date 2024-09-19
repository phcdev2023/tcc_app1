import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DisciplinasScreen extends StatefulWidget {
  final bool isProfessor;

  DisciplinasScreen({required this.isProfessor});

  @override
  _DisciplinasScreenState createState() => _DisciplinasScreenState();
}

class _DisciplinasScreenState extends State<DisciplinasScreen> {
  String? _selectedDisciplina;

  final Map<String, List<String>> _disciplinasComPDFs = {
    'Matemática': ['Aula 01', 'Aula 02'],
    'Português': ['Aula 01', 'Aula 02'],
    'Ciências': ['Aula 01', 'Aula 02'],
  };

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione uma Disciplina:', // dropdown escolher diciplina
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.green[800],
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Escolha uma disciplina',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                value: _selectedDisciplina,
                items: _disciplinasComPDFs.keys.map((String disciplina) {
                  return DropdownMenuItem<String>(
                    value: disciplina,
                    child: Text(
                      disciplina,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDisciplina = newValue;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: isDarkMode ? Colors.white : Colors.green[800],
                  ),
                ),
              ),
            ),
            if (_selectedDisciplina != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _disciplinasComPDFs[_selectedDisciplina]!.length,
                  itemBuilder: (context, index) {
                    String pdf =
                        _disciplinasComPDFs[_selectedDisciplina]![index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.picture_as_pdf, color: Colors.red),
                        ),
                        title: Text(pdf),
                        trailing: IconButton(
                          icon: Icon(Icons.download, color: Colors.green[800]),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Baixando...'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            // Lógica para baixar o PDF
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (widget.isProfessor && _selectedDisciplina != null)
              Center(
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () => _addPDF(context),
                    child: Text('Adicionar Arquivo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _addPDF(BuildContext context) {
    // Lógica para adicionar um novo PDF
  }
}
