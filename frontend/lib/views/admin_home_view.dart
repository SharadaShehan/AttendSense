import 'package:flutter/material.dart';
import 'package:frontend/utilities/providers.dart';
import 'package:provider/provider.dart';
import 'package:frontend/utilities/persistent_store.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  int selectedViewIndex = 0;
  bool isLoading = false;

  logOut(GlobalVariablesProvider provider) async {
    setState(() {
      isLoading = true;
    });
    await removeToken();
    provider.updateLogout();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalVariablesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
        actions: [
          IconButton(
            onPressed: () => logOut(provider),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: const Text("Admin Home Page"),
    );
  }
}
