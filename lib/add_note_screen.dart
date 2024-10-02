import 'package:flutter/material.dart';
import 'notes.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
  final Function(Note) onNoteAdded;
  AddNoteScreen({required this.onNoteAdded});
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final TextEditingController _noteControllerTitle = TextEditingController();
  final TextEditingController _noteControllerShortInfo = TextEditingController();
  final TextEditingController _noteControllerImageURL = TextEditingController();
  final TextEditingController _noteControllerFullInfo = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавьте новую позицию'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              scrollPadding: EdgeInsets.only(bottom: 40),
              controller: _noteControllerTitle,
              decoration: InputDecoration(
                labelText: 'Название',
              ),
              maxLines: 5,
            ),
            TextField(
              scrollPadding: EdgeInsets.only(bottom: 40),
              controller: _noteControllerImageURL,
              decoration: InputDecoration(
                labelText: 'Изображение в формате URL',
              ),
              maxLines: 5,
            ),
            TextField(
              scrollPadding: EdgeInsets.only(bottom: 40),
              controller: _noteControllerShortInfo,
              decoration: InputDecoration(
                labelText: 'Краткое описание',
              ),
              maxLines: 5,
            ),
            TextField(
              scrollPadding: EdgeInsets.only(bottom: 40),
              controller: _noteControllerFullInfo,
              decoration: InputDecoration(
                labelText: 'Полное описание',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_noteControllerTitle.text.isNotEmpty && _noteControllerImageURL.text.isNotEmpty && _noteControllerShortInfo.text.isNotEmpty && _noteControllerFullInfo.text.isNotEmpty) {
                  Note newNote = Note(name: _noteControllerTitle.text, text: _noteControllerShortInfo.text, imageUrl:_noteControllerImageURL.text, fullinfo: _noteControllerFullInfo.text);
                  widget.onNoteAdded(newNote);
                  Navigator.pop(context);
                }
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}