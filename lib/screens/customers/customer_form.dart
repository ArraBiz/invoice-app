import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice/core/constants.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/models/customer.dart';
import 'package:invoice/objectbox.g.dart';
import 'package:invoice/repositories/customer_repository.dart';
import 'package:invoice/widgets/form_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerForm extends StatefulWidget {
  final Store store;
  final Customer? customer;
  final String mode;

  const CustomerForm(
      {Key? key, required this.store, this.customer, required this.mode})
      : super(key: key);

  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  final _formKey = GlobalKey<FormState>();
  late Customer? customer;
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getTheme();
    customAppTheme = AppTheme.getCustomAppTheme();
    customer = widget.mode == UPDATE
        ? widget.customer
        : Customer(name: '', mobile: '', email: '', address: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customAppTheme.bgLayer1,
      appBar: AppBar(
        backgroundColor: customAppTheme.bgLayer1,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            MdiIcons.chevronLeft,
            color: themeData.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        title: Text("Create customer",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6!,
                fontWeight: 700)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(MySize.size16!),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 0),
                child: Text("Personal information",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600, letterSpacing: 0)),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size12!),
                      child: ABFormField(
                        initialValue:
                            widget.mode == UPDATE ? widget.customer?.name : '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        onSaved: (value) => customer?.name = value!.trim(),
                        hintText: "Name",
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size12!),
                      child: ABFormField(
                        initialValue:
                            widget.mode == UPDATE ? widget.customer?.email : '',
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              !_emailRegExp.hasMatch(value)) {
                            return 'Please enter valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            customer?.email = value?.trim().toLowerCase(),
                        hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size12!),
                      child: ABFormField(
                        initialValue: widget.mode == UPDATE
                            ? widget.customer?.mobile
                            : '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mobile number';
                          }
                          return null;
                        },
                        onSaved: (value) => customer?.mobile = value!,
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        hintText: "Mobile Number",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size24!, bottom: 0),
                child: Text("Billing information",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600, letterSpacing: 0)),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: ABFormField(
                        initialValue: widget.mode == UPDATE
                            ? widget.customer?.address
                            : '',
                        onSaved: (value) => customer?.address = value,
                        maxLines: 2,
                        hintText: "Address",
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size24!),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size4!)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(28),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: onSubmit,
                      child: Text(
                        "SAVE",
                        style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2!,
                                fontWeight: 600)
                            .merge(TextStyle(
                                color: themeData.colorScheme.onPrimary)),
                      ),
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(Spacing.xy(16, 0))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.mode == UPDATE) {
        CustomerRepository()
            .update(widget.store, customer!);
      } else {
        CustomerRepository()
            .create(widget.store, customer!);
      }
      Navigator.pop(context);
    }
  }
}
