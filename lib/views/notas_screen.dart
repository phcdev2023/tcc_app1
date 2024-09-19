import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class NotasScreen extends StatefulWidget {
  final bool isProfessor;

  NotasScreen({required this.isProfessor});

  @override
  _NotasScreenState createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen> {
  String? _selectedAluno;
  String? _selectedDisciplina;
  final List<String> _alunos = ['Aluno 1', 'Aluno 2', 'Aluno 3'];
  final List<String> _disciplinas = ['Matemática', 'Português', 'Ciências'];

  // Exemplo de notas, seria substituído pelos dados reais
  final Map<String, Map<String, double>> _notasPorDisciplina = {
    'Matemática': {
      'Trabalho 01': 8.0,
      'Prova 01': 7.5,
    },
    'Português': {
      'Trabalho 01': 9.0,
      'Prova 01': 8.5,
    },
    'Ciências': {
      'Trabalho 01': 7.0,
      'Prova 01': 6.5,
    },
  };

  void _editNota(String key) {
    TextEditingController _notaController = TextEditingController(
        text: _notasPorDisciplina[_selectedDisciplina]![key].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Nota'),
          content: TextField(
            controller: _notaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notasPorDisciplina[_selectedDisciplina]![key] =
                      double.parse(_notaController.text);
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override // Dropdown selecionar aluno primeiro
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isProfessor)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecione um Aluno:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text('Escolha um aluno'),
                      value: _selectedAluno,
                      items: _alunos.map((String aluno) {
                        return DropdownMenuItem<String>(
                          value: aluno,
                          child: Text(aluno),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAluno = newValue;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            Text(
              'Selecione uma Disciplina:', // Selecionar a disciplina depois
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text('Escolha uma disciplina'),
                value: _selectedDisciplina,
                items: _disciplinas.map((String disciplina) {
                  return DropdownMenuItem<String>(
                    value: disciplina,
                    child: Text(disciplina),
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
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ),
            if (_selectedDisciplina != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _notasPorDisciplina[_selectedDisciplina]!.length,
                  itemBuilder: (context, index) {
                    String key = _notasPorDisciplina[_selectedDisciplina]!
                        .keys
                        .elementAt(index);
                    var nota = _notasPorDisciplina[_selectedDisciplina]![key];
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
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.assignment, color: Colors.blue),
                        ),
                        title: Text(
                          key,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Nota: ${nota}',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        trailing: widget.isProfessor
                            ? IconButton(
                                icon: Icon(Icons.edit, color: Colors.green),
                                onPressed: () {
                                  _editNota(key);
                                },
                              )
                            : null,
                        onTap: () {
                          // Lógica para exibir detalhes da nota
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
