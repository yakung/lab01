import 'package:flutter/material.dart';
import 'detail_screen_dart.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }

}

class FirstScreenState extends State{
  List<String> _passsengers = <String>["", "1", "2", "3", "4", "5"];
  String _passenger = "1";

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
          _image = image;
        });
  }
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: (){
          getImage();
          },
      ),
      appBar: AppBar(
        title: Text("Frist Screen"),
      ),
      body: Column(
        children: <Widget>[
          _image == null ? Text("No image selected") : Image.file(_image, height: 200,),
          InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Passenger"
            ),
            isEmpty: _passenger == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: _passenger,
                isDense: true,
                onChanged: (value){
                  
                },
                items: _passsengers.map((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                },
                ).toList(),
              ),
            ),
          ),
          DateTimePickerFormField(
            inputType: InputType.date,
            format: DateFormat("yyyy-ttt-dd"),
            decoration: InputDecoration(labelText: "Date time"),
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'detail_screen_dart.dart';


// class FirstScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("First Screen"),
//       ),// Appbar
//       body: Center(
//         child: FlatButton(child:Text("go to second"),
//         onPressed: () {
//           //Navigator.pushName(context, "/second");
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailScreen(title: "Hello"),
//             ), 
//           );
//         },
//         ) //Text("First Screen"),
//       )// center
//     );//scafford
//   }
// }