import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 75,
                    child: Image.asset("assets/images/logo-test.png", scale: 1,),
                  ),
                ),
                const Text(
                  'Rodrick Green',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
          ),
          const ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          const ListTile(
            leading: Icon(Icons.business_center),
            title: Text('Guided Business Creation'),
          ),
          const ListTile(
            leading: Icon(Icons.create),
            title: Text('Create My Specific Portal'),
          ),
          const ListTile(
            leading: Icon(Icons.center_focus_weak),
            title: Text('My Goals With The Platform'),
          ),
          const ListTile(
            leading: Icon(Icons.credit_score),
            title: Text('Business Credit Builder Tracker'),
          ),
          const ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Business Credibility Checklist'),
          ),
          const ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Business Tradelines'),
          ),
          const ListTile(
            leading: Icon(Icons.money),
            title: Text('Financing For Products'),
          ),
          const ListTile(
            leading: Icon(Icons.payment),
            title: Text('Create My Business Financing Plan'),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Create My Business Credit Building Plan'),
          ),
        ],
      ),
    );
  }
}