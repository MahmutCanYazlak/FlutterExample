import 'package:flutter/material.dart';
import 'package:flutter_firs_project/core/models/user.dart';
import 'package:hive/hive.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  //toMap() methodunu kullanarak User nesnesini Map'e çeviriyoruz.
  //fromMap() methodunu kullanarak Map'i User nesnesine çeviriyoruz.
  Future<List<User>> getUsers() async {
    Box box = Hive.box("userList");
    List<Map<String, dynamic>> userMapList = box.get("users");
    List<User> users = userMapList.map((e) => User.fromMap(e)).toList();
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcılar"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: Future.delayed(
          const Duration(seconds: 1),
          () => getUsers(),
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            List<User> userList = snapshot.data;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Kullanıcı Silme"),
                              content: Text(
                                  "${user.name} ${user.surname} adlı kullanıcıyı silmek istediğinize emin misiniz?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("İptal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    userList.removeAt(index);
                                    Box box = Hive.box("userList");
                                    box.put(
                                        "users",
                                        userList
                                            .map((e) => e.toMap())
                                            .toList());
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Sil"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.imageUrl),
                      ),
                      title: Text(
                        user.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color.fromARGB(255, 187, 138, 138),
                            ),
                      ),
                      subtitle: Text(
                        user.surname,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromARGB(255, 140, 135, 135),
                            ),
                      ),
                      trailing: Text(
                        user.age,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xffA4A4A4),
                            ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Kullanıcı bulunamadı"),
            );
          }
        },
      ),
    );
  }
}
