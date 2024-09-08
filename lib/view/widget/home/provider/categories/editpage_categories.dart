import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/categories_contorollers.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/core/shared/costumtextformglobal.dart';

class EditpageCategories extends StatelessWidget {
  const EditpageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Categories"),
        ),
        body: GetBuilder<EditController>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Costumtextformglobal(
                            hint: "Enter categories name",
                            label: "categories name",
                            iconData: Icons.category,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 15, "type");
                            }),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green.shade100),
                          child: MaterialButton(
                              onPressed: () {
                                controller.shooseImage();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("choose image category"),
                                  Icon(Icons.image_outlined)
                                ],
                              )),
                        ),
                        const SizedBox(height: 10),
                        controller.file != null
                            ? Image.file(controller.file!,
                                height: 100, width: 100)
                            : const Text(
                                "Aucune image sélectionnée",
                                textAlign: TextAlign.center,
                                style: Styles.hintstyle,
                              ),
                        const SizedBox(height: 10),
                        MaterialButton(
                            onPressed: () {
                              controller.editCategoris();
                            },
                            child: const Text("save"))
                      ],
                    ),
                  ),
                )));
  }
}










/* 

import 'package:flutter/material.dart';

class AddCategoriesPage extends StatefulWidget {
   */
/* const AddCategoriesPage({super.key});

  @override
  _AddCategoriesPageState createState() => _AddCategoriesPageState();
}

class _AddCategoriesPageState extends State<AddCategoriesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Envoyer les données au backend ici
      String name = _nameController.text;
      if (_imageFile != null) {
        // Appeler une fonction pour envoyer les données au backend
        await _uploadData(name, _imageFile!);
      } else {
        // Afficher une alerte si l'image n'est pas sélectionnée
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an image')),
        );
      }
    }
  }

  Future<void> _uploadData(String name, XFile image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'http://192.168.8.129:3000/provider/food/lunch/categories/add.php'),
    );

    request.fields['categories_name'] = name;
    request.files.add(
      await http.MultipartFile.fromPath('categories_image', image.path),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Upload success');
    } else {
      print('Upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Categories")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _imageFile == null
                  ? Text("No image selected.")
                  : Image.file(File(_imageFile!.path)),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  } */

