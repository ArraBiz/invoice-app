import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/models/customer.dart';
import 'package:invoice/providers.dart';
import 'package:invoice/repositories/customer_repository.dart';
import 'package:invoice/repositories/database_repository.dart';
import 'package:invoice/screens/customers/CustomerView.dart';
import 'package:invoice/widgets/CustomAppBar.dart';
import 'package:invoice/widgets/empty_list.dart';
import 'package:invoice/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';

import '../../objectbox.g.dart';
import 'customer_create.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late Store _store;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getTheme();
    customAppTheme = AppTheme.getCustomAppTheme();
    // DatabaseRepository().fetchStore().then((store) {
    //   final customerBox = store.box<Customer>();
    //   customerBox.removeAll();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _store = context.read(storeProvider).state!;
    return Scaffold(
      body: Container(
        padding: Spacing.only(top: 48),
        color: customAppTheme.bgLayer1,
        child: Column(
          children: [
            CustomAppBar(title: "Customers"),
            SearchBar(
              placeholder: "Search customers",
            ),
            Expanded(
              child: StreamBuilder<List<Customer>>(
                      stream: CustomerRepository().getAll(_store),
                      builder: (context, snapshot) {
                        print(snapshot.connectionState);
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          }

                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return EmptyList(
                                  message: "No customers found",
                                  themeData: themeData);
                            }
                            return ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final customer = snapshot.data![index];
                                return Dismissible(
                                  background: Container(
                                    color: themeData.primaryColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.accountEditOutline,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text("Edit",
                                              style: AppTheme.getTextStyle(
                                                  themeData
                                                      .textTheme.bodyText2!,
                                                  fontWeight: 500,
                                                  color: themeData
                                                      .colorScheme.onPrimary)),
                                        )
                                      ],
                                    ),
                                  ),
                                  secondaryBackground: Container(
                                    color: themeData.errorColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text("Delete",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2!,
                                                fontWeight: 500,
                                                color: customAppTheme.onError)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            MdiIcons.deleteOutline,
                                            color: customAppTheme.onError,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      setState(() {
                                        showSnackbarWithFloating(
                                            "Deleted", context);
                                      });
                                    } else {
                                      setState(() {
                                        showSnackbarWithFloating(
                                            "Edited", context);
                                      });
                                    }
                                  },
                                  key: UniqueKey(),
                                  child: ListItem(
                                    customer: customer,
                                    themeData: themeData,
                                  ),
                                );
                              },
                            );
                          }
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomerCreate(
                      store: context.read(storeProvider).state!)));
        },
        child: Icon(
          MdiIcons.accountPlusOutline,
          size: MySize.size30,
          color: themeData.colorScheme.onPrimary,
        ),
      ),
    );
  }

  void showSnackbarWithFloating(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Customer customer;
  final ThemeData themeData;

  const ListItem({Key? key, required this.customer, required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CustomerView()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Text(customer.name[0].toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1!,
                      color: themeData.colorScheme.onSecondary,
                      fontWeight: 700)),
              backgroundColor: themeData.colorScheme.secondary,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: <Widget>[
                    Text(customer.name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1!,
                            fontWeight: 600)),
                    Text(customer.mobile,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2!,
                            fontWeight: 500)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
