
class ProductDetailsModel {
  int? product_id;
  int? max_order;
  List<Category>? category_list;
  String? product_name;
  String? sku;
  String? slug;
  String? business_name;
  int? seller_id;
  String? seller_slug;
  bool? will_show_emi;
  String? note;
  int? stock;
  bool? pre_order;
  int? booking_price;
  int? product_price;
  String? discount_charge;
  String? image;
  bool? is_event;
  String? event_id;
  bool? highlight;
  String? highlight_id;
  bool? groupping;
  String? groupping_id;
  String? campaign_section_id;
  bool? campaign_section;
  String? message;
  bool? seo;
  String? meta_keyword;
  String? meta_description;
  String? variation;
  String? banner_image;
  String? banner_image_link;
  String? attribute_value;
  String? icon_specification;
  int? product_review_avg;


  ProductDetailsModel({
    this.product_id,
    this.max_order,
    this.category_list,
    this.product_name,
    this.sku,
    this.slug,
    this.business_name,
    this.seller_id,
    this.seller_slug,
    this.will_show_emi,
    this.note,
    this.stock,
    this.pre_order,
    this.booking_price,
    this.product_price,
    this.discount_charge,
    this.image,
    this.is_event,
    this.event_id,
    this.highlight,
    this.highlight_id,
    this.groupping,
    this.groupping_id,
    this.campaign_section_id,
    this.campaign_section,
    this.message,
    this.seo,
    this.meta_keyword,
    this.meta_description,
    this.variation,
    this.banner_image,
    this.banner_image_link,
    this.attribute_value,
    this.icon_specification,
    this.product_review_avg
});

  factory ProductDetailsModel.fromJSON(Map<dynamic, dynamic> json) {
    return ProductDetailsModel(
      product_id: json["id"],
      max_order: json["maximum_order"],
      category_list: json["category_list"]?.map<Category>((x)=> Category.fromJSON(x))?.toList(),
      product_name: json["product_name"],
      sku: json["sku"],
      slug: json["slug"],
      business_name: json["buisness_name"],
      seller_id: json["seller_id"],
      seller_slug: json["seller_slug"],
      will_show_emi: json["will_show_emi"],
      note: json["note"],
      stock: json["stock"],
      pre_order: json["pre_order"],
      booking_price: json["booking_price"],
      product_price: json["product_price"],
      discount_charge: json["discount_charge"],
      image: json["image"],
      is_event: json["is_event"],
      event_id: json["event_id"],
      highlight: json["highlight"],
      highlight_id: json["highlight_id"],
      groupping: json["groupping"],
      groupping_id: json["groupping_id"],
      campaign_section_id: json["campaign_section_id"],
      campaign_section: json["campaign_section"],
      message: json["message"],
      seo: json["seo"],
      meta_keyword: json["meta_keyword"],
      meta_description: json["meta_description"],
      variation: json["variation"],
      banner_image: json["banner_image"],
      banner_image_link: json["banner_image_link"],
      attribute_value: json["attribute_value"],
      icon_specification: json["icon_specification"],
      product_review_avg: json["product_review_avg"]
    );
  }
}

class Category {
  int? cat_id;
  String? cat_name;
  String? slug;
  bool? isInactive;
  String? image;
  String? categoryicon;
  String? parent;
  String? parentslug;

  Category({
    this.cat_id,
    this.cat_name,
    this.slug,
    this.isInactive,
    this.image,
    this.categoryicon,
    this.parent,
    this.parentslug
});

  factory Category.fromJSON(Map<dynamic, dynamic> json) {
    return Category(
      cat_id: json["id"],
      cat_name: json["category_name"],
      slug: json["slug"],
      isInactive: json["is_inactive"],
      image: json["image"],
      categoryicon: json["category_icon"],
      parent: json["parent"],
      parentslug: json["parent_slug"]
    );
  }
}