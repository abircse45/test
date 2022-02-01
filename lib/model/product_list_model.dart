// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.success,
    this.requestTime,
    this.responseTime,
    this.requestUrl,
    this.message,
    this.payload,
    this.payloadType,
  });

  bool? success;
  String? requestTime;
  String ?responseTime;
  String ?requestUrl;
  List<String>? message;
  List<Payload>? payload;
  String ? payloadType;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    success: json["success"],
    requestTime: json["requestTime"],
    responseTime: json["responseTime"],
    requestUrl: json["requestURL"],
    message: List<String>.from(json["message"].map((x) => x)),
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    payloadType: json["payloadType"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "requestTime": requestTime,
    "responseTime": responseTime,
    "requestURL": requestUrl,
    "message": List<dynamic>.from(message!.map((x) => x)),
    "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    "payloadType": payloadType,
  };
}

class Payload {
  Payload({
    this.id,
    this.active,
    this.deleted,
    this.dateUpdated,
    this.sku,
    this.name,
    this.upc,
    this.description,
    this.type,
    this.hasVariants,
    this.assemblyId,
    this.kitId,
    this.sellingPrice,
    this.suggestedRetailPrice,
    this.cost,
    this.availableQuantity,
    this.totalQuantity,
    this.unitId,
    this.unitName,
    this.weight,
    this.taxable,
    this.dropShip,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.customField5,
    this.customField6,
    this.imageUrl,
    this.useLotNumber,
    this.useSerialNumber,
    this.useManufacturingSerialNumber,
    this.useSerialForReceive,
    this.lotSerialEnabled,
    this.enableSerializedImageUpload,
  });

  int ?id;
  bool ?active;
  bool ?deleted;
  DateTime? dateUpdated;
  String ?sku;
  String ?name;
  Upc ?upc;
  Description ?description;
  Type? type;
  bool ?hasVariants;
  int? assemblyId;
  int ?kitId;
  dynamic ?sellingPrice;
  int ?suggestedRetailPrice;
  double? cost;
  dynamic availableQuantity;
  int? totalQuantity;
  int ?unitId;
  UnitName? unitName;
  int? weight;
  bool? taxable;
  bool ?dropShip;
  String? customField1;
  String ?customField2;
  String ?customField3;
  String ?customField4;
  String ?customField5;
  String? customField6;
  String ?imageUrl;
  bool? useLotNumber;
  bool ?useSerialNumber;
  bool ?useManufacturingSerialNumber;
  bool ?useSerialForReceive;
  bool ?lotSerialEnabled;
  bool ?enableSerializedImageUpload;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    // active: json["active"],
    // deleted: json["deleted"],
    // dateUpdated: DateTime.parse(json["date_updated"]),
 sku: json["sku"],
    name: json["name"],
    //  upc: upcValues.map![json["upc"]],
    //  description: descriptionValues.map![json["description"]],
    //  type: typeValues.map![json["type"]],
    //  hasVariants: json["has_variants"],
    //  assemblyId: json["assembly_id"],
    //  kitId: json["kit_id"],
    //  sellingPrice: json["selling_price"],
    // // suggestedRetailPrice: json["suggested_retail_price"],
    //  //cost: json["cost"].toDouble(),
    availableQuantity: json["available_quantity"],
    //  totalQuantity: json["total_quantity"],
    //  unitId: json["unit_id"],
    //  unitName: json["unit_name"] == null ? null : unitNameValues.map![json["unit_name"]],
    //  weight: json["weight"],
    //  taxable: json["taxable"],
    //  dropShip: json["drop_ship"],
    //  customField1: json["custom_field1"],
    //  customField2: json["custom_field2"],
    //  customField3: json["custom_field3"],
    //  customField4: json["custom_field4"],
    //  customField5: json["custom_field5"],
    //  customField6: json["custom_field6"],
    //  imageUrl: json["image_url"],
    //  useLotNumber: json["use_lot_number"],
    //  useSerialNumber: json["use_serial_number"],
    //  useManufacturingSerialNumber: json["use_manufacturing_serial_number"],
    //  useSerialForReceive: json["use_serial_for_receive"],
    //  lotSerialEnabled: json["lot_serial_enabled"],
    //  enableSerializedImageUpload: json["enable_serialized_image_upload"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "deleted": deleted,
    "date_updated": dateUpdated!.toIso8601String(),
    "sku": sku,
    "name": name,
    "upc": upcValues.reverse![upc],
    "description": descriptionValues.reverse![description],
    "type": typeValues.reverse![type],
    "has_variants": hasVariants,
    "assembly_id": assemblyId,
    "kit_id": kitId,
    "selling_price": sellingPrice,
    "suggested_retail_price": suggestedRetailPrice,
    "cost": cost,
    "available_quantity": availableQuantity,
    "total_quantity": totalQuantity,
    "unit_id": unitId,
    "unit_name": unitName == null ? null : unitNameValues.reverse![unitName],
    "weight": weight,
    "taxable": taxable,
    "drop_ship": dropShip,
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "custom_field5": customField5,
    "custom_field6": customField6,
    "image_url": imageUrl,
    "use_lot_number": useLotNumber,
    "use_serial_number": useSerialNumber,
    "use_manufacturing_serial_number": useManufacturingSerialNumber,
    "use_serial_for_receive": useSerialForReceive,
    "lot_serial_enabled": lotSerialEnabled,
    "enable_serialized_image_upload": enableSerializedImageUpload,
  };
}

enum Description { EMPTY, PCW_2512_NPT, PUMP_KTI_12_V_SINGLE_ACTION_13_QT_RE_MAN, PUMP_KTI_12_V_SINGLE_ACTION_6_QT_RE_MAN, PUMP_KTI_12_V_DOUBLE_SINGLE_6_QT_WITH_3_BUTTON_PENDANT_RE_MAN, PUMP_KTI_12_V_DOUBLE_ACTION_6_QT_RE_MAN }

final descriptionValues = EnumValues({
  "": Description.EMPTY,
  "PCW-2512-NPT": Description.PCW_2512_NPT,
  "Pump, KTI 12V Double Action 6qt. re-man": Description.PUMP_KTI_12_V_DOUBLE_ACTION_6_QT_RE_MAN,
  "Pump, KTI 12V Double/Single 6qt. With 3 Button Pendant re-man": Description.PUMP_KTI_12_V_DOUBLE_SINGLE_6_QT_WITH_3_BUTTON_PENDANT_RE_MAN,
  "Pump, KTI 12V Single Action 13qt. re-man": Description.PUMP_KTI_12_V_SINGLE_ACTION_13_QT_RE_MAN,
  "Pump, KTI 12V Single Action 6qt. re-man": Description.PUMP_KTI_12_V_SINGLE_ACTION_6_QT_RE_MAN
});

enum Type { ASSEMBLY, INVENTORY, KIT, SERVICE }

final typeValues = EnumValues({
  "Assembly": Type.ASSEMBLY,
  "Inventory": Type.INVENTORY,
  "Kit": Type.KIT,
  "Service": Type.SERVICE
});

enum UnitName { N_A }

final unitNameValues = EnumValues({
  "N/A": UnitName.N_A
});

enum Upc { EMPTY, BOM_1, ONEPLUS, SUB_002 }

final upcValues = EnumValues({
  "BOM-1": Upc.BOM_1,
  "": Upc.EMPTY,
  "Oneplus": Upc.ONEPLUS,
  "SUB-002": Upc.SUB_002
});

class EnumValues<T> {
  Map<String, T> ?map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
