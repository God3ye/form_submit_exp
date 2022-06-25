import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget createPositionItem(String name) {
    return Text(name);
  }

  List<String> positions = ['Developer', 'Designer', 'Admin'];
  List<String> gender = ['Male', 'Female'];

  String? positionValue;
  String? radioGender;
  bool agreeCheckBox = false;

  final FocusNode userF = FocusNode();
  final FocusNode passwordF = FocusNode();
  // final TextEditingController userTextController = TextEditingController();
  // final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              //controller: userTextController,
              focusNode: userF,
              onEditingComplete: passwordF.requestFocus,
              decoration: const InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              //controller: passwordTextController,
              focusNode: passwordF,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 10, right: 5, top: 3),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: DropdownButton(
                value: positionValue,
                selectedItemBuilder: (_) => positions
                    .map(
                      (e) => Container(
                        alignment: Alignment.centerLeft,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                borderRadius: BorderRadius.circular(8.0),
                underline: const SizedBox(),
                hint: Container(
                  margin: const EdgeInsets.only(top: 13),
                  child: const Text('Choose Position'),
                ),
                isExpanded: true,
                items: positions
                    .map(
                      (a) => DropdownMenuItem(
                        child: createPositionItem(a),
                        value: a,
                      ),
                    )
                    .toList(),
                onChanged: (String? a) {
                  positionValue = a;
                  setState(() {});
                },
              ),
            ),
            Row(
              children: gender
                  .map(
                    (e) => Row(
                      children: [
                        Radio(
                            value: e,
                            groupValue: radioGender,
                            onChanged: (String? e) {
                              radioGender = e;
                              setState(() {});
                            }),
                        Text(e),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Row(
              children: [
                Checkbox(
                  value: agreeCheckBox,
                  onChanged: (e) {
                    agreeCheckBox = e!;
                    setState(() {});
                  },
                ),
                const Text('Agreed with Terms & Conditions'),
              ],
            ),
            SizedBox(
              height: size.height * 0.42,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
                style: ButtonStyle(elevation: MaterialStateProperty.all(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
