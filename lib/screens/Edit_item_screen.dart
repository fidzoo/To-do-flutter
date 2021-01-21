import 'package:flutter/material.dart';
import 'package:first_list_app/components/number_picker.dart';
import 'package:first_list_app/components/dropdown_list.dart';
import 'package:first_list_app/models/dropdowns_data.dart';
import 'package:first_list_app/models/item.dart';
import 'package:first_list_app/functionality/items_crud.dart';
import 'package:first_list_app/components/simple_alert_box.dart';
import 'package:provider/provider.dart';

class EditItemScreen extends StatefulWidget {
  static const String screenId = 'edit_item_screen';
  final int positionIndex;
  final Item itemData;

  //Constructor method
  EditItemScreen({@required this.itemData, @required this.positionIndex});

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final _formKey = GlobalKey<FormState>(); //to use it in Form validation

  int _barCode; //TODO: make if statement in case of the user will add barcode himself
  String _name;
  int _qty = 1;
  int _unitType;
  double _unitPrice;
  String _notes;

  //to update the qty variable when press the counter
  _updateQty(int newValue) {
    _qty = newValue;
  }

  @override
  Widget build(BuildContext context) {
    //check if there is no result
    if (widget.itemData.name == '') {
      //will launch after the build is complete
      WidgetsBinding.instance.addPostFrameCallback((_) => showSimpleAlertBox(
          'تعذر العثور على المنتج',
          'تعذر العثور على المنتج برجاء إدخاله يدويًا',
          context));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تعديل بيانات العنصر'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'بار كود:  ${widget.itemData.barCode.toString()}',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: widget.itemData.name.toString(),
                      textDirection: TextDirection.rtl,
                      onSaved: (value) => _name = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'من فضلك أدخل إسم المنتج';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  androidDropdown(
                    itemsUnits,
                  ), //this is the unites ex. "1 case, 1 bottle"
                  NumberPicker(
                    startNumber: widget.itemData.qty.toInt(),
                    getNumber: _updateQty,
                  ), //from components folder
                  Text(
                    'الكمية: ',
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      initialValue: '${0.00.toString()}',
                      textDirection: TextDirection.rtl,
                      onSaved: (value) => _unitPrice = double.parse(value),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text(
                      'السعر: ',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'ملاحظات'),
                      textDirection: TextDirection.rtl,
                      onSaved: (value) => _notes = value,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        final newItem = Item(
                          barCode:
                              widget.itemData.barCode, //convert string to int
                          name: _name,
                          qty: _qty.toDouble(),
                          unitPrice: _unitPrice,
                          notes: _notes,
                          isDone: false,
                        );

                        //using custom function to add the item
                        // ItemsCrud itemData = ItemsCrud();
                        // itemData.addItem(newItem);
                        Provider.of<ItemsCrud>(context, listen: false)
                            .updateItem(widget.positionIndex, newItem);

                        Navigator.pushNamed(
                            context, 'home_screen'); //back to home screen
                        //Navigator.pop(context);
                      }
                    },
                    child: Text('تعديل'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
