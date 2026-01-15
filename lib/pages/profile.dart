// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';
// import 'package:pharmacyapp/services/shared_pref.dart';
// import 'login.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String? name;
//   String? email;
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }

//   // 🔹 LOAD USER DATA FROM SHARED PREF
//   Future<void> loadUserData() async {
//     name = await ShaedPrefrenceHelper().getUserName();
//     email = await ShaedPrefrenceHelper().getUserEmail();

//     setState(() {
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 201, 198, 242),

//       body: loading
//           ? const Center(child: CircularProgressIndicator())
//           : Container(
//               margin: const EdgeInsets.only(top: 60),
//               child: Column(
//                 children: [

//                   // 🔹 PROFILE IMAGE
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage:
//                         AssetImage("images/boy_image.jpeg"),
//                   ),

//                   const SizedBox(height: 30),

//                   // 🔹 NAME CARD
//                   profileTile(
//                     icon: Icons.person,
//                     title: "Name",
//                     value: name ?? "Not Available",
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 EMAIL CARD
//                   profileTile(
//                     icon: Icons.email,
//                     title: "Email",
//                     value: email ?? "Not Available",
//                   ),

//                   const SizedBox(height: 30),

//                   // 🔹 LOGOUT
//                   actionTile(
//                     icon: Icons.logout,
//                     text: "Logout",
//                     onTap: () async {
//                       // clear prefs if needed
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => Login()),
//                       );
//                     },
//                   ),

//                   const SizedBox(height: 15),

//                   // 🔹 DELETE ACCOUNT (UI only)
//                   actionTile(
//                     icon: Icons.delete,
//                     text: "Delete Account",
//                     isDelete: true,
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   // 🔹 PROFILE INFO TILE
//   Widget profileTile({
//     required IconData icon,
//     required String title,
//     required String value,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon),
//           const SizedBox(width: 15),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: AppWidgets.lightTextStyle(14)),
//               Text(value,
//                   style: AppWidgets.headLineTextStyle(18)),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   // 🔹 ACTION TILE
//   Widget actionTile({
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//     bool isDelete = false,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           children: [
//             Icon(icon,
//                 color: isDelete ? Colors.red : Colors.black),
//             const SizedBox(width: 15),
//             Text(
//               text,
//               style: AppWidgets.headLineTextStyle(18),
//             ),
//             const Spacer(),
//             const Icon(Icons.arrow_forward_ios, size: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';
import 'package:pharmacyapp/services/shared_pref.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  String? email;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // 🔹 LOAD USER DATA FROM SHARED PREF
  Future<void> loadUserData() async {
    name = await ShaedPrefrenceHelper().getUserName();
    email = await ShaedPrefrenceHelper().getUserEmail();

    setState(() {
      loading = false;
    });
  }

  // 🔹 LOGOUT CONFIRMATION
  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Login()),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  // 🔹 DELETE ACCOUNT CONFIRMATION (UI ONLY)
  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
            "This action cannot be undone.\nAre you sure you want to delete your account?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Account delete feature not implemented"),
                ),
              );
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 198, 242),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [

                  // 🔹 PROFILE IMAGE
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("images/boy_image.jpeg"),
                  ),

                  const SizedBox(height: 30),

                  // 🔹 NAME
                  profileTile(
                    icon: Icons.person,
                    title: "Name",
                    value: name ?? "Not Available",
                  ),

                  const SizedBox(height: 15),

                  // 🔹 EMAIL
                  profileTile(
                    icon: Icons.email,
                    title: "Email",
                    value: email ?? "Not Available",
                  ),

                  const SizedBox(height: 30),

                  // 🔹 LOGOUT
                  actionTile(
                    icon: Icons.logout,
                    text: "Logout",
                    onTap: showLogoutDialog,
                  ),

                  const SizedBox(height: 15),

                  // 🔹 DELETE ACCOUNT
                  actionTile(
                    icon: Icons.delete,
                    text: "Delete Account",
                    isDelete: true,
                    onTap: showDeleteDialog,
                  ),
                ],
              ),
            ),
    );
  }

  // 🔹 PROFILE INFO TILE
  Widget profileTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppWidgets.lightTextStyle(14)),
              Text(value, style: AppWidgets.headLineTextStyle(18)),
            ],
          )
        ],
      ),
    );
  }

  // 🔹 ACTION TILE
  Widget actionTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool isDelete = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isDelete ? Colors.red : Colors.black),
            const SizedBox(width: 15),
            Text(text, style: AppWidgets.headLineTextStyle(18)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
