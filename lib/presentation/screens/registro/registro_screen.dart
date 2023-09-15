import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:analisis_roya/presentation/widgets/side_menu.dart';

class RegistroScreen extends StatelessWidget {
  static const String name = 'registro_screen';
  const RegistroScreen({super.key});

  final int currentStep = 0;
  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de datos'),
      ),
      body: const MultiStepForm(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  //final _firstnameController = TextEditingController();
  int _currentStep = 0;
  int selectValue = 1;
  int selectFruto = 1;
  int selectControl = 1;
  int selectFertil = 1;

  List<Step> getSteps() => [
      Step(
        title: const Text('Datos de la parcela'),
        content: Column(
          children: [
            const SizedBox(height: 5.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Código de Parcela',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Razón Social / Dueño',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Área evaluada del café (m²)',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Variedad de café',
                border: OutlineInputBorder()
              )
            ),
          ],
        )
        ),
      Step(
        title: const Text('Propiedad del cultivo'),
        content: Column(
          children: [
            const SizedBox(height: 5.0),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Densidad de plantas por parcela',
                border: OutlineInputBorder()
              )
            ),
             const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Distancia entre surcos',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Distancia entre plantas',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Edad del cultivo',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Especie asociada al cultivo',
                border: OutlineInputBorder()
              )
            ),
            ListTile(
              title: const Text('Frutal'),
              leading: Radio(value: 1,
                  groupValue: selectFruto,
                  onChanged: (value){
                    setState(() {
                      selectFruto = value!;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text('Forestal'),
              leading: Radio(value: 2,
                  groupValue: selectFruto,
                  onChanged: (value){
                    setState(() {
                      selectFruto = value!;
                    });
                  }
              ),
            ),
            const SizedBox(height: 10.0),
            const Text('Tipo de sombra'),
            ListTile(
              title: const Text('Temporal'),
              leading: Radio(value: 1,
                  groupValue: selectValue,
                  onChanged: (value){
                    setState(() {
                      selectValue = value!;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text('Intermedio'),
              leading: Radio(value: 2,
                  groupValue: selectValue,
                  onChanged: (value){
                    setState(() {
                      selectValue = value!;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text('Permanente'),
              leading: Radio(value: 3,
                  groupValue: selectValue,
                  onChanged: (value){
                    setState(() {
                      selectValue = value!;
                    });
                  }
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Porcentaje de sombra',
                border: OutlineInputBorder()
              )
            ),
          ]
        )
        ),
      Step(
        title: const Text('Gestión del cultivo'),
        content: Column(
          children: [
            const SizedBox(height: 5.0),
            const Text('Control de Roya de café en los últimos 3 meses'),
            ListTile(
              title: const Text('Si'),
              leading: Radio(value: 1,
                  groupValue: selectControl,
                  onChanged: (value){
                    setState(() {
                      selectControl = value!;
                    });
                  }
              )
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio(value: 2,
                  groupValue: selectControl,
                  onChanged: (value){
                    setState(() {
                      selectControl = value!;
                    });
                  }
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tipo de control',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Producto utilizado',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            const Text('Fertilización en los últimos 4 meses'),
            ListTile(
              title: const Text('Si'),
              leading: Radio(value: 1,
                  groupValue: selectFertil,
                  onChanged: (value){
                    setState(() {
                      selectFertil = value!;
                    });
                  }
              )
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio(value: 2,
                  groupValue: selectFertil,
                  onChanged: (value){
                    setState(() {
                      selectFertil = value!;
                    });
                  }
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tipo de fertilización',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Producto utilizado',
                border: OutlineInputBorder()
              )
            )
          ]
        )
      ),
      Step(
        title: const Text('Cálculo de variables'),
        content: Column(
          children: [
            const SizedBox(height: 5.0),
            const Text('Árbol 1', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Superior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Media',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Inferior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Árbol 2', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Superior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Media',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Inferior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Árbol 3', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Superior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Media',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Inferior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Árbol 4', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Superior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Media',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Inferior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Árbol 5', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Superior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Media',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Rama Inferior',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Incidencia', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas Infectadas',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15.0,),
            const Text('Severidad', style: TextStyle(fontSize: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas con grado 0',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas con grado 1',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas con grado 2',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas con grado 3',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hojas con grado 4',
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 10.0,),

          ]
        )
        ),
    ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: getSteps(),
      onStepCancel: () {
        if(_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
        }
      },
      currentStep: _currentStep,
      onStepContinue: () {
        final isLastStep = _currentStep == getSteps().length -1;
        if(isLastStep) {
          showDialog( context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmar'),
              content: const Text('Tus datos han sido enviados exitosamente!'),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);},
                  child: const Text('OK'))
              ],
            );
          });
        } else {
          setState(() {
            _currentStep++;
          });
        }
        
      },

    );
  }
}