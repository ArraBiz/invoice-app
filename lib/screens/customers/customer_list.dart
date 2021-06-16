import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/core/constants.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/models/customer.dart';
import 'package:invoice/providers.dart';
import 'package:invoice/repositories/customer_repository.dart';
import 'package:invoice/widgets/app_bar.dart';
import 'package:invoice/widgets/empty_list.dart';
import 'package:invoice/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:objectbox/objectbox.dart';

import 'customer_form.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList>
    with AutomaticKeepAliveClientMixin<CustomerList> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  late Stream<List<Customer>> _stream;
  late Store _store;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getTheme();
    customAppTheme = AppTheme.getCustomAppTheme();
    final store = context.read(storeNotifierProvider).state;
    final stream = CustomerRepository().getAll(store);

    setState(() {
      _stream = stream;
      _store = store;
      _loading = false;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          padding: Spacing.only(top: 48),
          color: customAppTheme.bgLayer1,
          child: Column(
            children: [
              ABAppBar(title: "Customers"),
              ABSearchBar(
                placeholder: "Search customers",
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      _stream = CustomerRepository().getAll(_store);
                    });
                  }
                  setState(() {
                    _stream = CustomerRepository().search(_store, value);
                  });
                },
              ),
              Expanded(
                child: !_loading
                    ? StreamBuilder<List<Customer>>(
                        stream: _stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return EmptyList(message: "No Customers");
                            }
                            return ListView.builder(
                              key: PageStorageKey('customer_list'),
                              padding: EdgeInsets.all(0),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final customer = snapshot.data![index];
                                return Dismissible(
                                  direction: DismissDirection.endToStart,
                                  background: Container(
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
                                    CustomerRepository()
                                        .delete(_store, customer.id);
                                  },
                                  key: UniqueKey(),
                                  child: ListItem(customer: customer),
                                );
                              },
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        })
                    : Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerForm(
                store: _store,
                mode: CREATE,
              ),
            ),
          );
        },
        child: Icon(
          MdiIcons.accountPlusOutline,
          size: MySize.size30,
          color: themeData.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Customer customer;

  const ListItem({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = AppTheme.getTheme();

    return InkWell(
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerForm(
              store: context.read(storeNotifierProvider).state,
              mode: UPDATE,
              customer: customer,
            ),
          ),
        );
      },
    );
  }
}
