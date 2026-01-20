class BestSellerModel {
  String? id;
  String? title;
  String? imgCover;
  int? price;
  int? priceAfterDiscount;
  int? discount;
  BestSellerModel({this.id,this.title,this.imgCover,this.price,this.priceAfterDiscount,this.discount});
  int get discountPercentage{
    final int originalPrice=price ?? 0;
    final int discountedAmount=discount ?? 0;
    if(originalPrice<=0 || discountedAmount<=0 || originalPrice<discountedAmount){
      return 0;
    }
    if(originalPrice>=0 && discountedAmount==originalPrice){
      return 15;
    }
    return ((discountedAmount/originalPrice)*100).round();
  }
  int get finalPriceAfterDiscount{
    final int originalPrice=price ?? 0;
    if (originalPrice <=0){
      return 0;
    }
    final int apiDiscountedPrice=discount ?? 0;
    if(originalPrice>0 && originalPrice>apiDiscountedPrice){
      return apiDiscountedPrice;
    }
    return (originalPrice*0.85).round();
  }
}