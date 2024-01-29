import 'package:flutter/material.dart';
import 'package:flutter_firs_project/config/routes/route_names.dart';
import 'package:flutter_firs_project/config/utils/constants/user_list.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_button.dart';
import 'package:hive/hive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Ekleme"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: Color.fromARGB(255, 63, 101, 121),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              width: 300,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                  onPressed: () async {
                    await Hive.openBox("userList");
                    final userListBox = Hive.box("userList");
                    await userListBox
                        .put("users",
                            userList.map((user) => user.toMap()).toList())
                        .whenComplete(
                      () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Kullanıcılar Başarıyla Eklendi",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      text: "Kullanıcı Listesi",
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, RouteNames.userList);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  text: "Kullanıcı Ekle",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
